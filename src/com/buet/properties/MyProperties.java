package com.buet.properties;

import java.io.InputStream;
import java.util.Properties;

/**
 * Created by ayatullah on 23/03/2015.
 */
public class MyProperties extends Properties {
    public static String prop;

    public MyProperties(String prop){
        this.prop = prop;
    }

    void aaa(){
        Properties prop = new Properties();
        InputStream input = null;

        try {

            input = this.getClass().getResourceAsStream("/com/buet/properties/my.properties");

            // load a properties file
            prop.load(input);

            // get the property value and print it out
            System.out.println(prop.getProperty("jasperRealPath"));
            System.out.println(prop.getProperty("excelReportPath"));

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
