# database

A new Flutter application.

## Getting Started


<?php
require 'connection.php';

// Takes raw data from the request..............................................
$json = file_get_contents('php://input');
// Converts it into a PHP object................................................
$data = json_decode($json);

//setting variables.............................................................
$firstName = $data->uFirstName;
$lastName = $data->uLastName;
$gender = $data->uGender;
$uemail = $data->uEmail;
$upassword = $data->uPassword;
$ucontact = $data->uContact;

//defining sql query............................................................
$query = "INSERT INTO data (firstname, lastname, email,password,contact,gender)
VALUES ('$firstName', '$lastName', '$uemail','$upassword','$ucontact','$gender')";

//executing sql query...........................................................
$result = mysqli_query($connect,$query);

if($result){
    echo 'wroks';
}else{
    echo 'not working';
}

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
