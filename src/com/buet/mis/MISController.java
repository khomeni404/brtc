package com.buet.mis;

import com.buet.brtc.model.BRTCProject;
import com.buet.brtc.model.Client;
import com.buet.brtc.model.Consultant;
import com.buet.brtc.model.NegotiateTeam;
import com.buet.brtc.service.BRTCService;
import com.buet.hrm.model.UserDetails;
import com.buet.mis.service.MISService;
import com.buet.report.service.ReportService;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Copyright @ Soft Engine Inc.
 * Created on 14/09/15
 * Created By : Khomeni
 * Edited By : Khomeni &
 * Last Edited on : 14/09/15
 * Version : 1.0
 */

@Controller
@RequestMapping("/mis/")
public class MISController {
    @Autowired
    private MISService misService;
    @Autowired
    private ReportService reportService;
    @Autowired
    private BRTCService brtcService;

    public String[] consultantTypeArray = {"Leader", "Member", "Other"};
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");



    @RequestMapping(value = "test.buet", method = RequestMethod.GET)
    public
    @ResponseBody
    String test(@RequestParam String format, HttpServletRequest request, HttpServletResponse response, @RequestParam String type) {
        Map<String, Object> params = new HashMap<String, Object>();
        List<Map<String, String>> table = new ArrayList<Map<String, String>>();
        Map<String, String>  rows = new HashMap<String, String>();


        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        BRTCProject p = brtcService.getBrtcProject("1");
        NegotiateTeam nt = p.getNegotiateTeam();


        params.put("Date", sdf.format(nt.getAssignDate()));
        params.put("ProjectName", p.getProjectTitle());
        params.put("Department", p.getDepartment().getName());
        Client c = p.getClient();
        params.put("ClientName", c.getName());
        params.put("ClientAddress", c.getAddress());
        params.put("ClientContact", "Phone : " + c.getPhone() + ", Fax: " + c.getFax() + ", Email : " + c.getEmail());
        params.put("SpokesMan", c.getSpokesMan() + " (" + c.getSpokesManCell() + ")");
        String consultants = "";
        int counter = 0;
        for (Consultant consultant : nt.getConsultantList()) {
            UserDetails details = consultant.getConsultant().getToken().getUserDetails();
            if (counter != 0)
                consultants += ", ";
            consultants += details.getName() + " (as " + consultantTypeArray[consultant.getType()] + ")";
            counter++;
        }
        params.put("Consultants", consultants);
        params.put("RealPath", reportService.getRealPath("/"));

        JRDataSource dataSource = new JREmptyDataSource();
        //JRDataSource dataSource = new JRBeanCollectionDataSource(table);
        try {
            params.put("TITLE", "This is a test report");
            params.put("format", format);
            params.put("fileName", "ProjectAssignmentLetter");
            ByteArrayOutputStream byteArrayOutputStream = misService.generateReport(response, params, dataSource);
            response.setContentLength(byteArrayOutputStream.size());
            response.getOutputStream().write(byteArrayOutputStream.toByteArray());
            return null;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}