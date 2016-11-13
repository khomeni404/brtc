package com.buet.report.service;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;


public interface ReportService {
    public void createReport(HttpServletResponse response,
                             Map<String, Object> params,
                             String fileName,
                             JRDataSource dataSource)  throws JRException, IOException;

    public String getRealPath(String path);
}
