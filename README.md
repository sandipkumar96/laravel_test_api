Questions : 
Create laravel apis for the following using the database schema provided in SQL section :
1) Returns the travel history of a user
user_id is a mandatory input
Optional parameters: from_date and to_date
Output: json encode of array of objects containing below details ordered by travel date

city_name, from_date, to_date

2) Returns the count of distinct travellers against every city for a given period
from_date and to_date are mandatory inputs
Output: json encode of array of objects containing below details ordered by
traveller_count

city_name, traveller_count


Answer : 

1) API Url : http://localhost:8000/api/user/travelHistory
    parameter : {
                    "user_id":1,
                    "from_date" : "2021-01-01", //optional
                    "to_date" : "2022-12-12" //optional
                }
                
 2) API Url : http://localhost:8000/api/user/travellersCount
    parameter : {
                    "from_date" : "2022-01-01",
                    "to_date" : "2022-12-12"
                }
                
SQL DB Details : traveldb.sql
                
        
