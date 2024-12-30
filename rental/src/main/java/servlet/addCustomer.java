package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Customer;
import services.CustomerService;

@WebServlet("/addCustomer")
public class addCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public addCustomer() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer cus = new Customer();
		cus.setName(request.getParameter("name"));
		cus.setAge(Integer.parseInt(request.getParameter("age")));
		cus.setEmail(request.getParameter("email"));
		cus.setPassword(request.getParameter("password"));
		
		CustomerService service = new CustomerService();
		service.regCustomer(cus);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
		dispatcher.forward(request, response);
	}

}
