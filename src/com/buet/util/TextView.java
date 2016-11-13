/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.buet.util;

import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import org.springframework.web.servlet.View;

/**
 *
 * @author khomeni
 */
public class TextView implements View {
    public String getContentType() {		
        return "text/html";
    }

    public void render(Map map, HttpServletRequest request,
                    HttpServletResponse response) throws Exception {
        JSONObject jsonObject = new JSONObject(map);
        PrintWriter writer = response.getWriter();
        writer.write("<html><textarea>"+jsonObject.toString()+"</textarea></html>");
    }
}
