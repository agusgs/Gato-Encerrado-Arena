import org.junit.Test
import static org.junit.Assert.*

class TestHellow {

    @Test
    def void testTest(){
        (new Hellow).hellow
        assertEquals(true, true)
    }
}
