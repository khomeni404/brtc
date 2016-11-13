package com.buet.home;

import bd.com.softengine.util.MakDate;
import com.buet.brtc.model.BRTCProject;
import com.buet.brtc.model.ProjectHistory;
import com.buet.brtc.service.BRTCService;
import com.buet.security.SessionUtil;
import com.buet.util.CurrentUserCredentials;
import com.buet.security.model.User;
import com.buet.util.ERPConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    BRTCService brtcService;
    private HttpSession userSession;

    @RequestMapping(method = RequestMethod.GET, value = "/home.buet")
    public ModelAndView home() {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Home");
        CurrentUserCredentials cuc = new CurrentUserCredentials();
        User currentUser = cuc.user;
        List<BRTCProject> projectList = brtcService.findAllBrtcProject("P", 5);
        List<Map<String, Object>> projectDataList = new ArrayList<Map<String, Object>>();
        Map<String, Object> pMap;
        for (BRTCProject p : projectList) {
            pMap = new HashMap<String, Object>();
            pMap.put("fileNo", p.getFileNo());
            pMap.put("received", brtcService.getTotalReceived(p));
            pMap.put("distributed", brtcService.getTotalDistributed(p));
           /* pMap.put("exists", false);
            List<TeamMember> ml = p.getTeam().getTeamMemberList();
            for (TeamMember m : ml) {
                if (m.getTeamMember()==currentUser){
                    pMap.put("exists", true);
                    break;
                }        //
            }*/
            projectDataList.add(pMap);
        }
        map.put("projectDataList", projectDataList);
        //map.put("projectDataList", null);

        String name = currentUser.getToken().getUserDetails().getName();
        //String name = new CurrentUserCredentials().user.getToken().getUserDetails().getName();
        map.put("activityDataList", getLastFiveActivity());

        map.put("currentUser", currentUser);
        return new ModelAndView("/home/index", map);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/logout.buet")
    public ModelAndView logout() {
        userSession = SessionUtil.getSession();
        userSession.removeAttribute(ERPConstants.SESSION_USER);
        userSession.removeAttribute(ERPConstants.SESSION_USER_FEATURES);
        userSession.invalidate();
        return new ModelAndView("redirect:/home.buet");
    }

    public List<Map<String, String>> getLastFiveActivity() {
        List<Map<String, String>> list = new ArrayList<Map<String, String>>();
        Map<String, String> map;

        List<ProjectHistory> historyList = brtcService.findAllProjectHistory();
        int size = historyList.size();
        for (int i = 0; i < (size >= 5 ? 5 : size); i++) {
            ProjectHistory history = historyList.get(i);
            map = new HashMap<String, String>();
            map.put("note", history.getNote());
            map.put("time", MakDate.timeDiffToStringToMin(MakDate.computeDiff(history.getRecordDate(), new Date())));
            map.put("file", history.getProject().getFileNo());
            list.add(map);
        }
        return list;
    }


}
