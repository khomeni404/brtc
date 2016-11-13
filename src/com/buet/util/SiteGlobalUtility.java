package com.buet.util;

import java.util.Date;
import java.text.*;
import java.sql.*;
/**
 *
 * @author khomeni
 */
public class SiteGlobalUtility {
    public static Timestamp GetFormatedDate(String date,String time) {	
        String testDate = date+","+time;
        Date currentDate = null;
        Timestamp timestamp = null;
        DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy,HH:mm aaa");
        try {
          currentDate = formatter.parse(testDate);
          timestamp = new Timestamp(currentDate.getTime());
        } catch (Exception e) {
                e.printStackTrace();
        }
        return timestamp;
    }
}
