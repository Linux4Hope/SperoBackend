package app; /**
 * Created by root on 6/2/17.
 */

import app.users.UsersController;

import static spark.Spark.*;

public class Application {
    public static void main(String[] args) {

        // set up routes
        get("/", (request, response) -> "Welcome to Homepage");
        get("/users", UsersController.getAllUsers);
        get("/users/:name", UsersController.getOneUser);
    }

    public void getHello() {
        get("/hello", (req, res) -> "You always doing the most jaylen");
    }

    public int num() {
        return 2;
    }
}
