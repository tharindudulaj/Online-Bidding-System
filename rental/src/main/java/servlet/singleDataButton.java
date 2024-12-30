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

@WebServlet("/singleDataButton")
public class singleDataButton extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public singleDataButton() {
        super();
      
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer cus = new Customer();
		cus.setEmail(request.getParameter("email"));
		CustomerService service = new CustomerService();
		Customer customer =service.singleDataButton(cus);
		RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
		request.setAttribute("customer", customer);
		dispatcher.forward(request, response);
	}

}
