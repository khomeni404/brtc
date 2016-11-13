package com.buet.security.dao;

import java.util.List;

import com.buet.security.model.Feature;
import com.buet.security.model.Authority;
import com.buet.security.model.AuthorizedGroups;
import com.buet.security.model.User;

public interface AuthenticationAndAuthorizationDao {

	public boolean authorizedGroupsAssignmentToUser(User user, List<AuthorizedGroups> authorizedGroups);
	
	public boolean authorityAssignmentToAuthorizedGroups(AuthorizedGroups authorizedGroups, List<Authority> authorities);
	
	public boolean featureAssignmentToAuthority(Authority authority, List<Feature> features);

}
