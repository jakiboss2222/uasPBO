<%--
    Document   : user-form
    Created on : Sep 11, 2024, 5:02:13 PM
    Author     : Java Programming with Aldrin
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!--<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Form</title>
</head>
<body>
    <h1>User Form</h1>
    <form action="insert" method="post">
        <input type="hidden" name="id" value="${user.id}" />
        <label>Name:</label>
        <input type="text" name="name" value="${user.name}" /><br/>
        <label>Email:</label>
        <input type="text" name="email" value="${user.email}" /><br/>
        <label>Country:</label>
        <input type="text" name="country" value="${user.country}" /><br/>
        <input type="submit" value="Save" />
    </form>
</body>
</html>-->

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hero Form</title>
</head>
<body>
    <h2>Hero Form</h2>
    <form action="${hero != null ? 'update' : 'insert'}" method="post">
        <c:if test="${hero != null}">
            <input type="hidden" name="idHero" value="${hero.idHero}" />
        </c:if>
        <label for="namaHero">Nama Hero:</label>
        <input type="text" id="namaHero" name="namaHero" value="${hero != null ? hero.namaHero : ''}" required /><br/>
        <label for="kategori">Kategori:</label>
        <select id="kategori" name="kategori" required>
            <option value="">--Pilih Kategori--</option>
            <option value="MAGE" ${hero != null && hero.kategori == 'MAGE' ? 'selected' : ''}>MAGE</option>
            <option value="ASSASIN" ${hero != null && hero.kategori == 'ASSASIN' ? 'selected' : ''}>ASSASIN</option>
            <option value="FIGHTER" ${hero != null && hero.kategori == 'FIGHTER' ? 'selected' : ''}>FIGHTER</option>
            <option value="TANK" ${hero != null && hero.kategori == 'TANK' ? 'selected' : ''}>TANK</option>
            <option value="MARKSMAN" ${hero != null && hero.kategori == 'MARKSMAN' ? 'selected' : ''}>MARKSMAN</option>
            <option value="SUPPORT" ${hero != null && hero.kategori == 'SUPPORT' ? 'selected' : ''}>SUPPORT</option>
        </select><br/>
        <label for="gender">Gender:</label>
        <select id="gender" name="gender" required>
            <option value="">--Pilih Gender--</option>
            <option value="MALE" ${hero != null && hero.gender == 'MALE' ? 'selected' : ''}>MALE</option>
            <option value="FEMALE" ${hero != null && hero.gender == 'FEMALE' ? 'selected' : ''}>FEMALE</option>
        </select><br/>
        <input type="submit" value="${hero != null ? 'Update' : 'Add'} Hero" />
    </form>
    <a href="list">Back to List</a>
</body>
</html>