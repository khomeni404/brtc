package com.buet.security.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="ABC_AUTHORITY")
public class Authority implements Serializable{
	
	private static final long serialVersionUID = -7056246735190005660L;
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long authorityId;
	private String authorityName;
	private String authorityDescription;
	
	@ManyToMany(mappedBy = "authorities")
	private List<AuthorizedGroups> authorizedGroups;
	
	@ManyToMany
	private List<Feature> features;

	public List<Feature> getFeatures() {
		return features;
	}
	public void setFeatures(List<Feature> features) {
		this.features = features;
	}
	public List<AuthorizedGroups> getAuthorizedGroups() {
		return authorizedGroups;
	}
	public void setAuthorizedGroups(List<AuthorizedGroups> authorizedGroups) {
		this.authorizedGroups = authorizedGroups;
	}
	public Long getAuthorityId() {
		return authorityId;
	}
	public void setAuthorityId(Long authorityId) {
		this.authorityId = authorityId;
	}
	public String getAuthorityName() {
		return authorityName;
	}
	public void setAuthorityName(String authorityName) {
		this.authorityName = authorityName;
	}
	public String getAuthorityDescription() {
		return authorityDescription;
	}
	public void setAuthorityDescription(String authorityDescription) {
		this.authorityDescription = authorityDescription;
	}
	
	

}
