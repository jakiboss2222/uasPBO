package com.candra.app.dao;

import com.candra.app.model.Hero;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HeroDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/UserDB";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_HERO_SQL = "INSERT INTO tm_hero (nama_hero, kategori, gender) VALUES (?, ?, ?)";
    private static final String SELECT_HERO_BY_ID = "SELECT id_hero, nama_hero, kategori, gender FROM tm_hero WHERE id_hero = ?";
    private static final String SELECT_ALL_HERO = "SELECT * FROM tm_hero";
    private static final String DELETE_HERO_SQL = "DELETE FROM tm_hero WHERE id_hero = ?";
    private static final String UPDATE_HERO_SQL = "UPDATE tm_hero SET nama_hero = ?, kategori = ?, gender = ? WHERE id_hero = ?";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertHero(Hero hero) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_HERO_SQL)) {
            preparedStatement.setString(1, hero.getNamaHero());
            preparedStatement.setString(2, hero.getKategori());
            preparedStatement.setString(3, hero.getGender());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    public Hero selectHero(int idHero) {
        Hero hero = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_HERO_BY_ID)) {
            preparedStatement.setInt(1, idHero);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String namaHero = rs.getString("nama_hero");
                String kategori = rs.getString("kategori");
                String gender = rs.getString("gender");
                hero = new Hero(idHero, namaHero, kategori, gender);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return hero;
    }

    public List<Hero> selectAllHeroes() {
        List<Hero> heroes = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_HERO)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int idHero = rs.getInt("id_hero");
                String namaHero = rs.getString("nama_hero");
                String kategori = rs.getString("kategori");
                String gender = rs.getString("gender");
                heroes.add(new Hero(idHero, namaHero, kategori, gender));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return heroes;
    }

    public boolean deleteHero(int idHero) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_HERO_SQL)) {
            statement.setInt(1, idHero);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateHero(Hero hero) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_HERO_SQL)) {
            statement.setString(1, hero.getNamaHero());
            statement.setString(2, hero.getKategori());
            statement.setString(3, hero.getGender());
            statement.setInt(4, hero.getIdHero());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
} 