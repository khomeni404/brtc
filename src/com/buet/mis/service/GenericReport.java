package com.buet.mis.service;

import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.export.*;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import org.apache.log4j.Logger;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.sql.Connection;
import java.util.Map;

/**
 * Copyright @ Soft Engine Inc.
 * Created on 11/09/15
 * Created By : Khomeni
 * Edited By : Khomeni &
 * Last Edited on : 11/09/15
 * Version : 1.0
 */

@Service
public class GenericReport {
    private SessionFactory sessionFactory;
    @Autowired
    private HibernateTemplate hibernateTemplate;


    static Logger logger = Logger.getRootLogger();

    public void setSessionFactory() {
        this.sessionFactory = hibernateTemplate.getSessionFactory();
    }


    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
    public ByteArrayOutputStream generateReport(Map parameters, String context,
                                                String filename)
            throws Exception {
        try {
            //Connection conn = sessionFactory.getCurrentSession().connection();
            Connection conn = null;// hibernateTemplate.getSessionFactory().getCurrentSession().connection();

            JasperDesign jasperDesign = JRXmlLoader.load(context + "reportXml/" + filename + ".xml");
            JasperReport jasperReport = JasperCompileManager.compileReport(jasperDesign);

            parameters.put("BANK_NAME", "IBBL");
            parameters.put("BANK_ADDRESS", "196");

            parameters.put("REPORT_TITLE", parameters.get("REPORT_TITLE"));
            parameters.put("REPORT_DATE", "2015/02/02");


            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, conn);


            if (parameters.get("format").equals("pdf")) {
                JasperExportManager.exportReportToPdfStream(jasperPrint, baos);
            } else if (parameters.get("format").equals("html")) {
                JRHtmlExporter htmlExporter = new JRHtmlExporter();
                htmlExporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
                htmlExporter.setParameter(JRExporterParameter.OUTPUT_STREAM, baos);
                File imageDir = new File(context.substring(0, context.indexOf("WEB-INF")) + "\\images");
                htmlExporter.setParameter(JRHtmlExporterParameter.IMAGES_DIR, imageDir);
                htmlExporter.setParameter(JRHtmlExporterParameter.IS_OUTPUT_IMAGES_TO_DIR, Boolean.FALSE);
                htmlExporter.setParameter(JRHtmlExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
                htmlExporter.exportReport();
            } else if (parameters.get("format").equals("excel")) {
                JRXlsExporter exporterXLS = new JRXlsExporter();
                exporterXLS.setParameter(JRXlsExporterParameter.JASPER_PRINT, jasperPrint);
                exporterXLS.setParameter(JRXlsExporterParameter.OUTPUT_STREAM, baos);
                exporterXLS.setParameter(JRXlsExporterParameter.IS_ONE_PAGE_PER_SHEET, Boolean.FALSE);
                exporterXLS.setParameter(JRXlsExporterParameter.IS_DETECT_CELL_TYPE, Boolean.TRUE);
                exporterXLS.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);
                exporterXLS.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
                exporterXLS.exportReport();
            } else if (parameters.get("format").equals("csv")) {
                JRCsvExporter exporter = new JRCsvExporter();
                exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
                exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, baos);
                exporter.exportReport();
            } else {
                JasperExportManager.exportReportToPdfStream(jasperPrint, baos);
            }

            return baos;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }


    @Transactional(readOnly = true)
    @SuppressWarnings("unchecked")
    public ByteArrayOutputStream generateReport2(HttpServletResponse response, Map<String, Object> params, String fileName,
                                                 JRDataSource dataSource) throws Exception {
        try {

            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            InputStream jasperStream = this.getClass().getResourceAsStream("/com/vision/report/resources/" +fileName+".jasper");
            JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperStream);
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);


            JasperExportManager.exportReportToPdfStream(jasperPrint, baos);

            return baos;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}
