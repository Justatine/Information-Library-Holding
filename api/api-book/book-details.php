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

            $query = "SELECT a.*, c.deptname
                        FROM holdings AS a
                        INNER JOIN department AS c
                        ON a.department = c.dept_id
                        WHERE a.hold_id = ?";
            $sql = $connection->prepare($query);
            $sql->bind_param("i", $id);
            $sql->execute();
            $result = $sql->get_result();

            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();

                // Get authors for the book
                $authors_query = "SELECT CONCAT(d.fname, ' ', d.lname) AS author_name, d.*
                                FROM holdings_authors AS b
                                INNER JOIN authors AS d
                                ON b.author_id = d.author_id
                                WHERE b.hold_id = ?";
                $authors_sql = $connection->prepare($authors_query);
                $authors_sql->bind_param("i", $id);
                $authors_sql->execute();
                $authors_result = $authors_sql->get_result();

                $authors = array();
                while ($author_row = $authors_result->fetch_assoc()) {
                    $authors[] = $author_row;
                }

                $row['authors'] = $authors;

                // Similar books query
                $similar_query = "SELECT a.*
                                FROM holdings AS a
                                WHERE a.title = ? AND a.hold_id != ?";
                $similar_sql = $connection->prepare($similar_query);
                $similar_sql->bind_param("si", $row['title'], $id);
                $similar_sql->execute();
                $similar_result = $similar_sql->get_result();

                $similar_books = array();
                while ($similar_row = $similar_result->fetch_assoc()) {
                    // Get authors for each similar book
                    $authors_sql->bind_param("i", $similar_row['hold_id']);
                    $authors_sql->execute();
                    $authors_result = $authors_sql->get_result();

                    $book_authors = array();
                    while ($author_row = $authors_result->fetch_assoc()) {
                        $book_authors[] = $author_row;
                    }
                    $similar_row['authors'] = $book_authors;
                    $similar_books[] = $similar_row;
                }

                // Related books query with collation fix
                $related_query = "SELECT a.*
                                FROM holdings AS a
                                WHERE a.keyword COLLATE utf8mb4_general_ci LIKE CONCAT('%', ?, '%') 
                                AND a.hold_id != ?";
                $related_sql = $connection->prepare($related_query);
                $related_sql->bind_param("si", $row['keyword'], $id);
                $related_sql->execute();
                $related_result = $related_sql->get_result();

                $related_books = array();
                while ($related_row = $related_result->fetch_assoc()) {
                    // Get authors for each related book
                    $authors_sql->bind_param("i", $related_row['hold_id']);
                    $authors_sql->execute();
                    $authors_result = $authors_sql->get_result();

                    $book_authors = array();
                    while ($author_row = $authors_result->fetch_assoc()) {
                        $book_authors[] = $author_row;
                    }
                    $related_row['authors'] = $book_authors;
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
    $connection->rollback();
    $response['error'] = 'Failed to fetch data: ' . $e->getMessage();
}
echo json_encode($response);