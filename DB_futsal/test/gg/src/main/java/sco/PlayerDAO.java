package sco;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class PlayerDAO {
    Connection conn = null;
    PreparedStatement pstmt;
    
    final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
    final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
    
    public void open() {
        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(JDBC_URL, "system", "pass");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public void close() {
        try {
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public List<Player> getAll() {
        open();
        List<Player> players = new ArrayList<>();

        try {
            pstmt = conn.prepareStatement("SELECT RRN, NAME, ADDRESS, TEAM_ID, RANK_ID FROM Player ORDER BY RRN");
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next()) {
                Player p = new Player();
                p.setRRN(rs.getString("RRN"));
                p.setNAME(rs.getString("NAME"));
                p.setADDRESS(rs.getString("ADDRESS"));
                p.setTEAM_ID(rs.getString("TEAM_ID"));
                p.setRANK_ID(rs.getString("RANK_ID"));
                
                players.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return players;
    }

    public void updateRank(String rrn, String newRankId) {
        open();
        try {
            pstmt = conn.prepareStatement("UPDATE Player SET Rank_id = ? WHERE RRN = ?");
            pstmt.setString(1, newRankId);
            pstmt.setString(2, rrn);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }
    
    public List<Map<String, Object>> getTeamPlayerCount() {
        open();
        List<Map<String, Object>> teamPlayerCounts = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement("SELECT Team_id, COUNT(*) AS Player_Count FROM Player GROUP BY Team_id");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Map<String, Object> map = new HashMap<>();
                map.put("Team_id", rs.getString("Team_id"));
                map.put("Player_Count", rs.getInt("Player_Count"));
                teamPlayerCounts.add(map);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return teamPlayerCounts;
    }
    
    public List<Player> getPlayersByTeam(String teamId) {
        open();
        List<Player> players = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement("SELECT * FROM Player WHERE Team_id = ?");
            pstmt.setString(1, teamId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Player p = new Player();
                p.setRRN(rs.getString("RRN"));
                p.setNAME(rs.getString("NAME"));
                p.setADDRESS(rs.getString("ADDRESS"));
                p.setTEAM_ID(rs.getString("TEAM_ID"));
                p.setRANK_ID(rs.getString("RANK_ID"));
                players.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return players;
    }
    
    public List<Schedule> getSchedulesByDate(Date date) {
        open();
        List<Schedule> schedules = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement("SELECT * FROM Schedule WHERE Schedule_date = ?");
            pstmt.setDate(1, date);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Schedule s = new Schedule();
                s.setSchedule_id(rs.getString("Schedule_id"));
                s.setSchedule_date(rs.getDate("Schedule_date"));
                s.setStadium_name(rs.getString("Stadium_name"));
                schedules.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return schedules;
    }
    
    public List<Schedule> getSchedulesByStadium(String stadiumName) {
        open();
        List<Schedule> schedules = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement("SELECT * FROM Schedule WHERE Stadium_name = ?");
            pstmt.setString(1, stadiumName);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Schedule s = new Schedule();
                s.setSchedule_id(rs.getString("Schedule_id"));
                s.setSchedule_date(rs.getDate("Schedule_date"));
                s.setStadium_name(rs.getString("Stadium_name"));
                schedules.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return schedules;
    }
    
    public List<Schedule> getAllSchedules() {
        open();
        List<Schedule> schedules = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement("SELECT * FROM Schedule ORDER BY Schedule_date");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Schedule s = new Schedule();
                s.setSchedule_id(rs.getString("Schedule_id"));
                s.setSchedule_date(rs.getDate("Schedule_date"));
                s.setStadium_name(rs.getString("Stadium_name"));
                schedules.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return schedules;
    }

    
    public void updateTeam(String rrn, String newTeamId) {
        open();
        try {
            pstmt = conn.prepareStatement("UPDATE Player SET Team_id = ? WHERE RRN = ?");
            pstmt.setString(1, newTeamId);
            pstmt.setString(2, rrn);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }
    
    public void deleteSchedule(String scheduleId) {
        open();
        try {
            pstmt = conn.prepareStatement("DELETE FROM Schedule WHERE Schedule_id = ?");
            pstmt.setString(1, scheduleId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    public void deletePlayer(String rrn) {
        open();
        try {
            pstmt = conn.prepareStatement("DELETE FROM Player WHERE RRN = ?");
            pstmt.setString(1, rrn);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }
}
