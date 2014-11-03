<HTML>
    <HEAD>
        <TITLE>Your Form Values</TITLE>
    </HEAD>
    <BODY>
        <?PHP
            /* This page prints the form field names and values that were received */
        print("<h1>Your form sent the following values:</h1>");
        print("<table border='1'><tr><th>FIELDNAME</th><th>VALUE</th></tr>");
            //if ($_GET)
        if ($_SERVER["REQUEST_METHOD"] == "GET") {
            foreach (array_keys($_GET) as $name) {
                print("<tr><td>$name</td><td>$_GET[$name]</td></tr>");
            }
        }
        else if (isset($_POST)) {
            foreach (array_keys($_POST) as $name) {
                print("<tr><td>$name</td><td>$_POST[$name]</td></tr>");
            }
        }
        print("<tr><th>Request FIELDNAME</th><th>Request VALUE</th></tr>");
        foreach (array_keys($_REQUEST) as $name) {
            print("<tr><td>$name</td><td>$_REQUEST[$name]</td></tr>");
        }
        print("</table>");
        ?>
    </BODY>
</HTML>
