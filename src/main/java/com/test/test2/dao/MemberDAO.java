package com.test.test2.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.test.test2.dto.MemberDTO;

public class MemberDAO {
    // Connection, PreparedStatement, ResultSet 객체는 ojdbc11.jar 라이브러리가 있어야만 사용가능.
    Connection con = null; // DB 접속을 위한 객체
    PreparedStatement pstmt = null; // 쿼리문 전송을 위한 객체
    ResultSet rs = null; // select 쿼리 등을 수행했을 때 select 결과를 담는 객체
	
	public Connection getConnection() throws Exception{
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
		
		return con;
		
	}
	public int getCutNo() throws Exception {
		con = getConnection();
		String sql = "select count(custno) from member_tbl_02 "; 
//		String sql = "select max(custno) from member_tbl_02 "; 
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
//		int result = 0;
		int result = 100001;
		if (rs.next()) {
			int memberCnt = rs.getInt(1);
			result = result + memberCnt;
//			int maxNum =rs.getInt(1);
//			result = maxNum+1;
		}
		rs.close();
		pstmt.close();
		con.close();
		return result;
	}
	  public int updateMember(String custno, String custname, String phone,String address,String joindate, String grade, String city) throws Exception {
        con = getConnection();
        String sql = "update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=?, city=? where custno=?";
        System.out.println("custno+custname+phone+address+joindate+grade+city"+custno+" "+custname+" "+phone+" "+address+" "+joindate+" "+grade+" "+city);
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, custname);
        pstmt.setString(2, phone);
        pstmt.setString(3, address);
        pstmt.setString(4, joindate);
        pstmt.setString(5, grade);
        pstmt.setString(6, city);
        pstmt.setString(7, custno);
		int result = pstmt.executeUpdate();
        pstmt.close();
        con.close();
        return result;
    }
	public int saveMember(String custno, String custname, String phone,String address,String joindate, String grade, String city) throws Exception {
		con = getConnection();
		String sql = "insert into member_tbl_02 values(?,?,?,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, custno);
		pstmt.setString(2, custname);
		pstmt.setString(3, phone);
		pstmt.setString(4, address);
		pstmt.setString(5, joindate);
		pstmt.setString(6, grade);
		pstmt.setString(7, city);
		int result = pstmt.executeUpdate();
		pstmt.close();
		con.close();
		return result;
	}
	 
	public MemberDTO findByCustno(String custno) throws Exception{
		con=getConnection();
		String sql = "select custno, custname, phone, address, to_char(joinDate,'YYYY-MM-DD'), grade, city from member_tbl_02 where custno=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, custno);
		
		rs = pstmt.executeQuery();
		MemberDTO memberDTO = new MemberDTO();
		if(rs.next()) {
			memberDTO.setCustno(rs.getString(1));
			memberDTO.setCustname(rs.getString(2));
			memberDTO.setPhone(rs.getString(3));
			memberDTO.setAddress(rs.getString(4));
			memberDTO.setJoindate(rs.getString(5));
			memberDTO.setGrade(rs.getString(6));
			memberDTO.setCity(rs.getString(7));
		}
		return memberDTO;
	} 
	public List<MemberDTO> findAll() throws Exception{
		con = getConnection();
		String sql = "select custno, custname, phone, address, to_char(joinDate,'YYYY-MM-DD'),"+
					 "case when grade='A' then 'VIP'"+
					 "     when grade='B' then '일반'"+
					 "	   when grade='C' then '직원'"+
					 "     else '없음' \n"+
					 "end as grade, city from member_tbl_02";
		
		pstmt = con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		List<MemberDTO> mList = new ArrayList<>();
		for(;rs.next();) {
			MemberDTO memberDTO = new MemberDTO();
			memberDTO.setCustno(rs.getString(1));
			memberDTO.setCustname(rs.getString(2));
			memberDTO.setPhone(rs.getString(3));
			memberDTO.setAddress(rs.getString(4));
			memberDTO.setJoindate(rs.getString(5));
			memberDTO.setGrade(rs.getString(6));
			memberDTO.setCity(rs.getString(7));
			mList.add(memberDTO);
		}
		System.out.println(mList);
		return mList;
		
	}
}
