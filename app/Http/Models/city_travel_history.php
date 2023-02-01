<?php

namespace App\Http\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class city_travel_history extends Model
{
    protected $table = 'city_travel_history';
    protected $primaryKey = 'id';
    
    public function fetchTravelHistory($request){
        $from_date = $to_date = '';
        $data = array();
        $sql = "SELECT city_name, from_date, to_date FROM city_travel_history 
                INNER JOIN cities ON city_travel_history.city_id = cities.id 
                WHERE traveller_id=:traveller_id ";
        $bindValues = array(':traveller_id' => $request['user_id']);
        if(isset($request['from_date']) && !empty($request['from_date']) && isset($request['to_date']) && !empty($request['to_date'])){
            $sql .= "  AND DATE_FORMAT(from_date,'%Y-%m-%d') >= :from_date AND DATE_FORMAT(to_date,'%Y-%m-%d') <= :to_date";
            $bindValues[':from_date'] = $request['from_date'];
            $bindValues[':to_date'] = $request['to_date'];
        }
        $sql .= " ORDER BY from_date asc";
        $data = DB::select(DB::raw($sql),$bindValues);
        return json_decode(json_encode($data), true);
    }

    public function fetchTravellersCountByCity($request){
        $sql = "SELECT city_name, count(DISTINCT traveller_id) as total FROM city_travel_history
                INNER JOIN cities ON city_travel_history.city_id = cities.id
                WHERE  DATE_FORMAT(from_date,'%Y-%m-%d') >= :from_date AND DATE_FORMAT(to_date,'%Y-%m-%d') <= :to_date
                GROUP BY city_name ORDER by COUNT(DISTINCT traveller_id) DESC";
        $bindValues = array(':from_date' => $request['from_date'], ':to_date' => $request['to_date']);
        $data = DB::select(DB::raw($sql),$bindValues);
        return json_decode(json_encode($data), true);
    }
}
