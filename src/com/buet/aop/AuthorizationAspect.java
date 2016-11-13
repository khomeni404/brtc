package com.buet.aop;

import bd.com.softengine.licencing.MyLicence;
import bd.com.softengine.util.ActionResult;
import com.buet.security.SessionUtil;
import com.buet.security.model.Feature;
import com.buet.security.service.AuthenticationAndAuthorizationService;
import com.buet.security.service.SecurityService;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Aspect
public class AuthorizationAspect {

    @Autowired
    private SecurityService securityService;

    @Autowired
    private AuthenticationAndAuthorizationService authorizationService;
    private List<Feature> features = null;
    private boolean isAllowed = false;
    String module = null;
    String operation = null;
    String requestMapping = null;


    @Pointcut("within(@org.springframework.stereotype.Controller *) " +
            "&& !within(@org.springframework.stereotype.Controller com.buet.guest.AuthenticationController)" +
            "&& !within(@org.springframework.stereotype.Controller com.buet.report.ReportController)" +
            "&& !within(@org.springframework.stereotype.Controller com.buet.home.HomeController)")
    public void allControllers() {
    }

    @Pointcut("execution(* *(..))")
    public void allOperations() {
    }

	/*@Pointcut("execution(* updateProject*(..))")
    public void allUpdateOperations(){}

	@Pointcut("execution(* *List(..))")
	public void allListOperations(){}

	@Pointcut("execution(* delete*(..))")
	public void allDeleteOperations(){}

	@Pointcut("execution(* *Assignment(..))")
	public void allAssignmentOperations(){}
*/

    @Around("allControllers() && allOperations()")
    public Object proceedToAction(ProceedingJoinPoint proceedJoinPoint) throws Throwable {
        features = SessionUtil.getSessionUserFeatures();
        int annotationFind = 0;
        int annotationLength = proceedJoinPoint.getTarget().getClass().getAnnotations().length;
        for (int i = 0; i < annotationLength; i++) {
            if (proceedJoinPoint.getTarget().getClass().getAnnotations()[i].toString()
                    .contains("RequestMapping")) {
                annotationFind = i;
                break;

            }
        }

        requestMapping = proceedJoinPoint.getTarget().getClass().
                getAnnotations()[annotationFind].toString();
        module = requestMapping.split(",")[1].split("/")[1];

        operation = proceedJoinPoint.getSignature().getName();
        isAllowed = authorizationService.checkAuthorization(features, module, operation);

        Map<String, Object> map = new HashMap<String, Object>();
        map.put("PageTitle", "Sorry");
        ActionResult licence = MyLicence.checkLicenceValidity();
        //ActionResult range = MyLicence.checkProjectsRange();
        map.put("licence",licence);
        //map.put("range",range);
        if (licence.isSuccess()) {
            return proceedJoinPoint.proceed();
           /* if (isAllowed) {
                return proceedJoinPoint.proceed();
            } else {
                return new ModelAndView("/security/unauthorized", map);
            }*/
        } else {
            return new ModelAndView("/home/licence_missing", map);
        }
    }

	/*@Around("allControllers() && allUpdateOperations()")
    public Object proceedToUpdateAction(ProceedingJoinPoint proceedJoinPoint) throws Throwable {
        features = SessionUtil.getSessionUserFeatures();
        int annotationFind = 0;
        int annotationLength = proceedJoinPoint.getTarget().getClass().getAnnotations().length;
        for(int i = 0; i < annotationLength; i++){
            if(proceedJoinPoint.getTarget().getClass().getAnnotations()[i].toString()
                    .contains("RequestMapping")){
                annotationFind = i;
                break;

            }
        }

        requestMapping = proceedJoinPoint.getTarget().getClass().
                getAnnotations()[annotationFind].toString();
        module = requestMapping.split(",")[1].split("/")[1];

        operation = proceedJoinPoint.getSignature().getName();
        isAllowed = authorizationService.checkAuthorization(features,module,operation);
        if(isAllowed) return proceedJoinPoint.proceed(); else return new ModelAndView("/security/unauthorized");

	}

	@Around("allControllers() && allListOperations()")
	public Object proceedToListAction(ProceedingJoinPoint proceedJoinPoint) throws Throwable {
        features = SessionUtil.getSessionUserFeatures();
        int annotationFind = 0;
        int annotationLength = proceedJoinPoint.getTarget().getClass().getAnnotations().length;
        for(int i = 0; i < annotationLength; i++){
            if(proceedJoinPoint.getTarget().getClass().getAnnotations()[i].toString()
                    .contains("RequestMapping")){
                annotationFind = i;
                break;

            }
        }

        requestMapping = proceedJoinPoint.getTarget().getClass().
                getAnnotations()[annotationFind].toString();
        module = requestMapping.split(",")[1].split("/")[1];

        operation = proceedJoinPoint.getSignature().getName();
        isAllowed = authorizationService.checkAuthorization(features,module,operation);
        if(isAllowed) return proceedJoinPoint.proceed(); else return new ModelAndView("/security/unauthorized");

	}

	@Around("allControllers() && allDeleteOperations()")
	public Object proceedToDeleteAction(ProceedingJoinPoint proceedJoinPoint) throws Throwable {
        features = SessionUtil.getSessionUserFeatures();
        int annotationFind = 0;
        int annotationLength = proceedJoinPoint.getTarget().getClass().getAnnotations().length;
        for(int i = 0; i < annotationLength; i++){
            if(proceedJoinPoint.getTarget().getClass().getAnnotations()[i].toString()
                    .contains("RequestMapping")){
                annotationFind = i;
                break;

            }
        }

        requestMapping = proceedJoinPoint.getTarget().getClass().
                getAnnotations()[annotationFind].toString();
        module = requestMapping.split(",")[1].split("/")[1];

        operation = proceedJoinPoint.getSignature().getName();
        isAllowed = authorizationService.checkAuthorization(features,module,operation);
        if(isAllowed) return proceedJoinPoint.proceed(); else return new ModelAndView("/security/unauthorized");

	}

	@Around("allControllers() && allAssignmentOperations()")
	public Object proceedToAssignmentAction(ProceedingJoinPoint proceedJoinPoint) throws Throwable {
        features = SessionUtil.getSessionUserFeatures();
        int annotationFind = 0;
        int annotationLength = proceedJoinPoint.getTarget().getClass().getAnnotations().length;
        for(int i = 0; i < annotationLength; i++){
            if(proceedJoinPoint.getTarget().getClass().getAnnotations()[i].toString()
                    .contains("RequestMapping")){
                annotationFind = i;
                break;

            }
        }

        requestMapping = proceedJoinPoint.getTarget().getClass().
                getAnnotations()[annotationFind].toString();
        module = requestMapping.split(",")[1].split("/")[1];

        operation = proceedJoinPoint.getSignature().getName();
        isAllowed = authorizationService.checkAuthorization(features,module,operation);
        if(isAllowed) return proceedJoinPoint.proceed(); else return new ModelAndView("/security/unauthorized");

	}*/

}
