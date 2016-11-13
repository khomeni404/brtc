package com.buet.report.test;


import org.springframework.stereotype.Service;

import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class TestReportCall {

    public static void main(String[] args) {
        showReport();
    }

    public static void showReport(){
        Connection connection = null;
        Statement statement = null;
        try {
            connection = Database.getConnection();
            //connection = SessionUtil.getSession()
            statement = connection.createStatement();
            HashMap parameterMap = new HashMap();
            List list = new ArrayList();
            list.add("Khomeni");
            list.add("Motin");
            parameterMap.put("title", "Yes its working Sir.");//
            Report rpt = new Report(parameterMap, connection);
            rpt.setReportName("report8"); //productlist is the name of my jasper file.
            rpt.callReport();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                //statement.close();
                //connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}