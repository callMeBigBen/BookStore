package bookStore.interceptor;

import bookStore.domain.User;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor extends HandlerInterceptorAdapter {

    private String[] needAuthPages = new String[]{
            "afterService", "order/"};

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception{
        String contextPath = request.getContextPath();
        String uri = request.getRequestURI();
        uri = uri.substring(contextPath.length()+1);

        HttpSession session = request.getSession();

        System.out.println("进来了");

        for(String needAuthPage : needAuthPages)
        {
            if(uri.startsWith(needAuthPage))
            {
                User user = (User) session.getAttribute("user");
                if(user == null)
                {
                    response.sendRedirect("/bookStore/log");
                    return false;
                }
            }
        }

        return true;
    }

    public void postHandle(HttpServletRequest request,
                           HttpServletResponse response, Object handler,
                           ModelAndView modelAndView) throws Exception {

    }

    public void afterCompletion(HttpServletRequest request,
                                HttpServletResponse response, Object handler, Exception ex)
            throws Exception {

    }
}
