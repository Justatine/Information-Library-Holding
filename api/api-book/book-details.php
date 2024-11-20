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

            $query = "SELECT a.*,  CONCAT(b.fname, ' ', b.lname) AS author
                        FROM holdings AS a
                        INNER JOIN authors AS b
                        ON a.author_id = b.author_id
                        WHERE a.hold_id = ?";
            $sql= $connection->prepare($query);
            $sql->bind_param("i",$id);
            $sql->execute();
            $result=$sql->get_result();
            if ($result->num_rows>0) {
                $row=$result->fetch_assoc();
                
                // Add query for exact title matches
                $similar_query = "SELECT a.*, CONCAT(b.fname, ' ', b.lname) AS author
                                FROM holdings AS a
                                INNER JOIN authors AS b
                                ON a.author_id = b.author_id
                                WHERE a.title = ? AND a.hold_id != ?";
                $similar_sql = $connection->prepare($similar_query);
                $similar_sql->bind_param("si", $row['title'], $id);
                $similar_sql->execute();
                $similar_result = $similar_sql->get_result();
                
                $similar_books = array();
                while($similar_row = $similar_result->fetch_assoc()) {
                    $similar_books[] = $similar_row;
                }
                
                // Add query for first two words matches
                $title_words = explode(' ', $row['title']);
                $first_two_words = implode(' ', array_slice($title_words, 0, 2)) . '%';
                
                $related_query = "SELECT a.*, CONCAT(b.fname, ' ', b.lname) AS author
                                FROM holdings AS a
                                INNER JOIN authors AS b
                                ON a.author_id = b.author_id
                                WHERE a.title LIKE ? AND a.hold_id != ? AND a.title != ?";
                $related_sql = $connection->prepare($related_query);
                $related_sql->bind_param("sis", $first_two_words, $id, $row['title']);
                $related_sql->execute();
                $related_result = $related_sql->get_result();
                
                $related_books = array();
                while($related_row = $related_result->fetch_assoc()) {
                    $related_books[] = $related_row;
                }
                
                $row['similar_books'] = $similar_books;
                $row['suggested_books'] = $related_books;
                $response['data'] = $row;
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