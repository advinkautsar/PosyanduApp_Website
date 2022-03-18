<?php

namespace App\Models;

use App\Models\Imunisasi;

class Notif
{


    public function sendNotifImunisasi($token, $pesan, $judul)
    {
        $array = array(
            "to" => $token,
            // "registration_ids" => $token,
            "data" => ["body" => $pesan, "title" => $judul],
        );
        $field = json_encode($array);
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://fcm.googleapis.com/fcm/send',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => $field,
            CURLOPT_HTTPHEADER => array(
                'Authorization: key=AAAAgqgVV68:APA91bGhVCEkZ1QuRPSyCgtmxMhD9Xf3khGMMtbDaBQ0MQmJaKqFYPn_WJ8i6zmQc8wjGeMvHnmaFn8Jqi6xVpeusMsLpq-HXdfYDCi97bOh721BBp-KsaRHl1-PmPBGnjzCwJos9DXz',
                'Content-Type: application/json'
            ),
        ));

        $response = curl_exec($curl);
        curl_close($curl);
        // return $response;
	
    }
    public function sendNotifPosyandu($token, $pesan, $judul)
    {
        $array = array(
            // "to" => $token,
            "registration_ids" => $token,
            "data" => ["body" => $pesan, "title" => $judul],
        );
        $field = json_encode($array);
        $curl = curl_init();
        curl_setopt_array($curl, array(
            CURLOPT_URL => 'https://fcm.googleapis.com/fcm/send',
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_ENCODING => '',
            CURLOPT_MAXREDIRS => 10,
            CURLOPT_TIMEOUT => 0,
            CURLOPT_FOLLOWLOCATION => true,
            CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
            CURLOPT_CUSTOMREQUEST => 'POST',
            CURLOPT_POSTFIELDS => $field,
            CURLOPT_HTTPHEADER => array(
                'Authorization: key=AAAAgqgVV68:APA91bGhVCEkZ1QuRPSyCgtmxMhD9Xf3khGMMtbDaBQ0MQmJaKqFYPn_WJ8i6zmQc8wjGeMvHnmaFn8Jqi6xVpeusMsLpq-HXdfYDCi97bOh721BBp-KsaRHl1-PmPBGnjzCwJos9DXz',
                'Content-Type: application/json'
            ),
        ));

        $response = curl_exec($curl);
        curl_close($curl);
        // return $response;
	
    }
   
   
}
