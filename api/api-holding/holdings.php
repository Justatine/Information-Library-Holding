<?php
header("Content-Type: application/json");
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: GET');
include '../require/connection.php';

$response = array();

$connection->begin_transaction();

try {
    if ($_SERVER['REQUEST_METHOD'] === 'GET') {

        if (isset($_GET['id'])) {
            $id = $_GET['id'];

            $query = "SELECT a.*, CONCAT(b.fname,' ',b.lname) AS author
                        FROM holdings a
                        INNER JOIN authors b 
                        ON a.author=b.author_id
                        WHERE a.hold_id = ?";
            $sql= $connection->prepare($query);
            $sql->bind_param("i",$id);
            $sql->execute();
            $result=$sql->get_result();
            if ($result->num_rows>0) {
                $row=$result->fetch_assoc();
                $response['data']=$row; 
            }else{
                $response['data'] = array();
            }
        }else{
            $query = "SELECT a.*, c.fname, c.lname
                        FROM holdings AS a
                        LEFT JOIN holdings_authors AS b
                        ON a.hold_id=b.hold_id
                        LEFT JOIN authors AS c
                        ON b.author_id=c.author_id";
            $sql = $connection->prepare($query);
            $sql->execute();
            $result = $sql->get_result();
            
            $holdings = array();
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $holdId = $row['hold_id'];
                    if (!isset($holdings[$holdId])) {
                        $holdings[$holdId] = $row;
                        $holdings[$holdId]['authors'] = array();
                    }
                    $holdings[$holdId]['authors'][] = array(
                        'authors' => $row['fname'].' '.$row['lname']
                    );
                }
                $response['data'] = array_values($holdings);
            } else {
                $response['data'] = array();
            }
        }
    }
    $connection->commit();
} catch (\Exception $e) {
    $response['error']='Failed to fetch data';
}
echo json_encode($response);