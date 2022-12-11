<h3>Categorias</h3>
<?php
    $serverName = "localhost,1433"; //serverName\instanceName
    $connectionInfo = array( "Database"=>"store", "UID"=>"sa", "PWD"=>"sa");
    $conn = sqlsrv_connect( $serverName, $connectionInfo);
        if( $conn ) {
            $query = sqlsrv_query($conn, "select category, route, date from categories");
                while ($row1 = sqlsrv_fetch_array($query)) {
?>  
                <p><?php echo $row1['category'];?></p> 
<?php            }
    }else{
        echo "ERROR: La conexion no pudo realizarse.<br />";
        die( print_r( sqlsrv_errors(), true));
    }
?>