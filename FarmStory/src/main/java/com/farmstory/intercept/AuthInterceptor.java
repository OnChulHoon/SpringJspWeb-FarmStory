package com.farmstory.intercept;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.farmstory.vo.Account;

public class AuthInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// session에 담긴 데이터를 받아온다.
		Account account = (Account) request.getSession().getAttribute("loginuser");
		// 브라우저에서 요청된 주소를 받아온다.
		String requestUrl = request.getRequestURI();
		// 브라우저의 요청 이전의 주소를 받아온다.
		String previousUrl = request.getHeader("referer");
		// 반환할 redirect값을 true로 초기화한다.
		boolean redirect = true;
		// 로그인 여부를 체크한다.
		if (requestUrl.contains("my_flowerpot_list.action") && account == null ||
			requestUrl.contains("plant_regist.action") && account == null ||
			requestUrl.contains("diary_write.action") && account == null ||
			requestUrl.contains("diary_book_list.action") && account == null ||
			requestUrl.contains("diary_list.action") && account == null ||
			requestUrl.contains("diary_detail.action") && account == null ||
			requestUrl.contains("/value/") && account == null) {
			// false를 반환하여 메인 페이지로 이동시킨다.
			redirect = false;
		}
		// 모바일은 알림 서비스를 위해 예외처리한다.
		if(requestUrl.contains("mFindAlarms.action")) {
			redirect = true;
		}
		
		if (!redirect) {
			// 로그인 하지 않는 경우 요청 이전 페이지로 checkedLogin과 returnUrl 값을 포함하여 이동시킨다.
			String checkedLogin = "";
			if(previousUrl.contains("?")) {
				checkedLogin = "&checkedLogin=empty";
			} else {
				checkedLogin = "?checkedLogin=empty";
			}
			response.sendRedirect(previousUrl + checkedLogin + "&returnUrl=" + requestUrl);
		}
		// true를 반환하면 요청이 중단된다.
		return redirect;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}

}
