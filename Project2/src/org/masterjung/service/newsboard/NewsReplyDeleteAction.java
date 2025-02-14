package org.masterjung.service.newsboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.masterjung.action.Action;
import org.masterjung.action.Actionforward;
import org.masterjung.dao.BoardDao;

public class NewsReplyDeleteAction implements Action{

	@Override
	public Actionforward execute(HttpServletRequest request, HttpServletResponse response) {
		Actionforward forward = new Actionforward();
		BoardDao dao = new BoardDao();
		int result = dao.deleteFakeBoardreply(Integer.parseInt(request.getParameter("id")));
		if(result>0) {
			System.out.println("등록성공");
		}else {
			System.out.println("등록실패");
		}
		forward.setPath("/newsDetail.nb?id="+request.getParameter("boardid"));
		return forward;
		
	}

}
