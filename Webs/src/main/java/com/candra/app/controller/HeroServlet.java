package com.candra.app.controller;

import com.candra.app.dao.HeroDAO;
import com.candra.app.model.Hero;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/hero/*")
public class HeroServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private HeroDAO heroDAO;

    public void init() {
        heroDAO = new HeroDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getPathInfo();
        if (action == null) action = "/";
        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertHero(request, response);
                    break;
                case "/delete":
                    deleteHero(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateHero(request, response);
                    break;
                default:
                    listHero(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listHero(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Hero> listHero = heroDAO.selectAllHeroes();
        request.setAttribute("listHero", listHero);
        RequestDispatcher dispatcher = request.getRequestDispatcher("hero-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("hero-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int idHero = Integer.parseInt(request.getParameter("idHero"));
        Hero existingHero = heroDAO.selectHero(idHero);
        RequestDispatcher dispatcher = request.getRequestDispatcher("hero-form.jsp");
        request.setAttribute("hero", existingHero);
        dispatcher.forward(request, response);
    }

    private void insertHero(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String namaHero = request.getParameter("namaHero");
        String kategori = request.getParameter("kategori");
        String gender = request.getParameter("gender");
        Hero newHero = new Hero(namaHero, kategori, gender);
        heroDAO.insertHero(newHero);
        response.sendRedirect("list");
    }

    private void updateHero(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int idHero = Integer.parseInt(request.getParameter("idHero"));
        String namaHero = request.getParameter("namaHero");
        String kategori = request.getParameter("kategori");
        String gender = request.getParameter("gender");
        Hero hero = new Hero(idHero, namaHero, kategori, gender);
        heroDAO.updateHero(hero);
        response.sendRedirect("list");
    }

    private void deleteHero(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int idHero = Integer.parseInt(request.getParameter("idHero"));
        heroDAO.deleteHero(idHero);
        response.sendRedirect("list");
    }
} 