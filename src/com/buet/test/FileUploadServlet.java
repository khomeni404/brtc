package com.buet.test;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;


@WebServlet("/FileUploadServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
        maxFileSize=1024*1024*10,      // 10MB
        maxRequestSize=1024*1024*50)

public class FileUploadServlet extends HttpServlet {
    private static final String SAVE_DIR="images";
    /*
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String savePath = "C:" + File.separator + SAVE_DIR; //specify your path here
        File fileSaveDir=new File(savePath);
        if(!fileSaveDir.exists()){
            fileSaveDir.mkdir();
        }

        Part part=request.getPart("file");
        String fileName=extractFileName(part);
        part.write(savePath + File.separator + fileName);

        //You need this loop if you submitted more than one file
        //        for (Part part : request.getParts()) {
        //            String fileName = extractFileName(part);
        //            part.write(savePath + File.separator + fileName);
        //        }
        //you can change this part acc. to your requirements
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/UploadFile","root","");
        String query="INSERT INTO table_name(file) values (?)";

        PreparedStatement pst;
        pst=con.prepareStatement(query);

        String filePath= savePath + File.separator + fileName ;
        pst.setString(1,filePath);
        pst.executeUpdate();
    }

    // file name of the upload file is included in content-disposition header like this:
    //form-data; name="dataFile"; filename="PHOTO.JPG"
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
            */
}
