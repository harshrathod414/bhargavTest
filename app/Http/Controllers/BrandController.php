<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Brand;
use Validator;

class BrandController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        //
        $brands = Brand::with("childs")->sortable();
        $search = $request->search;
        if ($search && $search) {
            $brands = $brands->where(function ($query) use ($search) {
                $query->where('title', 'like', '%' . $search . '%')->orWhere('description', 'like', '%' . $search . '%');
            });
        }
        $brands = $brands->paginate(10);
        return view("brands/index", compact("brands"));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate(
            [
                "brand_title" => "required",
            ]
        );
        if (empty($request->slug)) {
            $slug = strtolower(trim(preg_replace('/[^A-Za-z0-9-]+/', '-', $request->brand_title)));
        } else {
            $slug = $request->slug;
        }

        if ($request->edit_id && $request->edit_id != "") {
            $brand =  Brand::where("id", $request->edit_id)->first();
            $checkExist = Brand::where("slug", $slug)->where("id", "!=", $request->edit_id)->first();
        } else {
            $brand = new Brand;
            $checkExist = Brand::where("slug", $slug)->first();
        }

        // $checkExist = Brand::where("slug", $slug)->first();
        if ($checkExist) {
            if ($request->edit_id && $request->edit_id != "") {
                $check = Brand::where("slug", "like",  $slug . "-%")->where("id", "!=", $request->edit_id)->first();
            } else {
                $check = Brand::where("slug", "like",  $slug . "-%")->first();
            }
            // $check = Brand::where("slug", "like",  $slug . "-%")->first();
            if ($check) {
                $string = $check->slug;
                $exploded = explode('-', $string);
                $no = end($exploded);
                $s = $slug . "-" . $no + 1;
            } else {
                $s = $slug . "-1";
            }
        } else {
            $s = $slug;
        }
        if ($request->hasFile('image')) {
            if ($request->edit_id && $request->edit_id != "" && $brand->brand_image != "") {
                unlink(public_path('uploads/brands/' . $brand->brand_image));
            }
            $file = $request->file('image');
            $extension = $file->getClientOriginalExtension();
            $filename = "brand-image-" . $s . "-" . time() . '.' . $extension;
            $file->move(public_path('uploads/brands/'), $filename);
            $brand->brand_image = $filename;
        }
        $brand->title = $request->brand_title;
        $brand->description = $request->description;
        $brand->parent_id = $request->parent_id ? $request->parent_id : null;
        $brand->slug = $s;
        $brand->save();
        if ($request->edit_id && $request->edit_id != "") {
            return redirect()->back()->with("success", "Brand updated successfully");
        } else {
            return redirect()->back()->with("success", "Brand added successfully");
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $brand = Brand::find($id);
        return response()->json($brand);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $brand = Brand::where("id", $id)->first();
        if ($brand->brand_image != "") {
            unlink(public_path('uploads/brands/' . $brand->brand_image));
        }
        $brand->delete();
    }
    public function bulkAction(Request $request)
    {
        $selectedIds =  $request->selectedIds;
        $action = $request->action;
        if ($action == "delete") {
            Brand::whereIn("id", $selectedIds)->delete();
        }
    }
}
