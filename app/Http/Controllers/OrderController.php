<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Payment;
use App\Services\OrderService;

use Validator, Carbon\Carbon;

class OrderController extends Controller
{
    public function cart()
    {
        $orders = Order::where('customer_id', auth()->user()->id)->with(['order_items.event','order_items.event_schedule','customer','payment_method'])->get();
        return response()->json(['status' => true, 'data' => $orders]);
    }

    public function addToCart(Request $request)
    {   
        $validator = Validator::make($request->all(), [
            'customer_id'=>'required',
        ]);

        if ($validator->fails()) {
            $messages = $validator->messages();
            return response()->json(['status' => false, 'message' => $messages]);
        }

        $store = new Order;
        $store->fill($request->all());
        $store->payment_method_id = 0;
        $store->status = 'CART';
        
        if($store->save()){
            $order_items = [];
            foreach($request->order_items as $item){
                $order_items[] = new OrderItem($item);
            }
            $store->order_items()->saveMany($order_items);

            return response()->json(['status' => true, 'message' => 'Add to cart successfully.']);
        }
        return response()->json(['status' => false, 'message' => 'Add to cart failed.']);
    }

    public function deleteFromCart(Request $request, $id)
    {   
        $order_item = OrderItem::findOrFail($id);
        if($order_item->delete()){
            return response()->json(['status' => true, 'message' => 'Delete from cart successfully.']);
        }
        return response()->json(['status' => false, 'message' => 'Delete from cart failed.']);
    }

    public function checkout(Request $request)
    {   
        $validator = Validator::make($request->all(), [
            'customer_id'=>'required',
            'payment_method_id'=>'required',
        ]);

        if ($validator->fails()) {
            $messages = $validator->messages();
            return response()->json(['status' => false, 'message' => $messages]);
        }

        $order = Order::find($request->id);
        $order->fill($request->all());
        $order->order_reference = (new OrderService())->generateOrderReference();
        $order->status = 'UNPAID';
        $order->save();

        (new OrderService())->calculateTotal($order);
        
        // create payment
        // post to payment gateway, VA Number, eWallet

        
        // save return of payment gateway
        $payment = new Payment;
        $payment->order_id = $order->id;
        $payment->external_id = '000000'; // transaction id payment gateway
        $payment->payment_method_id = $order->payment_method_id;
        $payment->number = '0000000'; // virtual account number or credit card number
        $payment->expired_at = Carbon::now()->addHour(); // 1 hours expired for VA
        $payment->save();
        
        if($store){
            return response()->json(['status' => true, 'data' => $order]);
        }
        return response()->json(['status' => false, 'message' => 'Checkout failed.']);
    }

    public function payment(Request $request)
    {   
        $order = Order::where('order_reference', $request->order_id)->first();
        if($request->transaction_status == 'settlement'){
            $paid_amount = 0;

            foreach($request->payment_amounts as $pay){
                $paid_amount += $pay['amount'];
            }

            // check nominal
            if($order->grand_total == $paid_amount){
                $order->status = 'PAID';
                $order->save();

                // save return of payment gateway
                $payment = Payment::where('order_id', $order->id)->first();
                $payment->paid_amount = $paid_amount;
                $payment->paid_at = Carbon::now();
                $payment->save();
            }
        }
        return response()->json(['status' => true, 'message' => 'Success']);
    }

}
