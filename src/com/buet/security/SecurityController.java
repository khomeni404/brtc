package com.buet.security;

import com.buet.security.model.*;
import com.buet.security.service.AuthenticationAndAuthorizationService;
import com.buet.security.service.SecurityService;
import com.buet.security.service.UserDetailsService;
import com.buet.util.CurrentUserCredentials;
import com.buet.util.ERPConstants;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/security/")
public class SecurityController {

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private SecurityService securityService;


    @Autowired
    private AuthenticationAndAuthorizationService authorizationService;
    private HttpSession userSession;

    @RequestMapping(method = RequestMethod.GET, value = "/home.buet")
    public ModelAndView index() throws Exception {
        Map<String, Object> map = new HashMap<String, Object>();


        //return new ModelAndView("/security/index", map);
        return new ModelAndView("template/app_layout", map);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/passwordRequest.buet")
    public ModelAndView passwordRequest() {
        Map<String, String> passwordRequestMap = new HashMap<String, String>();
        passwordRequestMap.put("success", "");

        return new ModelAndView("/security/password_request", passwordRequestMap);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/userSummary.buet")
    public ModelAndView userSummary() {
        return new ModelAndView("/security/user_list");
    }

    @RequestMapping(method = RequestMethod.GET, value = "/logout.buet")
    public ModelAndView logout() {
        userSession = SessionUtil.getSession();
        userSession.removeAttribute(ERPConstants.SESSION_USER);
        userSession.removeAttribute(ERPConstants.SESSION_USER_FEATURES);
        userSession.invalidate();
        return new ModelAndView("redirect:/home.buet");
    }


    @RequestMapping(method = RequestMethod.GET, value = "/userAuthorizedGroupAssignment.buet")
    public ModelAndView userAuthorizedGroupAssignment() {
        System.out.println("assignment !!! ");
        return new ModelAndView("/security/user_list");
    }


    //=======USER=========START================================================
    @RequestMapping(method = RequestMethod.GET, value = "/createUser.buet")
    public ModelAndView createUser(@RequestParam("errMsg") String errMsg) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Create User");
        map.put("DashboardLink", ERPConstants.DASHBOARD_LINK);
        map.put("errMsg", errMsg);
        List<User> users = userDetailsService.getAllUsers();
        map.put("userList", users);

        return new ModelAndView("/security/user_create", map);

    }

    //Ajax Call
    @RequestMapping(value = "/checkDuplicateUser.buet", method = RequestMethod.GET)
    public
    @ResponseBody
    String checkDuplicateUser(@RequestParam("username") String username) {
        User user = userDetailsService.getUser(username);
        Gson gson = new Gson();
        Map<String, Object> map = new HashMap<String, Object>();
        if (user != null) {
            map.put("msg", "Yes");
            map.put("name", user.getToken().getUserDetails().getName());
        } else {
            map.put("msg", "No");
        }
        String json = gson.toJson(map);
        return json;
    }

    @RequestMapping(value = "/saveUser.buet", method = RequestMethod.GET)
    public
    @ResponseBody
    String saveUser(@RequestParam("username") String username,
                    @RequestParam("password") String password,
                    @RequestParam("confirmPassword") String confirmPassword,
                    @RequestParam("userType") String userType) {
        Gson gson = new Gson();
        Map<String, Object> map = new HashMap<String, Object>();
        User userDuplicate = userDetailsService.findUserByUserCode(username);
        if (userDuplicate != null) {
            map.put("success", "no");
            map.put("msg", "This username already taken by " + userDuplicate.getToken().getUserDetails().getName());
            String json = gson.toJson(map);
            return json;
        } else {
            if (password.equals(confirmPassword)) {
                Token userToken = new Token();
                userToken.setUsername(username);
                userToken.setPassword(password);
                userDetailsService.saveUser(userToken, userType);
                map.put("success", "yes");
                map.put("msg", "User Saved Successfully");
                String json = gson.toJson(map);
                return json;
            } else {
                map.put("success", "no");
                map.put("msg", "Password doesn't match");
                String json = gson.toJson(map);
                return json;
            }
        }
    }

   /* @RequestMapping(method = RequestMethod.POST, value = "/saveUser.buet")
    public ModelAndView saveUser(@RequestParam("username") String username,
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

    }*/

    @RequestMapping(method = RequestMethod.GET, value = "/editUser.buet")
    public ModelAndView editUser(@RequestParam("id") Long id) {
        Map<String, Object> updateUserMap = new HashMap<String, Object>();
        User user;
        if (id == 0L) {
            user = new CurrentUserCredentials().user;
            id = user.getAuthorizeId();
        } else {
            user = userDetailsService.getUser(id);
        }
        updateUserMap.put("PageTitle", "Update User");
        updateUserMap.put("DashboardLink", ERPConstants.DASHBOARD_LINK);
        updateUserMap.put("userId", id);
        updateUserMap.put("userName", user.getToken().getUsername());

        return new ModelAndView("/security/user_edit", updateUserMap);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/userProfile.buet")
    public ModelAndView userProfile(@RequestParam("id") Long id) {
        Map<String, Object> map = new HashMap<String, Object>();
        User user;
        if (id == 0L) {
            user = new CurrentUserCredentials().user;
            //id = user.getAuthorizeId();
        } else {
            user = userDetailsService.getUser(id);
        }
        map.put("PageTitle", "User Profile");
        map.put("DashboardLink", ERPConstants.DASHBOARD_LINK);
        map.put("user", user);
        map.put("details", user.getToken().getUserDetails());

        return new ModelAndView("/hrm/user_profile", map);
    }

    @RequestMapping(value = "/updateUser.buet", method = RequestMethod.GET)
    public
    @ResponseBody
    String updateUser(@RequestParam("password") String password,
                      @RequestParam("id") Long id) {
        Gson gson = new Gson();
        Map<String, Object> map = new HashMap<String, Object>();
        User user = userDetailsService.getUser(id);
        Token token = user.getToken();
        map.put("PageTitle", "Update User");
        map.put("DashboardLink", ERPConstants.DASHBOARD_LINK);
        if (!password.equals("")) {
            try {
                token.setPassword(password);
                userDetailsService.updateToken(token);
                map.put("success", "yes");
                map.put("msg", "Update Password Successfully !");
            } catch (Exception ex) {
                map.put("success", "no");
                map.put("msg", "Password Can't be changed !");
            }
        } else {
            map.put("success", "yes");
            map.put("msg", "Password kept as before !");
        }

        String json = gson.toJson(map);
        return json;
    }


    @RequestMapping(method = RequestMethod.GET, value = "/userList.buet")
    public ModelAndView userList() {
        System.out.println("userList");
        Map<String, String> userListMap = new HashMap<String, String>();
        userListMap.put("PageTitle", "User List");
        return new ModelAndView("redirect:/security/user_list", userListMap);
    }


    @RequestMapping(method = RequestMethod.GET, value = "/deleteUser.buet")
    public ModelAndView deleteUser(@RequestParam("id") Long id) {
        userDetailsService.delete(userDetailsService.getUser(id));
        return new ModelAndView("redirect:/security/createUser.buet?errMsg=");

    }

    //=======USER=========END================================================


    //========Component Start==============================================
    @RequestMapping(method = RequestMethod.GET, value = "/componentList.buet")
    public ModelAndView componentList(@RequestParam("msg") String msg) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Component");
        map.put("DashboardLink", ERPConstants.DASHBOARD_LINK);

        List<Component> componentList = securityService.findAllComponents();
        map.put("componentList", componentList);
        map.put("msg", msg);
        return new ModelAndView("/security/component", map);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/saveComponent.buet")
    public ModelAndView saveComponent(@RequestParam("componentName") String componentName, @RequestParam("description") String description) {
        Map<String, String> saveComponentMap = new HashMap<String, String>();
        Component componentDuplicate = securityService.getComponentByName(componentName);
        if (componentDuplicate != null) {
            saveComponentMap.put("msg", "Component already exists");
            saveComponentMap.put("PageTitle", "Component");
            return new ModelAndView("redirect:/security/componentList.buet", saveComponentMap);
        } else {
            Component component = new Component();
            component.setComponentName(componentName);
            component.setDescription(description);
            securityService.save(component);
            saveComponentMap.put("PageTitle", "Create Component");
            saveComponentMap.put("msg", "Component Saved Successfully !!");
            return new ModelAndView("redirect:/security/componentList.buet", saveComponentMap);

        }

    }

    @RequestMapping(method = RequestMethod.POST, value = "/updateComponent.buet")
    public ModelAndView updateComponent(@RequestParam("id") Long id,
                                        @RequestParam("name") String name,
                                        @RequestParam("desc") String desc) {
        Map<String, String> map = new HashMap<String, String>();

        Component component = securityService.getComponent(id);
        component.setComponentName(name);
        component.setDescription(desc);

        securityService.update(component);
        map.put("msg", "Updated Successfully !!");
        return new ModelAndView("redirect:/security/componentList.buet", map);

    }


    @RequestMapping(method = RequestMethod.GET, value = "/deleteComponent.buet")
    public ModelAndView deleteComponent(@RequestParam("id") Long id) {
        Map<String, String> map = new HashMap<String, String>();

        Authority authority = securityService.getAuthority(id);

        if (securityService.delete(authority)) {
            map.put("msg", "Authority Deleted Successfully !!");
            return new ModelAndView("redirect:/security/componentList.buet", map);
        } else {
            map.put("msg", "Authority Can't be deleted");
            return new ModelAndView("redirect:/security/componentList.buet", map);
        }
    }





    //========Authority Start==============================================
    @RequestMapping(method = RequestMethod.GET, value = "/authorityList.buet")
    public ModelAndView authorityList(@RequestParam("result") String result) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Authority");
        map.put("DashboardLink", ERPConstants.DASHBOARD_LINK);
        List<Authority> authorityList = securityService.findAllAuthority();
        map.put("authorityList", authorityList);
        map.put("result", result);
        return new ModelAndView("/security/authority", map);
    }


    @RequestMapping(method = RequestMethod.POST, value = "/saveAuthority.buet")
    public ModelAndView saveAuthority(@RequestParam("name") String authorityName,
                                      @RequestParam("desc") String desc) {
        Map<String, String> map = new HashMap<String, String>();
        Authority authorityDuplicate = securityService.findByAuthorityName(authorityName);

        if (authorityDuplicate != null) {
            map.put("result", "Authority already exists!!!");
            return new ModelAndView("redirect:/security/authorityList.buet", map);
        } else {
            Authority authority = new Authority();
            authority.setAuthorityName(authorityName);
            authority.setAuthorityDescription(desc);

            securityService.save(authority);
            map.put("result", "Authority Saved Successfully !!");
            return new ModelAndView("redirect:/security/authorityList.buet", map);
        }
    }

    @RequestMapping(method = RequestMethod.POST, value = "/updateAuthority.buet")
    public ModelAndView updateAuthority(@RequestParam("id") Long id,
                                        @RequestParam("name") String name,
                                        @RequestParam("desc") String desc) {
        Map<String, String> map = new HashMap<String, String>();

        Authority authority = securityService.getAuthority(id);
        authority.setAuthorityName(name);
        authority.setAuthorityDescription(desc);

        securityService.update(authority);
        map.put("result", "Updated Successfully !!");
        return new ModelAndView("redirect:/security/authorityList.buet", map);

    }


    @RequestMapping(method = RequestMethod.GET, value = "/deleteAuthority.buet")
    public ModelAndView deleteAuthority(@RequestParam("id") Long id) {
        Map<String, String> map = new HashMap<String, String>();

        Authority authority = securityService.getAuthority(id);

        if (securityService.delete(authority)) {
            map.put("result", "Authority Deleted Successfully !!");
            return new ModelAndView("redirect:/security/authorityList.buet", map);
        } else {
            map.put("result", "Authority Can't be deleted");
            return new ModelAndView("redirect:/security/authorityList.buet", map);
        }
    }

    //======== Authorized Group Start==============================================
    @RequestMapping(method = RequestMethod.GET, value = "/authorizedGroupsList.buet")
    public ModelAndView authorizedGroupsList(@RequestParam("msg") String msg) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "User Group");
        map.put("DashboardLink", ERPConstants.DASHBOARD_LINK);

        List<AuthorizedGroups> groupsList = securityService.findAllAuthorizedGroups();
        map.put("groupsList", groupsList);
        map.put("msg", msg);
        return new ModelAndView("/security/group", map);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/saveAuthorizedGroups")
    public ModelAndView saveAuthorizedGroups(@RequestParam("name") String name,
                                             @RequestParam("desc") String authorizationDescription) {

        Map<String, String> map = new HashMap<String, String>();
        AuthorizedGroups duplicateGroup = securityService.getAuthorizedGroups(name);

        if (duplicateGroup != null) {
            map.put("msg", "Group already exists!!!");
            return new ModelAndView("redirect:/security/authorizedGroupsList.buet", map);
        } else {
            AuthorizedGroups group = new AuthorizedGroups();
            group.setAuthorizationName(name);
            group.setAuthorizationDescription(authorizationDescription);

            securityService.save(group);

            map.put("msg", "Authorized Group is saved successfully!!!");

            return new ModelAndView("redirect:/security/authorizedGroupsList.buet", map);
        }
    }

    @RequestMapping(method = RequestMethod.POST, value = "/updateAuthorizedGroups.buet")
    public ModelAndView updateUserGroup(@RequestParam("id") Long id,
                                        @RequestParam("name") String name,
                                        @RequestParam("desc") String desc) {
        Map<String, String> map = new HashMap<String, String>();

        AuthorizedGroups group = securityService.getAuthorizedGroups(id);
        group.setAuthorizationName(name);
        group.setAuthorizationDescription(desc);

        securityService.update(group);
        map.put("msg", "Updated Successfully !!");
        map.put("PageTitle", "Group");
        return new ModelAndView("redirect:/security/authorizedGroupsList.buet", map);

    }


    @RequestMapping(method = RequestMethod.GET, value = "/deleteAuthorizedGroups.buet")
    public ModelAndView deleteUserGroup(@RequestParam("id") Long id) {
        Map<String, String> map = new HashMap<String, String>();

        AuthorizedGroups group = securityService.getAuthorizedGroups(id);

        if (securityService.delete(group)) {
            map.put("msg", "Group Deleted Successfully !!");
            return new ModelAndView("redirect:/security/authorizedGroupsList.buet", map);
        } else {
            map.put("msg", "Group Can't be deleted");
            return new ModelAndView("redirect:/security/authorizedGroupsList.buet", map);
        }

    }

    //========Feature Start==============================================
    @RequestMapping(method = RequestMethod.GET, value = "/featureList.buet")
    public ModelAndView featureList() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Feature");
        map.put("DashboardLink", ERPConstants.DASHBOARD_LINK);

        List<Feature> featureLists = securityService.findAllFeatures();
        map.put("featureLists", featureLists);

        List<Component> componentList = securityService.findAllComponents();
        map.put("componentList", componentList);

        return new ModelAndView("/security/feature", map);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/saveFeature.buet")
    public ModelAndView saveFeature(@RequestParam("description") String description,
                                    @RequestParam("operation") String operation,
                                    @RequestParam("componentId") Long componentId) {
        Map<String, String> map = new HashMap<String, String>();
        Feature featureOperationDuplicate = securityService.findFeatureByOperation(operation);
        if (featureOperationDuplicate != null) {

            map.put("result", "User already exists");
            map.put("PageTitle", "Feature");
            return new ModelAndView("redirect:/security/featureList.buet", map);

        } else {
            //Long componentIdNumber = Long.valueOf(componentId);
            Component component = securityService.getComponentById(componentId);
            Authority superAdminAuthority = securityService.findByAuthorityName("super_admin");
            Feature feature = new Feature();
            feature.setDescription(description);
            feature.setOperation(operation);
            feature.setComponent(component);
            superAdminAuthority.getFeatures().add(feature);

            securityService.save(feature);
            map.put("PageTitle", "Feature");

            return new ModelAndView("redirect:/security/featureList.buet", map);

        }
    }

}