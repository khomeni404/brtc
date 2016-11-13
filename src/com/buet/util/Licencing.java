package com.buet.util;

import bd.com.softengine.util.ActionResult;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Licencing {

    private static final String EXPIRY_DATE = "30-02-2016";

    public static ActionResult checkLicenceValidity(){
        ActionResult res = new ActionResult();
        Date today = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        Date limitDate = null;
        try {
            limitDate = sdf.parse(EXPIRY_DATE);
        }catch (ParseException pe){
            pe.printStackTrace();
        }
        if (today.compareTo(limitDate)>0){
            res.setMsg("Sorry Date is over");
            res.setSuccess(false);
        }else {
            res.setSuccess(true);
        }
        return res;
    }
}
