<?php
$db = new PDO('mysql:dbname=blog;host=localhost', 'admin', 'admin');
$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
if (isset($_POST["username"]) and isset($_POST["fullname"]) and isset($_POST["email"]) and isset($_POST["pwd"]) and
    isset($_POST["confirm_pwd"])) {
    if ($_POST["pwd"] == $_POST["confirm_pwd"]) {
        $un = $_POST["username"];
        $email = $_POST["email"];
        $pwd = $_POST["pwd"];
        $name = $_POST["fullname"];
        $date = date("Y/m/d");
        $add_account_stmt = $db->prepare('INSERT INTO users (username, email, password, fullname, dob) VALUES (?, ?, ?, ?, ?)');
        $add_account_stmt->execute(array($un, $email, $pwd, $name, $date));
        echo "New record created successfully";
        header("Location: index.php");
    } elseif ($_POST["pwd"] != $_POST["confirm_pwd"]) {
        print("Passwords are not equal");
    }
}
if (isset($_POST["username_l"]) and isset($_POST["pwd_l"])) {
    $un = $_POST["username_l"];
    $pwd = $_POST["pwd_l"];
    $_SESSION["uname"] = $un;
    $_SESSION["upswd"] = $pwd;
    $stmt = $db->prepare("SELECT * FROM users WHERE username = '$un' AND password = '$pwd'");
    $stmt->execute();
    $num = $stmt->rowCount();
    if ($num > 0) {
        if (isset($_POST["remember"])) {
            setcookie("username", $un, time() + 60 * 60 * 24 * 365);
        } else {
            setcookie("username", '', time() - 3600);
        }
        $_SESSION["user"] = $stmt;
    } else {
        echo 'User does not exist!';
    }
}
if (isset($_GET["logout"])) {
    if ($_GET["logout"] == 1) {
        setcookie("username", '', time() - 3600);
        session_start();
        session_unset();
        session_destroy();
    }
}
if (isset($_POST["title"]) and isset($_POST["body"])) {
    $_SESSION["user"] = 'dsaadsa';
    $title = $_POST["title"];
    $body = $_POST["body"];
    $date = date("Y/m/d");
    $usn = $_SESSION["uname"];
    $pswd = $_SESSION["upswd"];
    $id = $db->prepare("SELECT id FROM users WHERE username='$usn' AND password='$pswd'");
    $id->execute();
    $uid = $id->fetchColumn();
    $stmt = $db->prepare("SELECT * FROM users WHERE username = '$usn' AND password = '$pswd'");
    $stmt = $stmt->execute();
    print $usn;
    print $pswd;

}
?>