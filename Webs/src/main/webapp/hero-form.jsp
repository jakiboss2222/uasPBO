<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Hero Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6fb;
            margin: 0;
            padding: 0;
        }
        .container {
            background: #fff;
            max-width: 400px;
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
        label {
            display: block;
            margin-bottom: 6px;
            color: #444;
            font-weight: bold;
        }
        input[type="text"], select {
            width: 100%;
            padding: 8px 10px;
            margin-bottom: 18px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 15px;
            background: #f9f9f9;
        }
        input[type="submit"] {
            width: 100%;
            background: #4f8cff;
            color: #fff;
            border: none;
            padding: 10px 0;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background 0.2s;
        }
        input[type="submit"]:hover {
            background: #2563d6;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 18px;
            color: #4f8cff;
            text-decoration: none;
            font-size: 15px;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
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
    </div>
</body>
</html> 