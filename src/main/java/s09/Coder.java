package s09;

import java.time.LocalDate;
import java.util.Objects;

/**
 * Another JavaBean for the CODERS table
 *
 * @author Emanuele Galli
 */
public class Coder {
    private String firstName;
    private String lastName;
    private LocalDate hireDate;
    private double salary;

    public Coder() {
    }

    public Coder(String firstName, String lastName, LocalDate hireDate, double salary) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.hireDate = hireDate;
        this.salary = salary;
    }

    public Coder(String firstName, String lastName, double salary) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.hireDate = LocalDate.now();
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

    public LocalDate getHireDate() {
        return hireDate;
    }

    public void setHireDate(LocalDate hireDate) {
        this.hireDate = hireDate;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double salary) {
        this.salary = salary;
    }

    @Override
    public String toString() {
        return "Coder{" +
                "firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", hireDate=" + hireDate +
                ", salary=" + salary +
                '}';
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
        return Double.compare(that.salary, salary) == 0 && Objects.equals(firstName, that.firstName) && Objects.equals(lastName, that.lastName) && Objects.equals(hireDate, that.hireDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(firstName, lastName, hireDate, salary);
    }
}