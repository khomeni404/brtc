package bd.com.softengine.licencing;

import bd.com.softengine.util.ActionResult;
import com.buet.brtc.service.BRTCService;
import com.buet.brtc.service.BRTCServiceImpl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class MyLicence {

    private static BRTCService brtcService = new BRTCServiceImpl();
    private static final String EXPIRY_DATE = "30-10-2016";

    private static final String VALIDITY_MSG = "Sorry<hr/>\n" +
            "Limited <span class=\"text-danger\"> ACCESS</span> or <span class=\"text-danger\"> UNAUTHORIZED USE</span> of code. <br/>\n" +
            "Email to khomeni.java@gmail.com for more information. <br/>\n" +
            "www.soft-engine.net";

    private static final String PROJECT_RANGE_MSG = "Maximum limit crossed<hr/>\n" +
            "Email to khomeni.java@gmail.com for more information. <br/>\n" +
            "www.soft-engine.net";

    public static ActionResult checkLicenceValidity() {
        ActionResult res = new ActionResult();
        Date today = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        Date limitDate = null;
        try {
            limitDate = sdf.parse(EXPIRY_DATE);
        } catch (ParseException pe) {
            pe.printStackTrace();
        }
        if (today.compareTo(limitDate) > 0) {
            res.setMsg(VALIDITY_MSG);
            res.setSuccess(false);
        } else {
            res.setMsg("");
            res.setSuccess(true);
        }
        return res;
    }

    public static ActionResult checkProjectsRange() {
        int projects = brtcService.findAllBrtcProject().size();
        ActionResult ar = new ActionResult();
        if (projects > 2) {
            ar.setMsg(PROJECT_RANGE_MSG);
            ar.setSuccess(false);
        } else {
            ar.setMsg("");
            ar.setSuccess(true);
        }
        return ar;
    }

}
