package kr.or.kh.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO implements IBoard{
   private Connection conn;
   private BoardDTO boardDTO;
   private BoardDAO boardDAO;
   private ResultSet rs;
   private PreparedStatement pstmt;
   private String sql;
   private int cnt;
   private ArrayList<BoardDTO> boardList;
   
   public BoardDAO() {
      boardDTO = new BoardDTO();
      boardList = new ArrayList<BoardDTO>();
      
      try {
         Class.forName("com.mysql.jdbc.Driver");
      } catch (ClassNotFoundException e) {
         e.printStackTrace();
      }
   }
   public Connection getConnection() throws SQLException {
      conn = DriverManager.getConnection("jdbc:mysql://underdogb.cafe24.com:3306/underdogb", "underdogb", "khacademy1!");
      return conn;
   }
   //종료기능 함수
   public void boardClose() {
      try {
         conn.close();
         rs.close();
         pstmt.close();
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }
   @Override
   public int boardWrite(BoardDTO boardDTO) throws SQLException{
      conn = getConnection();
      sql = "insert into boardSK(title, content, author, nal, readcount) values(?,?,?,?,?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, boardDTO.getTitle());
      pstmt.setString(2, boardDTO.getContent());
      pstmt.setString(3, boardDTO.getAuthor());
      pstmt.setString(4, boardDTO.getNal());
      pstmt.setInt(5, boardDTO.getReadcount());
      cnt = pstmt.executeUpdate();
      return cnt;//정수형이니까 정수형으로 리턴해줘야 함.
   }
//   public ArrayList<BoardDTO> boardList() throws SQLException{
//      conn = getConnection();
//      sql = "select no, title, content, author, nal, readcount from boardSK order by no asc";
//      pstmt = conn.prepareStatement(sql);
//      rs = pstmt.executeQuery();
//      boardList = new ArrayList<BoardDTO>();
//      while(rs.next()) {
//         boardDTO.setNo(rs.getInt("no"));
//         boardDTO.setTitle(rs.getString("title"));
//         boardDTO.setContent(rs.getString("content"));
//         boardDTO.setAuthor(rs.getString("author"));
//         boardDTO.setNal(rs.getString("nal"));
//         boardDTO.setReadcount(Integer.parseInt(rs.getString("readcount")));
//         boardList.add(boardDTO);
//      }
//      return boardList;
//   }
     public ArrayList<BoardDTO> boardList() throws SQLException{
         conn = getConnection();
         sql = "select no,title,content,author,nal,readcount from boardSK order by no asc";
         pstmt = conn.prepareStatement(sql);
         rs = pstmt.executeQuery();
         boardList = new ArrayList<BoardDTO>();
         while(rs.next()) {
            boardDTO = new BoardDTO();
            boardDTO.setNo(rs.getInt("no"));
            boardDTO.setTitle(rs.getString("title"));
            boardDTO.setContent(rs.getString("content"));
            boardDTO.setAuthor(rs.getString("author"));
            boardDTO.setNal(rs.getString("nal"));
            boardDTO.setReadcount(Integer.parseInt(rs.getString("readCount")));
            boardList.add(boardDTO);
            
         }
         return boardList;   //그냥 배열에 담아버려서 리턴으로 돌려주었다.
      }
   @Override
   	public int totalCount() {	// 페이징처리 : 전체 레코드 갯수 구하기
   		int count = 0;
   		try {
			conn = getConnection();
			sql = "select count(*) from boardSK";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
   	} // 페이징처리 : 전체 레코드 갯수 구하기
   @Override
   	public PageTo page(int curPage) { // 페이지 구현
   		PageTo pageTo = new PageTo();
   		int totalCount = totalCount();
   		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
   		try {
			conn = getConnection();
			sql = "select no, title, content, author, nal, readcount from boardSK";
			pstmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
					// TYPE_SCROLL_INSENSITIVE - scroll은 가능하나, 변겨오딘 사항은 적용되지 않는다.
					// 양방향 스크롤시 업데이트 반영 안함
					// CONCUR_READ_ONLY - 커서의 위치에서 정보업데이트 불가, ResultSet의 변경이 불가능 합니다.
			rs = pstmt.executeQuery();
			int perPage = pageTo.getPerPage();
			int skip = (curPage-1)*perPage;
			if(skip>0) {
				rs.absolute(skip);
			}
			//ResultSet의 absolute메소드를 이용하여 해당페이지의 Cursor의 위치로 이동한다.
			for(int i = 0; i < perPage && rs.next(); i++) {
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String author = rs.getString("author");
				String nal = rs.getString("nal");
				int readcount = rs.getInt("readcount");
				BoardDTO data = new BoardDTO();
				data.setNo(no);
				data.setTitle(title);
				data.setContent(content);
				data.setAuthor(author);
				data.setNal(nal);
				data.setReadcount(readcount);
				list.add(data);
			}
			pageTo.setList(list); // ArrayList 저장
			pageTo.setTotalCount(totalCount); // 전체 레코드 개수
			pageTo.setCurPage(curPage); // 현재페이지
		} catch (SQLException e) {
			e.printStackTrace();
		}
   		return pageTo;
   		
   	}
     @Override
     public int boardDelete(int no)throws SQLException{
        conn= getConnection();
        sql = "delete from boardSK where no=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, no);
        cnt = pstmt.executeUpdate();
        return cnt;
        
     }
     @Override
     public BoardDTO boardSearch(String titleSearch) throws SQLException{
        conn = getConnection();
        sql = "select no, title, content, author, nal, readcount from boardSK where title = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, titleSearch);
        rs = pstmt.executeQuery();
        while(rs.next()) {
           boardDTO.setNo(rs.getInt("no"));
           boardDTO.setTitle(rs.getString("title"));
           boardDTO.setContent(rs.getString("content"));
           boardDTO.setAuthor(rs.getString("author"));
           boardDTO.setNal(rs.getString("nal"));
           boardDTO.setReadcount(rs.getInt("readcount"));
        }
        return boardDTO;
     }
     @Override
     public void boardReadcount(BoardDTO boardDTO) throws SQLException{
        conn = getConnection();
        sql = "update boardSK set readcount=? where no = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, boardDTO.getReadcount()+1);
        pstmt.setInt(2, boardDTO.getNo());
        cnt = pstmt.executeUpdate();
        
     }
     @Override
     public int boardUpdateFinal(BoardDTO boardDTO, String titleSearch)throws SQLException {
    	 conn = getConnection();
    	 sql = "update boardSK set title=?, content=?, author=?, nal=?, readcount=? where title=?";
    	 pstmt = conn.prepareStatement(sql);
    	 pstmt.setString(1, boardDTO.getTitle());
    	 pstmt.setString(2, boardDTO.getContent());
    	 pstmt.setString(3, boardDTO.getAuthor());
    	 pstmt.setString(4, boardDTO.getNal());
    	 pstmt.setInt(5, boardDTO.getReadcount());
    	 pstmt.setString(6, titleSearch);
    	 cnt = pstmt.executeUpdate();
    	 return cnt;
     }

   }
