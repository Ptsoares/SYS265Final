# Create an array of IPs
$to_ping = @('fw01','docker01','dhcp01','dhcp02','dc01','ad02','mgmt01','util01','wks01','wks02','mgmt02','dfs01','dfs02')

# Loop through the array
foreach ($ip in $to_ping) {

    # Ping each host
    $the_ping = Test-Connection -ComputerName $ip -quiet -Count 1

    # Check the status of the ping for each host
    if ($the_ping) {
    
        # Host is up
        write-host -BackgroundColor Green -ForegroundColor white "$ip is up."
    
    } else {

        # Output the results if it is down to a file
        write-host -BackgroundColor Red -ForegroundColor white "$ip is down."
    
    }

}