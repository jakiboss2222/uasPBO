<%--
    Document   : user-list
    Created on : Sep 11, 2024, 5:01:32 PM
    Author     : Java Programming with Aldrin
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hero List</title>
</head>
<body>
    <h2>Daftar Hero Mobile Legend</h2>
    <a href="new">Tambah Hero</a>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nama Hero</th>
            <th>Kategori</th>
            <th>Gender</th>
            <th>Action</th>
        </tr>
        <c:forEach var="hero" items="${listHero}">
            <tr>
                <td>${hero.idHero}</td>
                <td>${hero.namaHero}</td>
                <td>${hero.kategori}</td>
                <td>${hero.gender}</td>
                <td>
                    <a href="edit?idHero=${hero.idHero}">Edit</a>
                    <a href="delete?idHero=${hero.idHero}" onclick="return confirm('Yakin ingin menghapus?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
