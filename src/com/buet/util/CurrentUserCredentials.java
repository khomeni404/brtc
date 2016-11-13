package com.buet.util;

import com.buet.security.SessionUtil;
import com.buet.security.model.AuthorizedGroups;
import com.buet.security.model.User;

import java.util.List;

public class CurrentUserCredentials {
    public User user = SessionUtil.getSessionUser();
    public static User staticUser = SessionUtil.getSessionUser();
    public String userPassword = user.getToken().getPassword();
    public String username =   user.getToken().getUsername();
    //public String name =   user.getToken().getUserDetails().getName();
    //public String designation =   user.getToken().getUserDetails().getDesignation().getName();
    //public String department.sql =   user.getToken().getUserDetails().getDepartment().getName();
    public Long authorizeId = user.getAuthorizeId();
    public List<AuthorizedGroups> authorizedGroups  = user.getAuthorizedGroups();
}
