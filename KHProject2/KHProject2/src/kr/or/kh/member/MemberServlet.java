package kr.or.kh.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.mb")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberDTO memberDTO;
	private MemberDAO memberDAO;
	private int cnt;
	private ArrayList<MemberDTO> memberList;
	private HttpSession session;

	public MemberServlet() {
		memberDTO = new MemberDTO();
		memberDAO = new MemberDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		session = request.getSession();
		if (command.equals("/memberRegister.mb")) { // 회원가입
			memberDTO.setId(request.getParameter("id"));
			memberDTO.setPw(request.getParameter("pw"));
			memberDTO.setAddr(request.getParameter("addr"));
			memberDTO.setTel(request.getParameter("tel"));
			try {
				cnt = memberDAO.memberRegister(memberDTO);
				out.print(cnt + "건 회원이 등록 되었습니다.");
				response.sendRedirect("index.jsp?page=kh");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} // 회원가입
		else if (command.equals("/memberList.mb")) { //목록
			try {
				memberList = memberDAO.memberList();
				RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=member/memberList");// 이동하는거
				request.setAttribute("memberList", memberList);// 속성을 request에 넣겠다. 서버에 등록이 된다. 앞에는 name 뒤에는 값 ,이름으로
																// 불러내면 다 나온다.
				dis.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			} //목록
		} else if (command.equals("/memberLogin.mb")) { //로그인
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			try {
				memberDTO = memberDAO.memberLogin(id, pw);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if (!(id.equals(memberDTO.getId()))) {
				out.print("아이디 일치하지 않습니다.<br>");
			} else if (!(pw.equals(memberDTO.getPw()))) {
				out.print("패스워드가 일치하지 않습니다.<br>");
			} else {
				out.print(id+"님<br>환영합니다. 로그인 되었습니다.");
				session = request.getSession();
				session.setAttribute("id", id);
				session.setAttribute("pw", pw);
				//앞에는 key 뒤에는 value
				response.sendRedirect("index.jsp?page=kh");
			}
		}//로그인 
		else if(command.equals("/memberLogout.mb")) {
			session.invalidate(); // session의 값을 모두 제거 
			response.sendRedirect("index.jsp?page=kh");
			
		}
		else if(command.equals("/memberDelete.mb")) {
//			out.print("<script>alert('회원탈퇴 되었습니다.');</script>");			
			String pw = request.getParameter("pw");
			if(pw.equals(session.getAttribute("pw"))) {				
				String deleteId = (String)session.getAttribute("id");
				String deletePw = (String)session.getAttribute("pw");
				try {
					int cnt = memberDAO.memberDelete(deleteId, deletePw);
					out.print("<script>alert('탈퇴되었습니다.');location.href = 'memberLogout.mb'</script>");
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} else {
	             out.print("<script>alert('패스워드가 틀렸습니다.');history.back();</script>");			}
		}
		else if(command.equals("/idcheckConfirm.mb")) {
			   String telSearch = request.getParameter("tel");//form이나 액션에서 넘어오는건 getParameter로 받아오는것
		          try {
		            String id = memberDAO.memberIdcheck(telSearch);
		            out.print("찾는 아이디 : "+id+"<br>");
		            out.print("<a href= index.jsp?page=kh>메인으로</a>");
		         } catch (SQLException e) {
		            e.printStackTrace();
		         }
		       }//아이디찾기
		else if (command.equals("/pwcheckConfirm.mb")) {
			String id = request.getParameter("id");
			try {
				String pw = memberDAO.memberPwcheck(id);
				out.print("찾는 비밀번호 : "+pw+"<br>");
	            out.print("<a href= index.jsp?page=kh>메인으로</a>");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/memberUpdateConfirm.mb")) {
			String id = request.getParameter("id");
			try {
				memberDTO = memberDAO.memberUpdateConfirm(id);
				RequestDispatcher dis = request.getRequestDispatcher("index.jsp?page=member/memberUpdateConfirm");
				request.setAttribute("memberDTO", memberDTO);
				dis.forward(request, response);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/memberUpdateFinal.mb")) {
			memberDTO.setId(request.getParameter("id"));
			memberDTO.setPw(request.getParameter("pw"));
			memberDTO.setAddr(request.getParameter("addr"));
			memberDTO.setTel(request.getParameter("tel"));
			String idSearch = request.getParameter("idSearch");
			try {
				cnt = memberDAO.memberUpdateFinal(memberDTO, idSearch);
				response.sendRedirect("memberList.mb");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	}
	
