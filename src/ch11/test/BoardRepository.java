package ch11.test;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

public class BoardRepository {
	private static int no = 0;
	private ArrayList<BoardVO> listOfBoard = new ArrayList<BoardVO>();
	private static BoardRepository instance = new BoardRepository();
	
	public static BoardRepository getInstance() {
		return instance;
	}
	
	// 게시판 목록 전체 가져오기
	public ArrayList<BoardVO> selectBoardList(){
		return listOfBoard;
	}
	
	// 게시글 1개 가져오기
	public BoardVO getBoardById(int no) {
		BoardVO vo = null;
		
		for (int i = 0; i < listOfBoard.size(); i++) {
			BoardVO boardVO = listOfBoard.get(i);
			
			if(no == boardVO.getNo()) {
				vo = boardVO;
				
				//조회 수 증가
				boardVO.setHit(vo.getHit()+1);
			}
		}
		
		return vo;
	}
	
	// 게시글 삭제
	public void deleteBoard(int no) {
		
		for (int i = 0; i < listOfBoard.size(); i++) {
			BoardVO boardVO = listOfBoard.get(i);
			
			if(no == boardVO.getNo()) {
				listOfBoard.remove(i);	
			}
		}
	}
	
	// 게시글 수정
	public void updateBoard(BoardVO board) {
		
		for (int i = 0; i < listOfBoard.size(); i++) {
			BoardVO vo = listOfBoard.get(i);
			
			if(board.getNo() == vo.getNo()) {
				listOfBoard.set(i, board);
			}
		}
	}
	
	// 게시글 추가
	public void addBoard(BoardVO board) {
		//글번호 
		board.setNo(getNo()+1);
		
		listOfBoard.add(board);
		
		//글번호 증가
		no++;
	}
	
	// 게시글 번호 가져오기
	public int getNo() {
		return listOfBoard.size();
	}

	
	// 날짜 출력할때 활용
	public String getCurrenTime() {
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Calendar cal = Calendar.getInstance();
		cal.setTimeInMillis(System.currentTimeMillis());
		return formatter.format(cal.getTime());
	}
}