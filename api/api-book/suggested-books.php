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

            // First get the subject name
            $subjectQuery = "SELECT sub_name FROM subjects WHERE sub_id = ?";
            $stmt = $connection->prepare($subjectQuery);
            $stmt->bind_param("i", $id);
            $stmt->execute();
            $subjectResult = $stmt->get_result();
            $subjectRow = $subjectResult->fetch_assoc();
            
            // Then get the books
            $query = "SELECT c.*, CONCAT(d.fname,' ',d.lname) as authorName
                FROM subjects AS a
                INNER JOIN subjects_holdings AS b
                ON a.sub_id=b.sub_id
                LEFT JOIN holdings AS c
                ON b.hold_id=c.hold_id
                INNER JOIN authors AS d
                ON c.author=d.author_id
                WHERE a.sub_id = ?";
            $sql = $connection->prepare($query);
            $sql->bind_param("i", $id);
            $sql->execute();
            $result = $sql->get_result();
            
            // Structure the response
            $response['subject'] = array(
                'name' => $subjectRow['sub_name'],
                'suggestedBooks' => array()
            );
            
            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    $response['subject']['suggestedBooks'][] = $row;
                }
            }
        }
    }
    $connection->commit();
} catch (\Exception $e) {
    $response['error']='Failed to fetch data';
}
echo json_encode($response);