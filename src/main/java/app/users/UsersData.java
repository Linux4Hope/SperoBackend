package app.users;

import java.util.ArrayList;
import java.util.List;

public class UsersData {
    private List<Users> users = new ArrayList<>();

    public UsersData(){
        users.add(new Users("Alan", "pass"));
        users.add(new Users("Cherie", "pass"));
        users.add(new Users("Jaylen", "pass"));
        users.add(new Users("Marian", "pass"));
        users.add(new Users("Narith", "pass"));
    }

    public String getAllUsers(){
        String list = "{";
        for(int i=0; i<users.size(); i++)
            list += "username: " + users.get(i).getUsername() + ", ";
        list += "}";
        return list;
    }
}
