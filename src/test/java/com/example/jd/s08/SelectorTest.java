package com.example.jd.s08;

import static org.assertj.core.api.Assertions.assertThat;

import java.sql.SQLException;
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
        List<String> expected = Arrays.asList("Alexander", "Bruce", "David", "Diana", "Valli");

        List<String> actual = selector.getCoderNames();

        assertThat(actual).isEqualTo(expected);
    }

    @Test
    void getCoders() throws SQLException {
        String[] expectedNames = { "Alexander", "Bruce", "David", "Diana", "Valli" };

        List<Coder> actual = selector.getCoders();

        assertThat(actual.size()).isEqualTo(expectedNames.length);
        for (int i = 0; i < actual.size(); i++) {
            assertThat(actual.get(i).getFirstName()).isEqualTo(expectedNames[i]);
        }
    }

    @Test
    void getCodersBySalary6000() throws SQLException {
        int minSalary = 6000;
        String[] expectedNames = { "Alexander", "Bruce" };
        int[] expectedSalaries = { 9000, 6000 };

        List<Coder> actual = selector.getCodersBySalary(minSalary);

        assertThat(actual.size()).isEqualTo(expectedNames.length);
        for (int i = 0; i < actual.size(); i++) {
            Coder current = actual.get(i);
            assertThat(current.getFirstName()).isEqualTo(expectedNames[i]);
            assertThat(current.getSalary()).isEqualTo(expectedSalaries[i]);
        }
    }

    @Test
    void getCodersBySalaryString6000() throws SQLException {
        String minSalary = "6000";
        String[] expectedNames = { "Alexander", "Bruce" };
        int[] expectedSalaries = { 9000, 6000 };

        List<Coder> actual = selector.getCodersBySalary(minSalary);

        assertThat(actual.size()).isEqualTo(expectedNames.length);
        for (int i = 0; i < actual.size(); i++) {
            Coder current = actual.get(i);
            assertThat(current.getFirstName()).isEqualTo(expectedNames[i]);
            assertThat(current.getSalary()).isEqualTo(expectedSalaries[i]);
        }
    }

    @Test
    void getCodersBySalaryStringInjection() throws SQLException {
        // !!! SQL Injection !!!
        String minSalary = "6000 OR 0 = 0";
        int allEmployees = 107;

        List<Coder> actual = selector.getCodersBySalary(minSalary);
        assertThat(actual.size()).isEqualTo(allEmployees);
    }

    @Test
    void getCodersWithLetterInU() throws SQLException {
        char letter = 'u';
        List<Coder> expected = new ArrayList<>(3);
        expected.add(new Coder("Alexander", "Hunold", 9000));
        expected.add(new Coder("Bruce", "Ernst", 6000));
        expected.add(new Coder("David", "Austin", 4800));

        List<Coder> actual = selector.getCodersWithLetterIn(letter);
        assertThat(actual).isEqualTo(expected);
    }
}
