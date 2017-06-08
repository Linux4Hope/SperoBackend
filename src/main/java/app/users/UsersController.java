package app.users;

import spark.Request;
import spark.Response;
import spark.Route;

/**
 * Created by Alan on 6/7/2017.
 */
public class UsersController {

    public static Route getOneUser = (Request request, Response response) -> {
        return "Welcome " + request.params(":name");
    };

    public static Route getAllUsers = (Request request, Response response) -> {
        return new UsersData().getAllUsers();
    };
}
