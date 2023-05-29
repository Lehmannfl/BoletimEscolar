package Boletinho;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class MeuServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, @org.jetbrains.annotations.NotNull HttpServletResponse resp) throws IOException {
        resp.setContentType("text/html");
        resp.getWriter().println("<h1>Olá, Servlet!</h1>");
    }
}
