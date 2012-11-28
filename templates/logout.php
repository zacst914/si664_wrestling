<?php
session_start();
session_destroy();
if (!empty($_SERVER['HTTP_REFERER'])) {
    header("Location: index.php");
} else {
    header("Location: index.php");
}
exit;
?>