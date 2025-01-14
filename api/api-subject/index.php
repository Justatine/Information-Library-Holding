<?php
header("Content-Type: application/json");
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET');
include '../require/connection.php';

$response = array();

$connection->begin_transaction();

try {
    if ($_SERVER['REQUEST_METHOD'] === 'GET') {

        // if (isset($_GET['id'])) {
        //     $id = $_GET['id'];

        //     $query = "SELECT a.*, CONCAT(b.fname,' ',b.lname) AS author
        //                 FROM holdings a
        //                 INNER JOIN authors b 
        //                 ON a.author=b.author_id
        //                 WHERE a.hold_id = ?";
        //     $sql= $connection->prepare($query);
        //     $sql->bind_param("i",$id);
        //     $sql->execute();
        //     $result=$sql->get_result();
        //     if ($result->num_rows>0) {
        //         $row=$result->fetch_assoc();
        //         $response['data']=$row; 
        //     }else{
        //         $response['data'] = array();
        //     }
        // }else{
            $query = "SELECT *, LOWER(sub_name) as sub_name FROM subjects";
            $sql=$connection->prepare($query);
            $sql->execute();
            $result=$sql->get_result();
            if ($result->num_rows>0) {
                while ($row=$result->fetch_assoc()) {
                    $response['data'][]=$row;
                }
            }else{
                $response['data'] = array();
            }
        // }
    }
    $connection->commit();
} catch (\Exception $e) {
    $response['error']='Failed to fetch data';
}
echo json_encode($response);