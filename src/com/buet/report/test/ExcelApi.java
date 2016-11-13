package com.buet.report.test;

import jxl.*;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import java.io.File;
import java.util.Date;

public class ExcelApi {

    public static void main(String[] args) {
        try {
            writeToExcel();
            //readFromExcel();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static void writeToExcel() throws Exception{

        WritableWorkbook workbook = Workbook.createWorkbook(new File("D:\\projectList.xls"));
        WritableSheet sheet = workbook.createSheet("First Sheet", 0);
        Label label = new Label(0, 2, "A label record");
        sheet.addCell(label);

        //Number number = new Number(3, 4, 3.1459);
        //sheet.addCell(number);

        workbook.write();
        workbook.close();

        System.out.println("Yes it is created !");
    }

    public static void readFromExcel() throws Exception{
        //FileInputStream fis = new FileInputStream("D:\\abc\\ERP\\src\\com\\buet\\brtc\\test\\myfile.xls");
        //Workbook workbook = Workbook.getWorkbook(fis);

        //You could use Stream mentioned above OR this below
        Workbook workbook = Workbook.getWorkbook(new File("D:\\abc\\ERP\\src\\com\\buet\\brtc\\test\\myfile.xls"));

        Sheet sheet = workbook.getSheet(0);

        Cell a1 = sheet.getCell(0, 0);
        Cell b2 = sheet.getCell(1, 1);
        Cell c2 = sheet.getCell(2, 1);

        int columns = sheet.getColumns();
        System.out.println("columns = " + columns);

        int rows = sheet.getRows();
        System.out.println("rows = " + rows);

        Cell[] cells = sheet.getRow(0);
        System.out.println("cells = " + cells.length);
        for (int r = 0; r<rows; r++){
            for (int i = 0 ; i<cells.length; i++){
                System.out.println("Type = " + cells[i].getType() + " & value = " + cells[i].getContents());
            }
            System.out.println("------------------------------------");
        }







        //Basic raw data fetching
            /*String stringa1 = a1.getContents();
            System.out.println("stringa1 = " + stringa1);
            String stringb2 = b2.getContents();
            System.out.println("stringb2 = " + stringb2);
            String stringc2 = c2.getContents();
            System.out.println("stringc2 = " + stringc2);
            */

        System.out.println("============================================================");


        //Typed data fetching
        String stringa1 = null;
        double numberb2 = 0;
        Date datec2 = null;


        if (a1.getType() == CellType.LABEL) {
            LabelCell lc = (LabelCell) a1;
            stringa1 = lc.getString();
            System.out.println("stringa1 = " + stringa1);
        }

        if (b2.getType() == CellType.NUMBER) {
            NumberCell nc = (NumberCell) b2;
            numberb2 = nc.getValue();
            System.out.println("numberb2 = " + numberb2);
        }

        if (c2.getType() == CellType.DATE) {
            DateCell dc = (DateCell) c2;
            datec2 = dc.getDate();
            System.out.println("datec2 = " + datec2);
        }
    }



}
