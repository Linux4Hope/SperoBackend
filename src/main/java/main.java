/**
 * Created by root on 6/2/17.
 */

import static spark.Spark.*;

public class main {
    public static void main(String[] args) {
        get("/hello", (req, res) -> "Hello World");
    }
}