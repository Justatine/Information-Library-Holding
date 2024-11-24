<?php
header("Content-Type: application/json");
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
include '../require/connection.php';

$response = array();

$connection->begin_transaction();

try {
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $ocr_result = $_POST['ocr_result'];

        $query = "INSERT INTO ocr_log(ocr_result) VALUES(?)";
        $sql=$connection->prepare($query);
        $sql->bind_param("s",$ocr_result);
        
        if ($sql->execute()) {
            $response['success'] = true;
            $response['message'] = 'OCR result logged successfully';
        }
    }
    $connection->commit();
} catch (\Exception $e) {
    $response['error']='Failed to fetch data';
}
echo json_encode($response);