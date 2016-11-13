package com.buet.report.service;

import com.buet.brtc.service.BRTCServiceImpl;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.util.JRLoader;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

@Service
public class ReportServiceImpl implements ReportService {
    @Autowired
    BRTCServiceImpl brtcService;

    @Override
    public void createReport(HttpServletResponse response, Map<String, Object> params, String fileName,
                             JRDataSource dataSource) throws JRException, IOException {
        InputStream jasperStream = this.getClass().getResourceAsStream("/com/buet/report/resources/" + fileName + ".jasper");
        JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperStream);
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);
        //response.setContentType("application/x-pdf");
        //response.setHeader("Content-disposition", "inline; filename=" + fileName + ".pdf");

        ByteArrayOutputStream stream = new ByteArrayOutputStream();
        // =======================================================
        //String format = (String) params.get("format");
        //fileName = (String) params.get("fileName");
        //InputStream jasperStream = this.getClass().getResourceAsStream("/com/buet/report/resources/" + fileName + ".jasper");
        //JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperStream);
        //JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);




         /*pdf*/
        JasperExportManager.exportReportToPdfStream(jasperPrint, stream);

        response.setContentLength(stream.size());
        response.getOutputStream().write(stream.toByteArray());
    }

    @Override
    public String getRealPath(String pathExtension) {
        String filePath = "com/buet/report/resources" + pathExtension;
        ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
        String realPath = classLoader.getResource(filePath).getPath();
        return realPath;
    }


}


/*
<af:fileDownloadActionListener filename="ReporteRenovaciones.pdf"
method="#{pageFlowScope.AptosRenovar.verReportePdf}"
contentType="application/pdf"/>
* */
