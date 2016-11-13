/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.buet.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.time.DateUtils;
/**
 *
 * @author khomeni
 */
public class ParamUtil {
    private static SimpleDateFormat dateFormat;
	
	private static String[] datePatterns = {"yyyy-MM-dd HH:mm:ss","MM-dd-yyyy"};
	
	static {
            dateFormat = new SimpleDateFormat("MM-dd-yyyy");
	}
	
	public static String formatDate(Date date) {
            if(date == null)
                return null;
            return dateFormat.format(date);
	}
	
	public static Date parseDate(String date) {
            try {
                return DateUtils.parseDate(date, datePatterns);
            } catch(ParseException pe) {
                return null;
            }
	}
	
	public static Date parseDate(String date, String customDateFormat) {
            try {
                return DateUtils.parseDate(date, (new String[] {customDateFormat}));
            } catch(ParseException pe) {
                return null;
            }
	}
	
	public static boolean exists(HttpServletRequest request, String paramName) {
            return exists(request.getParameter(paramName));
	}
	
	public static boolean exists(String param) {
            return (param == null || param.trim().equals("")) ? false : true;
	}
	
	public static boolean empty(String param) {
            return param.trim().equals("");
	}
	
	public static boolean isInt(String param) {
            if(!exists(param))
                return false;		

            boolean caught = false;

            try {
                Integer.parseInt(param);
            } catch(NumberFormatException e) {
                caught = true;
            }

            return caught ? false : true;
	}
	
	public static boolean isDouble(String param) {
            if(!exists(param))
                return false;

            boolean caught = false;

            try {
                Double.parseDouble(param);
            } catch(NumberFormatException e) {
                caught = true;
            }

            return caught ? false : true;
	}
	
	public static boolean isFloat(String param) {
		if(!exists(param))
                    return false;
		
		boolean caught = false;
		
		try {
                    Float.parseFloat(param);
		} catch(NumberFormatException e) {
                    caught = true;
		}
		
		return caught ? false : true;
	}
	
	public static boolean isDate(String param) {
            if(!exists(param))
                return false;

            boolean caught = false;

            try {
                dateFormat.parse(param);
            } catch(ParseException e) {
                e.printStackTrace();
                caught = true;
            }

            return caught ? false : true;
	}
	
	public static String buildParamName(String description, int id) {
            StringBuilder sb = new StringBuilder();
            char[] chars = description.toCharArray();
            for(char c : chars)
                if(Character.isLetterOrDigit(c))
                    sb.append(c);		
            sb.append(id);
            return sb.toString();
	}
	
	public static int getInt(HttpServletRequest request, String paramName) {
            return getInt(request.getParameter(paramName));
	}
	
	public static int getInt(String param) {
            int ret = 0;

            if(exists(param) && isInt(param))
                ret = Integer.parseInt(param);

            return ret;
	}
	
	public static float getFloat(HttpServletRequest request, String paramName) {
            float ret = 0;

            String paramStr = request.getParameter(paramName);
            if(exists(paramStr) && isFloat(paramStr))
                ret = Float.parseFloat(paramStr);

            return ret;
	}
	
	public static Date getDate(HttpServletRequest request, String paramName) {
            Date ret = null;

            String paramStr = request.getParameter(paramName);
            if(exists(paramStr) && isDate(paramStr))
                ret = parseDate(paramStr);

            return ret;
	}
	
	public static Timestamp getTimestamp(HttpServletRequest request, String paramName) {
            Timestamp ret = null;

            Date date = getDate(request, paramName);
            if(date != null)
                ret = new Timestamp(date.getTime());

            return ret;
	}
	
	public static String getString(String string) {
		if(string == null)
			return "";
		return string;
	}
	
	public static String getString(HttpServletRequest request, String paramName) {
		String ret = "";
		
		String paramStr = request.getParameter(paramName);
		if(exists(paramStr))
			ret = paramStr;
		
		return ret;
	}
	
	public static List<String> getStringArray(HttpServletRequest request, String paramName) {
		List<String> ret = new ArrayList<String>();
		
		String[] params = request.getParameterValues(paramName);
		if(params == null)
			return ret;
		
		for(int i = 0; i < params.length; i++)
			ret.add(params[i]);
		
		return ret;
	}
	
	public static List<Integer> getIntegerArray(HttpServletRequest request, String paramName) {
		return getIntegerArray(request, paramName, ",");
	}
	
	public static List<Integer> getIntegerArray(HttpServletRequest request, String paramName, String delimiter) {
		List<Integer> ret = new ArrayList<Integer>();
		
		String[] params = request.getParameterValues(paramName);
		
		if(params == null) {
			return ret;			
		}
		
		if(params.length == 1 && params[0].indexOf(delimiter) != -1)
			params = params[0].split(delimiter);
		
		for(int i = 0; i < params.length; i++)
			if(isInt(params[i]))
				ret.add(Integer.parseInt(params[i]));
		
		return ret;
	}
	
	public static List<Integer> getIntegerArray(String integers) {
		return getIntegerArray(integers, ",");
	}
	
	public static List<Integer> getIntegerArray(String integers, String delimiter) {
		List<Integer> ret = new ArrayList<Integer>();
		
		if(!exists(integers)) {
			return ret;
		}
		
		String[] params = integers.split(delimiter);
		for(int i = 0; i < params.length; i++)
			if(isInt(params[i]))
				ret.add(Integer.parseInt(params[i]));
		
		return ret;
	}
}
