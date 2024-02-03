-------------------------------- Ερώτημα 1 -----------------------------------------
<?php

// Connect to the database
$host = "127.0.0.1";
$username = "root";
$password = "";
$dbname = "AIRLINE";

$conn = mysqli_connect($host, $username, $password, $dbname);

// Check connection
if (!$conn) 
{
  die("Connection failed: " . mysqli_connect_error());
}

// Select all the flights from the FLIGHTS table
$sql = "SELECT * FROM FLIGHTS";
$result = mysqli_query($conn, $sql);

if (mysqli_num_rows($result) > 0) 
{
  echo "<table>";
  echo "<tr>";
  echo "<th>Flight No</th>";
  echo "<th>Departure</th>";
  echo "<th>Arrival</th>";
  echo "<th>Flight Type</th>";
  echo "<th>Seats</th>";
  echo "<th>Free Seats</th>";
  echo "</tr>";

  // Output the data from the FLIGHTS table
  while($row = mysqli_fetch_assoc($result)) 
  {
    echo "<tr>";
    echo "<td>" . $row["FLIGHT_NO"] . "</td>";
    echo "<td>" . $row["DEPARTURE"] . "</td>";
    echo "<td>" . $row["ARRIVAL"] . "</td>";
    echo "<td>" . $row["FLIGHT_TYPE"] . "</td>";
    echo "<td>" . $row["SEATS"] . "</td>";
    echo "<td>" . $row["FREE_SEATS"] . "</td>";
    echo "</tr>";
  }
  echo "</table>";
} 
else 
{
  echo "0 results";
}

mysqli_close($conn);

?>

-------------------------------- Ερώτημα 2 ------------------------------------------

<form action="" method="post">
  <label for="flight">Select a flight:</label>
  <select name="flight" id="flight">
    <option value="1">Flight 1</option>
    <option value="2">Flight 2</option>
    <option value="3">Flight 3</option>
    <option value="4">Flight 4</option>
    <option value="5">Flight 5</option>
  </select>
  <input type="submit" value="Submit">
</form>

<?php

if (isset($_POST["flight"])) 
{
   // Connect to the database
   $host = "127.0.0.1";
   $username = "root";
   $password = "";
   $dbname = "AIRLINE";

   $conn = mysqli_connect($host, $username, $password, $dbname);

  // Check connection
  if (!$conn) 
  {
   die("Connection failed: " . mysqli_connect_error());
  }

 // Select the customers with reservations on the selected flight
 $sql = "SELECT CUSTOMERS.CUSTOMERS_NAME, CUSTOMERS.CUSTOMERS_LAST_NAME, CUSTOMERS.CITIZENSHIP, CUSTOMERS.BIRTHDATE
 FROM CUSTOMERS
 INNER JOIN RESERVATIONS ON CUSTOMERS.CUSTOMERS_ID = RESERVATIONS.CUSTOMERS_ID
 WHERE RESERVATIONS.FLIGHT_NO = " . mysqli_real_escape_string($conn, $_POST["flight"]);

 $result = mysqli_query($conn, $sql);

 if (mysqli_num_rows($result) > 0) 
 {
   echo "<table>";
   echo "<tr>";
   echo "<th>Name</th>";
   echo "<th>Last Name</th>";
   echo "<th>Citizenship</th>";
   echo "<th>Birthdate</th>";
   echo "</tr>";

   // Output the data from the CUSTOMERS table
   while($row = mysqli_fetch_assoc($result)) 
   {
    echo "<tr>";
    echo "<td>" . $row["CUSTOMERS_NAME"] . "</td>";
    echo "<td>" . $row["CUSTOMERS_LAST_NAME"] . "</td>";
    echo "<td>" . $row["CITIZENSHIP"] . "</td>";
    echo "<td>" . $row["BIRTHDATE"] . "</td>";
    echo "</tr>";
   }
   echo "</table>";
  }
  else 
  {
   echo "No customers found for this flight.";
  }

  mysqli_close($conn);

}

?>

-------------------------------- Ερώτημα 3 ------------------------------------------

<form action="" method="post">
  <label for="customer_code">Enter customer code:</label>
  <input type="text" id="customer_code" name="customer_code">
  <br>
  <label for="month">Select month:</label>
  <input type="date" id="month" name="month" min="2000-01" max="2023-12" value="2022-01">
  <br>
  <input type="submit" value="Submit">
</form>

<?php

if (isset($_POST["customer_code"]) && isset($_POST["month"])) 
{
  // Connect to the database
  $host = "127.0.0.1";
  $username = "root";
  $password = "";
  $dbname = "AIRLINE";

  $conn = mysqli_connect($host, $username, $password, $dbname);

  // Check connection
  if (!$conn) 
  {
    die("Connection failed: " . mysqli_connect_error());
  }

  // Select the reservations for the selected customer and month
  $sql = "SELECT COUNT(*) AS bookings, SUM(COST) AS total_amount
  FROM RESERVATIONS
  WHERE CUSTOMERS_ID = " . mysqli_real_escape_string($conn, $_POST["customer_code"]) . "
        AND MONTH (DATE) = MONTH('" . mysqli_real_escape_string($conn, $_POST["month"]) . "')
        AND YEAR (DATE) = YEAR('" . mysqli_real_escape_string($conn, $_POST["month"]) . "')";

  $result = mysqli_query($conn, $sql);

  if (mysqli_num_rows($result) > 0) 
  {
    $row = mysqli_fetch_assoc($result);
    echo "Number of bookings: " . $row["bookings"] . "<br>";
    echo "Total amount: $" . $row["total_amount"];
  } 
  else 
  {
    echo "No bookings found for this customer and month.";
  }

  mysqli_close($conn);
}

?>
