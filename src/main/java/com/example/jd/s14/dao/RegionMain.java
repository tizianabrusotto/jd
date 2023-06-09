package com.example.jd.s14.dao;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class RegionMain {
	 private static final Logger log = LogManager.getLogger(RegionMain.class);
	public static void main(String[] args) {
		RegionDao rd = new RegionDao();

        // create a new coder ...
        final long id = 21;
        //rd.save(new Region(id, "Prova"));
        Region r = new Region(id,"Prova");
        rd.save(r);
       
        

        // ... then get it
        Region TwentyOne = rd.legacyGet(id);
        if (TwentyOne == null) {
            log.error("Unexpected! Can't get the coder " + id);
            System.out.println("Coder has not been saved correctly!");
            return;
        } else {
            System.out.println("Get: " + TwentyOne);
        }
        
        TwentyOne.setName("Ciao");
        rd.update(TwentyOne);
        System.out.println("Update salary: " + TwentyOne);


        System.out.println("All coders");
        List<Region> region = rd.getAll();
        for (Region region1 : region) {
            System.out.println(region1);
        }
    
	}

}
