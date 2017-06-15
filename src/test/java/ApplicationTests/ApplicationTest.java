package ApplicationTests;
import app.Application;
import io.restassured.RestAssured;
import org.junit.*;
import static io.restassured.RestAssured.*;
import static io.restassured.matcher.RestAssuredMatchers.*;
import org.hamcrest.Matchers.*;
import io.restassured.module.jsv.JsonSchemaValidator.*;

public class ApplicationTest {
    @Test
    public void numTest() {
        // Arrange
        Application app = new Application();

        // Act
        int result = app.num();

        // Assert
        Assert.assertEquals(2, result);
    }

    @BeforeClass
    public static void setup() {
        RestAssured.port = Integer.valueOf(4567);
        RestAssured.baseURI = "http://localhost";
    }

    @Test
    public void getHelloRoute() {
        Application app = new Application();
        app.getHello();
        get("/hello").then().assertThat().statusCode(200);
    }
}