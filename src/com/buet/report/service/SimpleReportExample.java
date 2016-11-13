package com.buet.report.service;

import net.sf.dynamicreports.jasper.builder.JasperReportBuilder;
import net.sf.dynamicreports.report.builder.DynamicReports;
import net.sf.dynamicreports.report.builder.column.Columns;
import net.sf.dynamicreports.report.builder.component.Components;
import net.sf.dynamicreports.report.builder.datatype.DataTypes;
import net.sf.dynamicreports.report.constant.HorizontalAlignment;
import net.sf.dynamicreports.report.exception.DRException;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SimpleReportExample {

    public static void main(String[] args) {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "");
        } catch (SQLException e) {
            e.printStackTrace();
            return;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return;
        }

        JasperReportBuilder report = DynamicReports.report();//a new report
        report.columns(Columns.column("Customer Id", "id", DataTypes.integerType())
                                .setHorizontalAlignment(HorizontalAlignment.LEFT),
                        Columns.column("First Name", "first_name", DataTypes.stringType()),
                        Columns.column("Last Name", "last_name", DataTypes.stringType()),
                        Columns.column("Date", "date", DataTypes.dateType())
                                .setHorizontalAlignment(HorizontalAlignment.LEFT)
                )
                .title(//title of the report
                        Components.text("SimpleReportExample")
                                .setHorizontalAlignment(HorizontalAlignment.CENTER))
                .pageFooter(Components.pageXofY())//show page number on the page footer
                .setDataSource("SELECT id, first_name, last_name, date FROM customers", connection);

        try {
            report.show();//show the report
            report.toPdf(new FileOutputStream("E:/war/report.pdf"));//export the report to a pdf file
        } catch (DRException e) {
            e.printStackTrace();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }
}
