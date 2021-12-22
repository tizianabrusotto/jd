package com.example.jd.s09;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.condition.DisabledIf;

import static org.assertj.core.api.Assertions.assertThat;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.Month;
import java.util.List;

class PreparedSelectorTest {
    private PreparedSelector ps;

    @BeforeEach
    void init() {
        this.ps = new PreparedSelector();
    }

    @Test
    @DisabledIf(value = "com.example.jd.Config#isSqLite", disabledReason = "No date support")
    void getCodersBySalary6000() throws SQLException {
        int minSalary = 6000;
        String[] expectedNames = { "Alexander", "Bruce" };
        double[] expectedSalaries = { 9000.0, 6000.0 };

        List<Coder> actual = ps.getCodersBySalary(minSalary);

        assertThat(actual.size()).isEqualTo(expectedNames.length);
        for (int i = 0; i < actual.size(); i++) {
            Coder current = actual.get(i);
            assertThat(current.getFirstName()).isEqualTo(expectedNames[i]);
            assertThat(current.getSalary()).isEqualTo(expectedSalaries[i]);
        }
    }

    @Test
    @DisabledIf(value = "com.example.jd.Config#isSqLite", disabledReason = "No date support")
    void getCodersHiredBefore2020() throws SQLException {
        LocalDate date = LocalDate.of(2020, Month.JANUARY, 1);
        String[] expectedNames = { "David", "Alexander", "Valli" };

        List<Coder> actual = PreparedSelector.getCodersHiredBefore(date);

        assertThat(actual.size()).isEqualTo(expectedNames.length);
        for (int i = 0; i < actual.size(); i++) {
            Coder current = actual.get(i);
            assertThat(current.getFirstName()).isEqualTo(expectedNames[i]);
        }
    }

    @Test
    @DisabledIf(value = "com.example.jd.Config#isSqLite", disabledReason = "No date support")
    void getCodersWithLetterInU() throws SQLException {
        char letter = 'u';
        List<Coder> expected = List.of(new Coder("Alexander", "Hunold", LocalDate.of(2019, Month.JANUARY, 6), 9000.0),
                new Coder("Bruce", "Ernst", LocalDate.of(2021, Month.MAY, 21), 6000.0),
                new Coder("David", "Austin", LocalDate.of(2018, Month.JUNE, 25), 4800.0));

        List<Coder> actual = ps.getCodersWithLetterIn(letter);
        System.out.println(actual);
        assertThat(actual).isEqualTo(expected);
    }
}
