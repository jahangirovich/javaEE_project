package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import databean2.User;
import model2.Model;

public class Controller extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public void init() throws ServletException {
        Model model = new Model(getServletConfig());
        Action.add(new PostAddAction(model));

        Action.add(new LoginAction(model));
        Action.add(new ImageAction(model));
        Action.add(new SearchAction(model));
        Action.add(new RegisterAction(model));
        Action.add(new SearchByAction(model));
        Action.add(new LogoutAction(model));
        Action.add(new ProfileShowAction(model));
        Action.add(new UpdateUserAction(model));
        Action.add(new DetailAction(model));
        Action.add(new SendFriendRequestAction(model));
        Action.add(new RequestForFriendshipShowAction(model));
        Action.add(new DeclineFriendRequesteAction(model));
        Action.add(new AcceptFriendRequesteAction(model));
        Action.add(new ViewFriendsAction(model));
        Action.add(new ViewOthersProfileAction(model));
        Action.add(new AddFriendAction(model));
        Action.add(new DeleteFriendAction(model));
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nextPage = performTheAction(request);
        sendToNextPage(nextPage, request, response);
    }

    /*
     * Extracts the requested action and (depending on whether the user is
     * logged in) perform it (or make the user login).
     * 
     * @param request
     * 
     * @return the next page (the view)
     */
    private String performTheAction(HttpServletRequest request) {
        HttpSession session = request.getSession(true);
        String servletPath = request.getServletPath();
        User user = (User) session.getAttribute("user");
        String action = getActionName(servletPath);

        if (user != null) {
            // Let the logged in user run his chosen action
            return Action.perform(action, request);
        }
        
        // If the user hasn't logged in, login is the only option
        // Note in this example, register is in the login action.
        if (action.equals("login.do")) {
            return Action.perform("login.do", request);
        }

        if (action.equals("register.do")) {
            return Action.perform("register.do", request);
        }
        
        // The not-logged user is trying to execute an action other
        // than login.  This is usually due to his session timing
        // out but he could be fooling around.  Let's give him a
        // stale session error message.  Another option would be
        // to send him to login.jsp, instead.
        return "controller-stale-session.jsp";
    }

    /*
     * If nextPage is null, send back 404 If nextPage ends with ".do", redirect
     * to this page. If nextPage ends with ".jsp", dispatch (forward) to the
     * page (the view) This is the common case
     */
    private void sendToNextPage(String nextPage, HttpServletRequest request,
            HttpServletResponse response) throws IOException, ServletException {
        if (nextPage == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND,
                    request.getServletPath());
            return;
        }

        if (nextPage.endsWith(".do")) {
            response.sendRedirect(nextPage);
            return;
        }

        if (nextPage.endsWith(".jsp")) {
            RequestDispatcher d = request.getRequestDispatcher("WEB-INF/" + nextPage);
            d.forward(request, response);
            return;
        }
        if (nextPage.equals("ImageView")) {
            RequestDispatcher d = request.getRequestDispatcher("/ViewImageServlet");
            d.forward(request, response);
            return;
        }

        throw new ServletException(Controller.class.getName()
                + ".sendToNextPage(\"" + nextPage + "\"): invalid extension.");
    }

    /*
     * Returns the path component after the last slash removing any "extension"
     * if present.
     */
    private String getActionName(String path) {
        // We're guaranteed that the path will start with a slash
        int slash = path.lastIndexOf('/');
        return path.substring(slash + 1);
    }
}
