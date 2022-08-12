package com.example.jd.s08;

import java.util.Objects;

/**
 * A JavaBean for coders from the EMPLOYEE table
 * <p>
 * Notice that, intentionally, salary here is int, even if the column is a DECIMAL(8,2)
 */
public class Coder {
    private String firstName;
    private String lastName;
    private int salary; // ?!

    public Coder() {
    }

    public Coder(String firstName, String lastName, int salary) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.salary = salary;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Coder that = (Coder) o;
        return salary == that.salary && Objects.equals(firstName, that.firstName)
                && Objects.equals(lastName, that.lastName);
    }

    @Override
    public int hashCode() {
        return Objects.hash(firstName, lastName, salary);
    }

    @Override
    public String toString() {
        return "Coder [firstName=" + firstName + ", lastName=" + lastName + ", salary=" + salary + "]";
    }
}