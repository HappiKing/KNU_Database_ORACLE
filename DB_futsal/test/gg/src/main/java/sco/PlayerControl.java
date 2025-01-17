package sco;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/playerControl")
public class PlayerControl extends HttpServlet {
    private static final long serialVersionUID = 1L;
      
    PlayerDAO dao;
    
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        dao = new PlayerDAO();
    }
    
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");
        String view = "";
        
        if(action == null) {
            getServletContext().getRequestDispatcher("/playerControl?action=list").forward(request, response);
        } else {
            switch(action) {
            case "list": view = list(request, response); break;
            case "updateRank": view = updateRank(request, response); break;
            case "teamPlayerCount": view = teamPlayerCount(request, response); break;
            case "playersByTeam": view = playersByTeam(request, response); break;
            case "schedulesByDate": view = schedulesByDate(request, response); break;
            case "schedulesByStadium": view = schedulesByStadium(request, response); break;
            case "updateTeam": view = updateTeam(request, response); break;
            case "deleteSchedule": view = deleteSchedule(request, response); break;
            case "deletePlayer": view = deletePlayer(request, response); break;
            case "listSchedules": view = listSchedules(request, response); break; // 전체 경기 일정 조회 추가

            // 추가적인 비즈니스 로직 메소드 호출 추가
            }
            getServletContext().getRequestDispatcher("/futsal/" + view).forward(request, response);
        }
    }
  
    private String list(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("players", dao.getAll());
        return "playerInfo.jsp";
    }

    private String updateRank(HttpServletRequest request, HttpServletResponse response) {
        String rrn = request.getParameter("rrn");
        String newRankId = request.getParameter("newRankId");
        dao.updateRank(rrn, newRankId);
        return "playerInfo.jsp";
    }
    
    private String teamPlayerCount(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("teamPlayerCounts", dao.getTeamPlayerCount());
        return "teamPlayerCount.jsp";
    }
    
    private String playersByTeam(HttpServletRequest request, HttpServletResponse response) {
        String teamId = request.getParameter("teamId");
        request.setAttribute("players", dao.getPlayersByTeam(teamId));
        return "playerInfo.jsp";
    }
    
    private String schedulesByDate(HttpServletRequest request, HttpServletResponse response) {
        Date date = Date.valueOf(request.getParameter("date"));
        request.setAttribute("schedules", dao.getSchedulesByDate(date));
        return "scheduleInfo.jsp";
    }
    
    private String schedulesByStadium(HttpServletRequest request, HttpServletResponse response) {
        String stadiumName = request.getParameter("stadiumName");
        request.setAttribute("schedules", dao.getSchedulesByStadium(stadiumName));
        return "scheduleInfo.jsp";
    }
    
    private String updateTeam(HttpServletRequest request, HttpServletResponse response) {
        String rrn = request.getParameter("rrn");
        String newTeamId = request.getParameter("newTeamId");
        dao.updateTeam(rrn, newTeamId);
        return list(request, response);
    }
   
    private String deleteSchedule(HttpServletRequest request, HttpServletResponse response) {
        String scheduleId = request.getParameter("scheduleId");
        dao.deleteSchedule(scheduleId);
        return list(request, response);
    }

    private String deletePlayer(HttpServletRequest request, HttpServletResponse response) {
        String rrn = request.getParameter("rrn");
        dao.deletePlayer(rrn);
        return list(request, response);
    }
    
    private String listSchedules(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("schedules", dao.getAllSchedules());
        return "schedulesList.jsp";
    }
}
