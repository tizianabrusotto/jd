package s14;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import s14.dao.Coder;
import s14.dao.CoderDao;

public class Main {
    private static Logger log = LoggerFactory.getLogger(Main.class);

    public static void main(String[] args) {
        CoderDao cd = new CoderDao();

        // create a new coder
        Coder tom = new Coder(501, "Tom", "Jones", 2000);
        cd.save(tom);
        System.out.println("Save: " + tom);

        cd.get(501).ifPresentOrElse(coder -> {
            System.out.println("Get: " + coder);
            coder.setSalary(coder.getSalary() * 2);
            cd.update(coder);
            System.out.println("Update salary: " + coder);
        }, () -> {
            log.error("Unexpected! Can't get coder 501");
            System.out.println("No coder to work with!");
        });

        // rename a coder
        tom.setLastName("Bombadil");
        cd.update(tom);
        System.out.println("Update renamed: " + tom);

        cd.get(501).ifPresentOrElse(coder -> {
            System.out.println("Get: " + coder);
        }, () -> {
            log.error("Unexpected! Can't get coder 501");
        });

        // delete a coder
        cd.delete(501);

        cd.get(501).ifPresentOrElse(coder -> {
            log.error("Unexpected! Coder 501 still alive: " + coder);
        }, () -> {
            System.out.println("Coder 501 is no more");
        });

        System.out.println("All coders");
        cd.getAll().stream().forEach(System.out::println);
    }
}
