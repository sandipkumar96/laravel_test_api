<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Validator;
use App\Http\Models\city_travel_history;
class TravelController extends Controller
{
    //
    protected $request;
    protected $city_travel_history;

    public function __construct(Request $request) {
        $this->request = $request;
        $this->city_travel_history = new city_travel_history();
    }
    public function travelHistory(){
        $rules=array(
            'user_id' => 'required',
            'from_date' => 'date_format:Y-m-d',
            'to_date' => 'date_format:Y-m-d',
        );
        $validator=Validator::make($this->request->all(),$rules);
        if($validator->fails())
        {
            $res = array(
                'status' => 400,
                'message' => $validator->errors()
            );
        }else{
            $return_data = $this->city_travel_history->fetchTravelHistory($this->request->all());
            if(!empty($return_data)){
                $res = array(
                    'status' => 200,
                    'data' => $return_data,
                    'message' => 'Data Found!'
                );
            }else{
                $res = array(
                    'status' => 200,
                    'message' => 'No Data Found!'
                );
            }
        }
        return response()->json($res);
    }

    public function travellersCountByCity(){
        $rules=array(
            'from_date' => 'required|date_format:Y-m-d',
            'to_date' => 'required|date_format:Y-m-d',
        );
        $validator=Validator::make($this->request->all(),$rules);
        if($validator->fails()){
            $res = array(
                'status' => 400,
                'message' => $validator->errors()
            );
        }else{
            $return_data = $this->city_travel_history->fetchTravellersCountByCity($this->request->all());
            if(!empty($return_data)){
                $res = array(
                    'status' => 200,
                    'data' => $return_data,
                    'message' => 'Data Found!'
                );
            }else{
                $res = array(
                    'status' => 200,
                    'message' => 'No Data Found!'
                );
            }
        }
        return response()->json($res);
    }
}
