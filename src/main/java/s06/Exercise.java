package s06;

public class Exercise {
    /*
     * Exercise: Implement main to run StoreProcedure.getEmployeeSalary() from command line.
     * 
     * If args.length is 1 then use the passed parameter (integer!) as coder id
     * 
     * (in case of wrong call, the user should get adequate feedback)
     * 
     * otherwise use Scanner to get a viable input
     */
    public static void main(String[] args) {
        if (args.length != 1) {
            System.out.println("Usage: Exercise employeeId");
            return;
        }
    }
}
