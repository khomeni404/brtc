package com.buet.security.service;

import java.util.List;

import com.buet.security.dao.*;
import com.buet.security.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SecurityServiceImpl implements SecurityService {

	@Autowired
	private SecurityDao securityDao;
    @Autowired
    private AuthorityDAO authorityDAO;
    @Autowired
    private UserGroupDAO userGroupDAO;
    @Autowired
    private AuthorizedGroupsDAO authorizedGroupsDAO;
    @Autowired
    private ComponentDAO componentDAO;


	@Override
	public List<Authority> findAllAuthorities(List<AuthorizedGroups> authorizedGroups) {
		return securityDao.findAllAuthorities(authorizedGroups);
	}

	@Override
	public List<Feature> findAllFeatures(List<Authority> authorities) {
		return securityDao.findAllFeatures(authorities);
	}

    @Override
    public Component getComponentById(Long componentId){
        return securityDao.getComponentById(componentId);
    }
    @Override
    public Component getComponentByName(String componentName){
       return securityDao.getComponentByName(componentName);
    }

    //AuthorizedGroups
    @Override
    public boolean save(AuthorizedGroups authorizedGroups) {
        return authorizedGroupsDAO.save(authorizedGroups);
    }

    @Override
    public boolean update(AuthorizedGroups groups) {
        return authorizedGroupsDAO.update(groups);
    }

    @Override
    public boolean delete(AuthorizedGroups groups) {
        return authorizedGroupsDAO.delete(groups);
    }

    @Override
    public List<AuthorizedGroups> findAllAuthorizedGroups() {
        return authorizedGroupsDAO.findAllAuthorizedGroups();
    }

    @Override
    public AuthorizedGroups getAuthorizedGroups(Long id) {
        return authorizedGroupsDAO.getAuthorizedGroups(id);
    }

    @Override
    public AuthorizedGroups getAuthorizedGroups(String groupName) {
        return authorizedGroupsDAO.getAuthorizedGroups(groupName);
    }

    //Component
    @Override
    public boolean save(Component module) {
        return componentDAO.save(module);
    }

    @Override
    public boolean update(Component module) {
        return componentDAO.update(module);
    }

    @Override
    public boolean delete(Component module) {
        return componentDAO.delete(module);
    }

    @Override
    public List<Component> findAllComponent() {
        return componentDAO.findAllComponent();
    }

    @Override
    public List<Component> findAllComponent(String searchText) {
        return componentDAO.findAllComponent(searchText);
    }

    @Override
    public Component getComponent(Long id) {
        return componentDAO.getComponent(id);
    }

    @Override
    public Component getComponent(String moduleName) {
        return componentDAO.getComponent(moduleName);
    }

    //Feature
    @Override
	public boolean save(Feature feature) {
		return securityDao.save(feature);
	}
    @Override
    public Feature findFeatureByOperation(String operation){
      return securityDao.findFeatureByOperation(operation);
    }

	@Override
	public List<Feature> findAllFeatures() {
		return securityDao.findAllFeatures();
	}

	@Override
	public boolean delete(Feature feature) {
		return securityDao.delete(feature);
	}

    //AuthorizedGroups


    //UserGroup
    @Override
    public boolean save(UserGroup group) {
        return userGroupDAO.save(group);
    }

    @Override
    public boolean update(UserGroup group) {
        return userGroupDAO.update(group);
    }

    @Override
    public boolean delete(UserGroup group) {
        return userGroupDAO.delete(group);
    }

    @Override
    public List<UserGroup> findAllUserGroup() {
        return userGroupDAO.findAllUserGroup();
    }

    @Override
    public List<UserGroup> findAllUserGroup(String searchText) {
        return userGroupDAO.findAllUserGroup(searchText);
    }

    @Override
    public UserGroup getUserGroup(Long id) {
        return userGroupDAO.getUserGroup(id);
    }

    @Override
    public UserGroup getUserGroup(String groupName) {
        return userGroupDAO.getUserGroup(groupName);
    }

    //Authority
    @Override
    public boolean save(Authority authority) {
        return authorityDAO.save(authority);
    }

    @Override
    public boolean update(Authority authority) {
        return authorityDAO.update(authority);
    }

    @Override
    public boolean delete(Authority authority) {
        return authorityDAO.delete(authority);
    }

    @Override
    public List<Authority> findAllAuthority() {
        return authorityDAO.findAllAuthority();
    }

    @Override
    public List<Authority> findAllAuthority(String searchText) {
        return authorityDAO.findAllAuthority();
    }

    @Override
    public Authority getAuthority(Long id) {
        return authorityDAO.getAuthority(id);
    }

    @Override
    public Authority findByAuthorityName(String authorityName) {
        return authorityDAO.findByAuthorityName(authorityName);
    }

   /* @Override
	public boolean save(Component component) {
		return securityDao.save(component);
	}
*/
	@Override
	public List<Component> findAllComponents() {
		return securityDao.findAllComponents();
	}

	/*@Override
	public boolean delete(Component component) {
		return securityDao.delete(component);
	}
*/

   /* @Override
    public List<AuthorizedGroups> findAllAuthorizedGroup(){
        return securityDao.findAllAuthorizedGroup();
    }*/

}
