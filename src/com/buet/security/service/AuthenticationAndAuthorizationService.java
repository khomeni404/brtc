package com.buet.security.service;

import java.util.List;

import com.buet.security.model.*;

public interface AuthenticationAndAuthorizationService {
	
	public boolean authenticate(String username, String password);
	
	public boolean checkAuthorization(List<Feature> features, String controller, String operation);
	
	public boolean authorizedGroupsAssignmentToUser(User user, List<AuthorizedGroups> authorizedGroups);
	
	public boolean authorityAssignmentToAuthorizedGroups(AuthorizedGroups authorizedGroups, List<Authority> authorities);
	
	public boolean aspectAssignmentToAuthority(Authority authority, List<Feature> features);

    //Authorized Groups
    public AuthorizedGroups getAuthorizedGroups(Long id);
    public List<AuthorizedGroups> findAllAuthorizedGroups();

}
