<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Category;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = Category::whereNull('deleted_at')->whereStatus('ACTIVE')->latest()->get();
        return response()->json(['status' => true, 'data' => $categories]);
    }
   
    public function categoryById($id)
    {
        $category = Category::findOrFail($id);
        if($category) return response()->json(['status' => true, 'data' => $category]);
        else return response()->json(['status' => false, 'message' => 'Category not available.']);
    }

    public function categoryBySlug($slug)
    {
        $category = Category::where('slug', $slug)->first();
        if($category) return response()->json(['status' => true, 'data' => $category]);
        else return response()->json(['status' => false, 'message' => 'Category not available.']);
    }
}
