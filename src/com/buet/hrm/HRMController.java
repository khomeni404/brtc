package com.buet.hrm;


import bd.com.softengine.util.MakString;
import com.buet.brtc.model.Client;
import com.buet.hrm.model.Department;
import com.buet.hrm.model.Designation;
import com.buet.hrm.model.UserDetails;
import com.buet.hrm.service.HRMService;
import com.buet.security.model.AuthorizedGroups;
import com.buet.security.model.Token;
import com.buet.security.model.User;
import com.buet.security.service.AuthenticationAndAuthorizationService;
import com.buet.security.service.UserDetailsService;
import com.buet.util.ERPConstants;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/hrm/")
public class HRMController {
    @Autowired
    HRMService hrmService;
    @Autowired
    UserDetailsService userDetailsService;
    @Autowired
    AuthenticationAndAuthorizationService authorizationService;

    @RequestMapping(method = RequestMethod.GET, value = "/userDetailsCreate.buet")
    public ModelAndView userDetailsCreate() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "User Details");
        map.put("DashboardLink", ERPConstants.DASHBOARD_LINK);

        List<Designation> designationList = hrmService.findAllDesignation();
        map.put("designationList", designationList);

        List<Department> departmentList = hrmService.findAllDepartment();
        map.put("departmentList", departmentList);

        List<AuthorizedGroups> groups = authorizationService.findAllAuthorizedGroups();
        map.put("groups", groups);

        return new ModelAndView("hrm/user_details_create", map);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/editUserDetails.buet")
    public ModelAndView userDetailsEdit(@RequestParam("id") Long id) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "User Details");
        map.put("DashboardLink", ERPConstants.DASHBOARD_LINK);

        UserDetails details = hrmService.getUserDetails(id);
        map.put("details", details);

        List<Designation> designationList = hrmService.findAllDesignation();
        map.put("designationList", designationList);

        List<Department> departmentList = hrmService.findAllDepartment();
        map.put("departmentList", departmentList);

        List<AuthorizedGroups> groups = authorizationService.findAllAuthorizedGroups();
        map.put("groups", groups);

        return new ModelAndView("hrm/user_details_edit", map);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/userDetailsList.buet")
    public ModelAndView userDetailsList() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "User Details");
        map.put("DashboardLink", ERPConstants.DASHBOARD_LINK);
        List<UserDetails> userDetailsList = hrmService.findAllUserDetails();
        map.put("userDetailsList", userDetailsList);
        return new ModelAndView("hrm/user_details", map);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/saveUserDetails.buet")
    public ModelAndView saveUserDetails(@RequestParam("username") String username,
                                        @RequestParam("name") String name,
                                        @RequestParam("nickName") String nickName,
                                        @RequestParam("desiId") Long desiId,
                                        @RequestParam("dptId") Long dptId,
                                        @RequestParam("groupId") Long authorizedId,
                                        @RequestParam("officePhone") String officePhone,
                                        @RequestParam("cellPhone") String cellPhone,
                                        @RequestParam("workEmail") String workEmail,
                                        @RequestParam("personalEmail") String personalEmail,
                                        @RequestParam("webLink") String webLink) {
        Department department = hrmService.getDepartment(dptId);
        Designation designation = hrmService.getDesignation(desiId);
        AuthorizedGroups authorizedGroups = authorizationService.getAuthorizedGroups(authorizedId);


        UserDetails userDetails = new UserDetails();
        userDetails.setName(MakString.getDashOnEmpty(name));
        userDetails.setCellPhone(MakString.getDashOnEmpty(cellPhone));
        userDetails.setDepartment(department);
        userDetails.setDesignation(designation);
        userDetails.setNickName(MakString.getDashOnEmpty(nickName));
        userDetails.setOfficePhone(MakString.getDashOnEmpty(officePhone));
        userDetails.setWorkEmail(MakString.getDashOnEmpty(workEmail));
        userDetails.setWebLink(MakString.getDashOnEmpty(webLink));
        userDetails.setPersonalEmail(MakString.getDashOnEmpty(personalEmail));

        department.getUserDetailsList().add(userDetails);
        designation.getUserDetailsList().add(userDetails);

        Token token = userDetailsService.getUser(username).getToken();
        //token = userDetailsService.getToken(token.getTokenId());
        token.setUserDetails(userDetails);
        token.getUser().getAuthorizedGroups().removeAll(token.getUser().getAuthorizedGroups());
        token.getUser().getAuthorizedGroups().add(authorizedGroups);
        hrmService.save(userDetails);
        userDetailsService.update(token);
        return new ModelAndView("redirect:/hrm/userDetailsList.buet");
    }


    @RequestMapping(method = RequestMethod.POST, value = "/updateUserDetails.buet")
    public ModelAndView updateUserDetails(@RequestParam("id") Long id,        // id = 2
                                          //@RequestParam("username") String username,
                                          @RequestParam("name") String name,   // name = Dr. M Abdul Karim
                                          @RequestParam("nickName") String nickName,  // nickName = karim w
                                          @RequestParam("desiId") Long desiId,      // desiId = 1
                                          @RequestParam("desiIdOld") Long desiIdOld,  //   desiIdOld = 1
                                          @RequestParam("dptId") Long dptId,           //   deptId =1
                                          @RequestParam("dptIdOld") Long dptIdOld,      // deptIdOld = 1
                                          @RequestParam("groupId") Long authorizedId,   //    groupId = 2
                                          @RequestParam("groupIdOld") Long authorizedIdOld,   //  groupIdOld=2
                                          @RequestParam("officePhone") String officePhone,  // officePhone = 02-01165466
                                          @RequestParam("cellPhone") String cellPhone,  //cellPhone = 1154545
                                          @RequestParam("workEmail") String workEmail,  //workEmail = abc@gmail.com
                                          @RequestParam("personalEmail") String personalEmail, //personalEmail = abc@gmail.com
                                          @RequestParam("webLink") String webLink) {  //webLink = www.mak.com

        Department departmentOld = hrmService.getDepartment(dptIdOld);
        departmentOld.getUserDetailsList().remove(hrmService.getUserDetails(id));

        Designation designationOld = hrmService.getDesignation(desiIdOld);
        designationOld.getUserDetailsList().remove(hrmService.getUserDetails(id));

        AuthorizedGroups authorizedGroupsOld = authorizationService.getAuthorizedGroups(authorizedIdOld);
        //authorizedGroupsOld.get
        Department department = hrmService.getDepartment(dptId);
        Designation designation = hrmService.getDesignation(desiId);
        AuthorizedGroups authorizedGroups = authorizationService.getAuthorizedGroups(authorizedId);


        UserDetails userDetails = hrmService.getUserDetails(id);
        userDetails.setName(MakString.getDashOnEmpty(name));
        userDetails.setCellPhone(MakString.getDashOnEmpty(cellPhone));
        userDetails.setDepartment(department);
        userDetails.setDesignation(designation);
        userDetails.setNickName(MakString.getDashOnEmpty(nickName));
        userDetails.setOfficePhone(MakString.getDashOnEmpty(officePhone));
        userDetails.setWorkEmail(MakString.getDashOnEmpty(workEmail));
        userDetails.setWebLink(MakString.getDashOnEmpty(webLink));
        userDetails.setPersonalEmail(MakString.getDashOnEmpty(personalEmail));
        //TODO...

        department.getUserDetailsList().add(userDetails);
        designation.getUserDetailsList().add(userDetails);

        Token token = userDetails.getToken();
        //token = userDetailsService.getToken(token.getTokenId());
        //token.setUserDetails(userDetails);
        token.getUser().getAuthorizedGroups().removeAll(token.getUser().getAuthorizedGroups());
        token.getUser().getAuthorizedGroups().add(authorizedGroups);
        hrmService.save(userDetails);
        //userDetailsService.update(token);
        return new ModelAndView("redirect:/security/userProfile.buet?id=" + userDetails.getToken().getUser().getAuthorizeId());
    }


    @RequestMapping(method = RequestMethod.GET, value = "/deleteUserDetails.buet")
    public
    @ResponseBody
    String deleteUserDetails(@RequestParam("id") Long id) {
        Map<String, Object> map = new HashMap<String, Object>();
        Gson gson = new Gson();

        UserDetails userDetails = hrmService.getUserDetails(id);
        Token token = userDetails.getToken();
        try {
            userDetailsService.delete(token.getUser());
            userDetails.getDepartment().getUserDetailsList().remove(userDetails);
            userDetails.getDesignation().getUserDetailsList().remove(userDetails);
            hrmService.delete(userDetails);
            map.put("success", "true");
        } catch (Exception e) {
            map.put("success", "false");
            map.put("msg", "<b>Note : </b><br/>This User already engaged with too much miscellaneous project relevant data.");
        }
        String json = gson.toJson(map);
        return json;
    }

    //========Designation Start========================================================
    @RequestMapping(method = RequestMethod.GET, value = "/createDesignation.buet")
    public ModelAndView createDesignation() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Create Designation");
        map.put("DashboardLink", ERPConstants.DASHBOARD_LINK);

        List<Designation> ds = hrmService.findAllDesignation();
        map.put("designationList", ds);

        return new ModelAndView("/hrm/designation", map);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/saveDesignation.buet")
    public ModelAndView saveDesignation(@RequestParam("name") String name,
                                        @RequestParam("description") String description) {
        Designation designation = new Designation();
        designation.setName(MakString.getDashOnEmpty(name));
        designation.setDescription(MakString.getDashOnEmpty(description));
        designation.setResponsibility("---");
        hrmService.save(designation);
        return new ModelAndView("redirect:/hrm/createDesignation.buet");
    }

    @RequestMapping(method = RequestMethod.POST, value = "/updateDesignation.buet")
    public ModelAndView updateDesignation(@RequestParam("id") Long id,
                                          @RequestParam("name") String name,
                                          @RequestParam("description") String description) {
        Designation designation = hrmService.getDesignation(id);
        designation.setDescription(MakString.getDashOnEmpty(description));
        designation.setName(MakString.getDashOnEmpty(name));
        designation.setResponsibility("---");
        hrmService.update(designation);
        return new ModelAndView("redirect:/hrm/createDesignation.buet");
    }

    @RequestMapping(method = RequestMethod.GET, value = "/deleteDesignation.buet")
    public
    @ResponseBody
    String deleteDesignation(@RequestParam("id") Long id) {
        Designation designation = hrmService.getDesignation(id);
        Map<String, String> map = new HashMap<String, String>();
        try {
            hrmService.delete(designation);
            map.put("msg", "Yes");
        } catch (Exception ex) {
            map.put("msg", "No");
        }
        Gson gson = new Gson();
        return gson.toJson(map);

    }
    //End Designation

    //========Department Start========================================================
    @RequestMapping(method = RequestMethod.GET, value = "/createDepartment.buet")
    public ModelAndView createDepartment() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Create Department");
        map.put("DashboardLink", ERPConstants.DASHBOARD_LINK);

        List<Department> departmentList = hrmService.findAllDepartment();
        map.put("departmentList", departmentList);

        return new ModelAndView("/hrm/department", map);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/saveDepartment.buet")
    public ModelAndView saveDepartment(@RequestParam("name") String name,
                                       @RequestParam("phone") String phone,
                                       @RequestParam("email") String email,
                                       @RequestParam("address") String address) {

        Department department = new Department();
        department.setName(MakString.getDashOnEmpty( name));
        department.setAddress(MakString.getDashOnEmpty(address));
        department.setEmail(MakString.getDashOnEmpty( email));
        department.setPhone(MakString.getDashOnEmpty( phone));
        hrmService.save(department);
        return new ModelAndView("redirect:/hrm/createDepartment.buet");
    }


    @RequestMapping(method = RequestMethod.POST, value = "/updateDepartment.buet")
    public ModelAndView updateDepartment(@RequestParam("id") Long id,
                                         @RequestParam("name") String name,
                                         @RequestParam("phone") String phone,
                                         @RequestParam("email") String email,
                                         @RequestParam("address") String address) {
        Department department = hrmService.getDepartment(id);
        department.setName(MakString.getDashOnEmpty( name));
        department.setAddress(MakString.getDashOnEmpty( address));
        department.setPhone(MakString.getDashOnEmpty( phone));
        department.setEmail(MakString.getDashOnEmpty( email));
        hrmService.update(department);
        return new ModelAndView("redirect:/hrm/createDepartment.buet");
    }

    /* @RequestMapping(method = RequestMethod.GET, value = "/deleteDepartment.buet")
     public ModelAndView deleteDepartment(@RequestParam("id") Long id) {
         Department department.sql = hrmService.getDepartment(id);
         hrmService.delete(department.sql);
         return new ModelAndView("redirect:/hrm/createDepartment.buet");
     }*/
    @RequestMapping(value = "/deleteDepartment.buet", method = RequestMethod.GET)
    public
    @ResponseBody
    String deleteDepartment(@RequestParam("id") Long id) {
        Gson gson = new Gson();
        Map<String, Object> map = new HashMap<String, Object>();

        Department department = hrmService.getDepartment(id);
        int numProject = department.getProjectList().size();
        int numTeacher = department.getUserDetailsList().size();

        if (numProject <= 0 && numTeacher <= 0) {
            hrmService.delete(department);
            map.put("success", "yes");
        } else {
            map.put("success", "no");
            if (numTeacher > 0)
                map.put("msg", "<b>Note : </b><br/>This Department has " + numTeacher +
                        " teacher" + (numProject <= 1 ? "" : "s").toString() + " already in list.");
            else
                map.put("msg", "<b>Note : </b><br/>This Department already engaged with " + numProject +
                        " project" + (numProject <= 1 ? "." : "s.").toString());
        }
        String json = gson.toJson(map);
        return json;
    }
    //End Department

    //========Teacher Start========================================================
    @RequestMapping(method = RequestMethod.POST, value = "/saveTeacher.buet")
    public ModelAndView saveTeacher(@RequestParam("username") String username,
                                    @RequestParam("password") String password,
                                    @RequestParam("confirmPassword") String confirmPassword,
                                    @RequestParam("userType") String userType) {
        Map<String, String> map = new HashMap<String, String>();
        User userDuplicate = userDetailsService.findUserByUserCode(username);
        if (userDuplicate != null) {
            String errMsg = "User already exists";
            //System.out.println("userDuplicate.getToken() = " + userDuplicate.getToken().getUsername());
            map.put("PageTitle", "User Create");
            return new ModelAndView("redirect:/security/createUser.buet?errMsg=" + errMsg, map);
        } else {
            if (password.equals(confirmPassword)) {
                Token userToken = new Token();
                userToken.setUsername(username);
                userToken.setPassword(password);

                userDetailsService.saveUser(userToken, userType);
                //System.out.println("userDuplicate.getToken() second case = " + userToken.getUsername());
                String errMsg = "";
                map.put("PageTitle", "User Create");

                return new ModelAndView("redirect:/security/createUser.buet?errMsg=" + errMsg, map);
            } else {
                String errMsg = "Password doesn't match";
                map.put("PageTitle", "User Create");


                return new ModelAndView("redirect:/security/createUser.buet?errMsg=" + errMsg, map);
            }

        }

    }
}
