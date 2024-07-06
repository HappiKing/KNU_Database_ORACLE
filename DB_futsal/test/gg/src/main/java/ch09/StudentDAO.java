package ch09;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {
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
	
	public List<Student> getAll() {
		open();
		List<Student> students = new ArrayList<>();

		try {
			pstmt = conn.prepareStatement("select E.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL from EMP E, DEPT D where E.deptno=D.deptno and E.SAL > 2000 ORDER BY DEPTNO");
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Student s = new Student();
				s.setDEPTNO(rs.getInt("DEPTNO"));
				s.setDNAME(rs.getString("DNAME"));
				s.setEMPNO(rs.getString("EMPNO"));
				s.setENAME(rs.getString("ENAME"));
				s.setSAL(rs.getInt("SAL"));
				
				students.add(s);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return students;
	}
}
