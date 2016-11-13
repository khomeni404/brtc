package com.buet.brtc.dao;

import com.buet.brtc.model.BRTCProject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: MAyatullah
 * Date: 8/23/14
 * Time: 4:18 PM
 * To change this template use File | Settings | File Templates.
 */
@Repository
public class BrtcProjectDaoImpl implements BrtcProjectDAO {
    @Autowired
    private HibernateTemplate hibernateTemplate;

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean save(BRTCProject project) {
        try {
            hibernateTemplate.persist(project);
            hibernateTemplate.flush();
            return true;
        } catch (Exception ex){
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean update(BRTCProject project) {
        hibernateTemplate.merge(project);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public boolean delete(BRTCProject project) {
        hibernateTemplate.delete(project);
        hibernateTemplate.flush();
        return true;
    }

    @Override
    public List<BRTCProject> findAllBrtcProject() {
        return hibernateTemplate.find("from BRTCProject  ORDER BY id desc");
    }

    @Override
    public List<BRTCProject> findAllBrtcProject(Date startDate, Date endDate) {
        Object[] param = new Object[2];
        param[0] = startDate;
        param[1] = endDate;
        try {
            return hibernateTemplate.find("from BRTCProject where (recordDate between ? and ?) ", param);
        }catch (IndexOutOfBoundsException ex){
            return null;
        }
    }
    @Override
    public List<BRTCProject> findAllBrtcProject(Date startDate, Date endDate, Integer status) {
        Object[] param = new Object[3];
        param[0] = startDate;
        param[1] = endDate;
        param[2] = status;
        try {
            return hibernateTemplate.find("from BRTCProject where (recordDate between ? and ?) and (projectStatus.progressStatus=?) ", param);
        }catch (IndexOutOfBoundsException ex){
            return null;
        }
    }

    @Override
    public List<BRTCProject> findAllBrtcProject(String queryString) {
        Object[] param;
        String query;
        if (queryString.startsWith("=")) {
            param = new Object[1];
            param[0] = queryString.replace("=", "");
            query = "from BRTCProject where fileNo=?";
        } else {
            param = new Object[2];
            param[0] = "%"+queryString+"%";
            param[1] = "%"+queryString+"%";
            query = "from BRTCProject where (fileNo like ?) or (projectTitle like ?) ORDER BY id desc";
        }
        try {
            return hibernateTemplate.find(query, param);
        }catch (IndexOutOfBoundsException ex){
            return null;
        }

    }

    @Override
    public List<BRTCProject> findAllBrtcProject(String[] param) {
        Object[] obj = new Object[5];
        obj[0] = param[0];
        obj[1] = param[1];
        obj[2] = param[2];
        obj[3] = param[3];
        obj[4] = param[4];
        //TODO..
        return hibernateTemplate.find("from BRTCProject where fileNo=?  ORDER BY id desc", obj);

    }

    @Override
    public BRTCProject getBrtcProject(Long id) {
        return hibernateTemplate.get(BRTCProject.class, id);
    }

    @Override
    public BRTCProject getBrtcProject(String fileNo) {
        Object[] obj = new Object[1];
        obj[0] = fileNo;
        try {
            return (BRTCProject) hibernateTemplate.find("from BRTCProject where fileNo=?", obj).get(0);
        }catch (IndexOutOfBoundsException ex){
            return null;
        }
    }
}
