import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Signup")
public class Signup extends HttpServlet {
  
	private static final long serialVersionUID = 1L;

	public Signup() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/userDB?useUnicode=true&characterEncoding=utf-8","root","aqst98987");
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			//System.out.println("hola");
			Statement st = con.createStatement();
			String str = null;
			//��ʱ�涨����Ա������ֻ��Ϊadmin
			if(id.equals("admin")) {
				str = checkAdmin(request, response,id, pw);
				ResultSet re = st.executeQuery(str);
				/*
				 * ����ֱ������Ϊ����������Ϊ�գ��ǾͿ��ԡ�
				 * request.getRequestDispatcher("Success.jsp?status=admin").forward(request, response);
				 *     �����������ʱ�򣬶��ǻ᷵���ַ�����Ҫ�����Ǹ�������ֵ������ֵ���ǡ�+id+����ôд���С�
				 * */
				if(re.next()) {
					//System.out.println(id);
					request.getRequestDispatcher("Success.jsp?status=admin").forward(request, response);
				}else request.getRequestDispatcher("Failure.jsp?status=admin").forward(request, response);
			}else {
				str = checkGuest(request, response, id, pw);
				ResultSet re = st.executeQuery(str);
				if(re.next()) {
					//System.out.println(id);
					request.getRequestDispatcher("Success.jsp?status=guest").forward(request, response);
				}else request.getRequestDispatcher("Failure.jsp?status=guest").forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	protected String checkAdmin(HttpServletRequest request, HttpServletResponse response, String id, String pw) throws ServletException, IOException {
		String str = "select id from admin where pw='"+pw+"'and id='"+id+"'";
		return str;
	}
	
	protected String checkGuest(HttpServletRequest request, HttpServletResponse response, String id, String pw) throws ServletException, IOException {
		String str = "select id from guest where pw='"+pw+"'and id='"+id+"'";
		return str;
	}

}
