package com.buet.security.dao;

import java.util.List;

import com.buet.security.model.Feature;
import com.buet.security.model.Authority;
import com.buet.security.model.AuthorizedGroups;
import com.buet.security.model.Component;

public interface SecurityDao {
	
	public boolean save(Feature feature);

    public boolean update(Feature feature);

    public Feature findFeatureByOperation(String operation);

    public Feature getFeature(int featureId);
	
	public List<Feature> findAllFeatures();
	
	public boolean delete(Feature feature);
	
/*	public boolean save(Authority authority);

    public boolean update(Authority authority);

    public Authority getAuthority(Long authorityId);
	
	public List<Authority> findAllAuthorities();
	
	public Authority findByAuthorityName(String authorityName);*/
	
	//public boolean delete(Authority authority);
	
	public boolean save(Component component);

    public boolean update(Component component);

    public Component getComponent(int componentId);
	
	public List<Component> findAllComponents();

    public Component getComponentById(Long componentId);

    public Component getComponentByName(String componentName);
	
	public boolean delete(Component component);


	
	public List<Authority> findAllAuthorities(List<AuthorizedGroups> authorizedGroups);
	
	public List<Feature> findAllFeatures(List<Authority> authorities);
    

	
}
