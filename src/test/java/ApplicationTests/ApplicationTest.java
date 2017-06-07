package ApplicationTests;
import app.Application;
import org.junit.*;

public class ApplicationTest {
    @Test
    public void getHelloTest() {
        // Arrange
        Application app = new Application();

        // Act
        int result = app.num();

        // Assert
        Assert.assertEquals(2, result);
    }
}