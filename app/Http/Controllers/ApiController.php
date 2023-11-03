<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Qrcode;
use App\Models\User;
class ApiController extends Controller
{
    //
    public function __construct(){
        $this->middleware("auth:sanctum");
    }
    
    public function productos(Request $request){
        if($request->has("id")){
            $id = $request->input('id')};
            $productos = Qrcode::where('id',$id)->get();
        }else{
            $productos = Qrcode::all();
        }
        return response()->json($productos);
}
