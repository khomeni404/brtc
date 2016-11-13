package com.buet.test;


//import net.viralpatel.spring3.form.FileUploadForm;

import org.springframework.stereotype.Controller;

/**
 * Created with IntelliJ IDEA.
 * User: Khomeni
 * Date: 11/2/14
 * Time: 9:49 AM
 * To change this template use File | Settings | File Templates.
 */

@Controller
public class FileUploadController {
    /*
    //private String saveDirectory = "D:/Test/Upload/"; //Here I Added
    private String saveDirectory = null; //Here I Added

    @RequestMapping(value = "/show", method = RequestMethod.GET)
    public String displayForm() {
        return "file_upload_form";
    }

    @SuppressWarnings("null")
    @RequestMapping(value = "/save", method = RequestMethod.POST)
    public String save(
            @ModelAttribute("uploadForm") FileUploadForm uploadForm,
            Model map,HttpServletRequest request) throws IllegalStateException, IOException{

        List<MultipartFile> files = uploadForm.getFiles();
        List<String> fileUrl = new ArrayList<String>();;
        String fileName2 = null;
        fileName2 = request.getSession().getServletContext().getRealPath("/");


        saveDirectory = fileName2+"images\\";

        List<String> fileNames = new ArrayList<String>();

        //System.out.println("user directory : "+System.getProperty("user.dir"));
        System.out.println("applied directory : " + saveDirectory);
        if(null != files && files.size() > 0) {
            for (MultipartFile multipartFile : files) {

                String fileName = multipartFile.getOriginalFilename();
                System.out.println("applied directory : " + saveDirectory+fileName);
                if(!"".equalsIgnoreCase(fileName)){
                    //Handle file content - multipartFile.getInputStream()
                    fileUrl.add(new String(saveDirectory + fileName));

                    multipartFile.transferTo(new File(saveDirectory + fileName));   //Here I Added
                    fileNames.add(fileName);
                }
                //fileNames.add(fileName);
                //Handle file content - multipartFile.getInputStream()
                //multipartFile.transferTo(new File(saveDirectory + multipartFile.getOriginalFilename()));   //Here I Added
            }
        }

        map.addAttribute("files", fileNames);
        map.addAttribute("imageurl",fileUrl);
        return "file_upload_success";
    }
    */
}