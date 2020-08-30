package s09;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.is;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * Assuming schema me, table coders initialized via migration.sql script
 * 
 */
class SelectorTest {
    private Selector selector;

    @BeforeEach
    void init() {
        this.selector = new Selector();
    }

    @Test
    void getCoderNames() throws SQLException {
        List<String> expected = Arrays.asList("Alexander", "Bruce", "David", "Diana", "Tim", "Valli");

        List<String> actual = selector.getCoderNames();

        assertThat(actual, is(expected));
    }

    @Test
    void testGetCoders() throws SQLException {
        String[] expectedNames = { "Alexander", "Bruce", "David", "Diana", "Tim", "Valli" };

        List<Coder> actual = selector.getCoders();

        assertThat(actual.size(), is(expectedNames.length));
        for (int i = 0; i < actual.size(); i++) {
            assertThat(actual.get(i).getFirstName(), is(expectedNames[i]));
        }
    }

    @Test
    void getCodersBySalary6000() throws SQLException {
        int minSalary = 6000;
        String[] expectedNames = { "Alexander", "Bruce" };
        int[] expectedSalaries = { 9000, 6000 };

        List<Coder> actual = selector.getCodersBySalary(minSalary);

        assertThat(actual.size(), is(expectedNames.length));
        for (int i = 0; i < actual.size(); i++) {
            Coder current = actual.get(i);
            assertThat(current.getFirstName(), is(expectedNames[i]));
            assertThat(current.getSalary(), is(expectedSalaries[i]));
        }
    }

    @Test
    void getCodersHiredBefore2007() throws SQLException {
        LocalDate date = LocalDate.of(2007, Month.JANUARY, 1);
        String[] expectedNames = { "David", "Alexander", "Valli" };

        List<Coder> actual = Selector.getCodersHiredBefore(date);

        assertThat(actual.size(), is(expectedNames.length));
        for (int i = 0; i < actual.size(); i++) {
            Coder current = actual.get(i);
            assertThat(current.getFirstName(), is(expectedNames[i]));
        }
    }

    @Test
    void getCodersWithLetterInPreparedQ() throws SQLException {
        char letter = 'u';
        List<Coder2> expected = new ArrayList<>(3);
        expected.add(new Coder2("Alexander", "Hunold", 9000.0));
        expected.add(new Coder2("Bruce", "Ernst", 6000.0));
        expected.add(new Coder2("David", "Austin", 4800.0));

        List<Coder2> actual = selector.getCodersWithLetterInPrepared(letter);
        System.out.println(actual);
        assertThat(actual, is(expected));
    }

    @Test
    void getCodersWithLetterInQ() throws SQLException {
        char letter = 'u';
        List<Coder2> expected = new ArrayList<>(3);
        expected.add(new Coder2("Alexander", "Hunold", 9000.0));
        expected.add(new Coder2("Bruce", "Ernst", 6000.0));
        expected.add(new Coder2("David", "Austin", 4800.0));

        List<Coder2> actual = selector.getCodersWithLetterIn(letter);
        System.out.println(actual);
        assertThat(actual, is(expected));
    }
}
