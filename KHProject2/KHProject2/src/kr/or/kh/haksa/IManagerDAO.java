package kr.or.kh.haksa;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface IManagerDAO {
	//오버라이드
	public void managerRegisterSql(ManagerDTO managerDTO) throws SQLException;

	public ResultSet managerListSql() throws SQLException;

	public int managerDeleteSql(String irumDelete) throws SQLException;

	public ResultSet managerSearchSql(String irumSearch) throws SQLException;

	public int managerUpdateSql(String irumUpdate, ManagerDTO managerDTO) throws SQLException;

}
