<?php

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, 'http://localhost/website/frontend/web');
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_FOLLOWLOCATION, 1);
curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/5.0 (Windows NT 10.0; WOW64; rv:41.0) Gecko/20100101 Firefox/41.0');

curl_exec($ch);

$res = [
    'hostname' => 'shouhou.chumenwenwen.com',
    'service'  => 'website',
    'status'   => 'ok'
];
if (curl_error($ch))
{
    $res['status'] = 'error';
}

echo json_encode($res);
















