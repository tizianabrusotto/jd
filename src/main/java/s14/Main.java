package s14;

import java.util.List;
import java.util.Optional;

import s14.dao.Coder;
import s14.dao.CoderDao;

public class Main {
    public static void main(String[] args) {
        CoderDao cd = new CoderDao();

        Optional<Coder> opt = cd.get(103);
        if (opt.isPresent()) {
            System.out.println("Coder 103: " + opt.get());
        } else {
            System.out.println("Can't get coder 103");
        }
        
        List<Coder> coders = cd.getAll();
        System.out.println("Coders: " + coders);
    }
}
