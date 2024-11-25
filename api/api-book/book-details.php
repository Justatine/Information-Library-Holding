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

            $query = "SELECT a.*,  CONCAT(b.fname, ' ', b.lname) AS author, c.deptname
                        FROM holdings AS a
                        INNER JOIN authors AS b
                        ON a.author = b.author_id
						INNER JOIN department AS c
                        ON a.department = c.dept_id
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
                                ON a.author = b.author_id
                                WHERE a.title = ? AND a.hold_id != ?";
                $similar_sql = $connection->prepare($similar_query);
                $similar_sql->bind_param("si", $row['title'], $id);
                $similar_sql->execute();
                $similar_result = $similar_sql->get_result();
                
                $similar_books = array();
                while($similar_row = $similar_result->fetch_assoc()) {
                    $similar_books[] = $similar_row;
                }
                
                // Use LIKE with wildcards to match partial keywords
                $related_query = "SELECT a.*, CONCAT(b.fname, ' ', b.lname) AS author
                                FROM holdings AS a
                                INNER JOIN authors AS b
                                ON a.author = b.author_id
                                WHERE a.keyword LIKE CONCAT('%', ?, '%') 
                                AND a.hold_id != ? ";
                $related_sql = $connection->prepare($related_query);
                $related_sql->bind_param("si", $row['keyword'], $id);
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