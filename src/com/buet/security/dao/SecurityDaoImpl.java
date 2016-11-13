package com.buet.security.dao;

import com.buet.security.model.Authority;
import com.buet.security.model.AuthorizedGroups;
import com.buet.security.model.Component;
import com.buet.security.model.Feature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
@Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
public class SecurityDaoImpl implements SecurityDao {

    @Autowired
	private HibernateTemplate hibernateTemplate;

/*    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(Feature feature) {

        System.out.println("feature.getDescription()"+feature.getDescription());
        try{
            hibernateTemplate.saveOrUpdate(feature);

            return true;
        } catch (Exception ex) {
            System.out.println("ex = " + ex);
            return false;
        }

    }*/

    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(Feature feature){
        hibernateTemplate.persist(feature);

        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(Feature feature) {
        try{
            hibernateTemplate.merge(feature);

            return false;
        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    public Feature getFeature(int featureId) {
        return hibernateTemplate.get(Feature.class, featureId);
    }

    @Override
    public Feature findFeatureByOperation(String operation) {


        try{
            List<Feature> features = hibernateTemplate.find(" from Feature as feature where feature.operation =" + operation +"'");
            if(features.size() > 0){
                return features.get(0);
            }
            else {
                return null;
            }
        }
        catch (Exception ex) {
            return null;
        }
    }

    @Override
    public List<Feature> findAllFeatures() {
        return hibernateTemplate.find(" from Feature ");
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(Feature feature) {
        return false;  //To change body of implemented methods use File | Settings | File Templates.
    }

    /*@Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(Authority authority) {
        try{
            hibernateTemplate.persist(authority);

            return false;
        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(Authority authority) {
        try{
            hibernateTemplate.persist(authority);

            return false;
        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    public Authority getAuthority(Long authorityId) {
        return hibernateTemplate.get(Authority.class, authorityId);
    }
    @Override
    public Authority findByAuthorityName(String authorityName){
        Object[] paramArr = new Object[1];
        paramArr[0] = new String(authorityName);
        try {
            return (Authority) hibernateTemplate.find("from Authority where authorityName=?", paramArr).get(0);
        }catch (IndexOutOfBoundsException ex){
            return null;
        }
    }


    @Override
    public List<Authority> findAllAuthorities() {
        return hibernateTemplate.find(" from Authority ");
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(Authority authority) {
        return false;  //To change body of implemented methods use File | Settings | File Templates.
    }
*/
    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(Component component) {
        try{
            hibernateTemplate.persist(component);

            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(Component component) {
        try{
            hibernateTemplate.merge(component);

            return false;
        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    public Component getComponent(int componentId) {
        return hibernateTemplate.get(Component.class, componentId);
    }


    @Override
    public List<Component> findAllComponents() {
        return hibernateTemplate.find(" from Component ");
    }

    @Override
    public Component getComponentById(Long componentId){
        
        return hibernateTemplate.get(Component.class, componentId);

    }
    @Override
    public Component getComponentByName(String componentName){
        try{
            List<Component> components = hibernateTemplate.find(" from Component as com where com.componentName="+ componentName+"'");
            if(components.size()>0){
                return components.get(0);
            }
            else {
                return null;
            }
        }
        catch (Exception ex) {
            return null;
        }

    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(Component component) {
        return false;  //To change body of implemented methods use File | Settings | File Templates.
    }

   /* @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(AuthorizedGroups authorizedGroups) {
        try{
            hibernateTemplate.persist(authorizedGroups);

            return true;
        } catch (Exception ex) {
            return false;
        }

    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(AuthorizedGroups authorizedGroups) {
        try{
            hibernateTemplate.merge(authorizedGroups);

            return true;
        } catch (Exception ex) {
            return false;
        }
    }

    @Override
    public AuthorizedGroups getAuthorizedGroups(int authorizedGroupId) {
        return hibernateTemplate.get(AuthorizedGroups.class, authorizedGroupId);
    }

    @Override
    public List<AuthorizedGroups> findAllAuthorizedGroups() {
        return hibernateTemplate.find("from AuthorizedGroups ");
    }
*/
    @Override
    public List<Authority> findAllAuthorities(List<AuthorizedGroups> authorizedGroups) {
        return hibernateTemplate.find(" from AuthorizedGroups ");
    }

    @Override
    public List<Feature> findAllFeatures(List<Authority> authorities) {
        return hibernateTemplate.find(" from Feature ");
    }
   /* @Override
    public List<AuthorizedGroups> findAllAuthorizedGroup(){
        return hibernateTemplate.find(" from  AuthorizedGroups ");
    }*/
}
