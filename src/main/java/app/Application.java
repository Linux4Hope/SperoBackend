package app; /**
 * Created by root on 6/2/17.
 */

import static spark.Spark.*;

public class Application {
    public static void main(String[] args) {
        get("/test", (req, res) -> "make sure you 'import' the project. NOT open." +
            " and then change the module name under project settings.");
        get("/dependencies", (request, response) -> "Finally got the Maven dependencies to work!");
        get("/hello", (req, res) -> "You always doing the most jaylen");
    }

    public void getHello() {
        get("/hello", (req, res) -> "You always doing the most jaylen");
    }

    public int num() {
        return 2;
    }
}
