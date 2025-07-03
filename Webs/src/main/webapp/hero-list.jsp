<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hero List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6fb;
            margin: 0;
            padding: 0;
        }
        .container {
            background: #fff;
            max-width: 800px;
            margin: 40px auto;
            padding: 30px 40px 25px 40px;
            border-radius: 10px;
            box-shadow: 0 2px 12px rgba(0,0,0,0.08);
        }
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 25px;
        }
        a.button {
            display: inline-block;
            background: #4f8cff;
            color: #fff;
            padding: 8px 18px;
            border-radius: 5px;
            text-decoration: none;
            font-size: 15px;
            margin-bottom: 18px;
            transition: background 0.2s;
        }
        a.button:hover {
            background: #2563d6;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fafbfc;
        }
        th, td {
            padding: 10px 12px;
            text-align: left;
        }
        th {
            background: #e9eef7;
            color: #333;
        }
        tr:nth-child(even) {
            background: #f4f6fb;
        }
        tr:hover {
            background: #e0e7ff;
        }
        .action-links a {
            margin-right: 8px;
            color: #4f8cff;
            text-decoration: none;
            font-weight: bold;
            transition: color 0.2s;
        }
        .action-links a:hover {
            color: #2563d6;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
    <h2>Daftar Hero Mobile Legend</h2>
    <a href="new" class="button">Tambah Hero</a>
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
                <td class="action-links">
                    <a href="edit?idHero=${hero.idHero}">Edit</a>
                    <a href="delete?idHero=${hero.idHero}" onclick="return confirm('Yakin ingin menghapus?');">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
    </div>
</body>
</html> 