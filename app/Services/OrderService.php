<?php

namespace App\Services;
use App\Models\Order;

class OrderService {

	public function calculateTotal($order){
		$order->total_line_items = 0;
		foreach($order->order_items as &$order_item){
			$order_item->amount_before_discount = $order_item->quantity * $order_item->price;
            $order_item->total_tax = 0;
            $order_item->total_discount = 0;
			$order_item->amount_after_discount = $order_item->amount_before_discount - $order_item->total_discount;
			$order_item->grand_total = $order_item->amount_after_discount;

			$order->total_line_items += $order_item->quantity * $order_item->price;
			$order->total_tax += $order_item->total_tax;
			$order->total_discount += $order_item->total_discount;
			$order->grand_total += $order_item->grand_total;

			$order_item->save();
		}

		$order->save();
	}

	public function generateOrderReference()
	{
		$year = date('Ymd');

		$prefix = 'TX'.$year;

		$model = Order::whereNotNull('order_reference')->where('order_reference', 'like', $prefix.'%')->withTrashed();
		$count = $model->count();
		$sequence = str_pad($count+1, 4, "0", STR_PAD_LEFT);

		$order_reference = $prefix. '-' . $sequence;

		return $order_reference;
	}
}
