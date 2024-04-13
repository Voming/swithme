package swithme.model.board.dto;

public class BoardDto {
	
//			BOARD_ID     NOT NULL NUMBER         
//			BOARD_WRITER NOT NULL VARCHAR2(20)   
//			TITLE        NOT NULL VARCHAR2(120)  
//			CONTENT      NOT NULL VARCHAR2(4000) 
//			WRITE_TIME   NOT NULL TIMESTAMP(6)   
//			READ_COUNT   NOT NULL NUMBER         
//			BOARD_LIKE   NOT NULL NUMBER   

	private int boardId;
	private String boardWriter;
	private String title;
	private String content;
	private String writeTime; //timeStamp
	private int readCount;
	private int boardLike;
	
	
	
	@Override
	public String toString() {
		return "BoardDto [boardId=" + boardId + ", boardWriter=" + boardWriter + ", title=" + title + ", content="
				+ content + ", writeTime=" + writeTime + ", readCount=" + readCount + ", boardLike=" + boardLike + "]";
	}


	public BoardDto(int boardId, String boardWriter, String title, String content, String writeTime, int readCount,
			int boardLike) {
		super();
		this.boardId = boardId;
		this.boardWriter = boardWriter;
		this.title = title;
		this.content = content;
		this.writeTime = writeTime;
		this.readCount = readCount;
		this.boardLike = boardLike;
	}

	public int getBoardId() {
		return boardId;
	}
	
	public String getBoardWriter() {
		return boardWriter;
	}
	
	public String getTitle() {
		return title;
	}
	
	public String getContent() {
		return content;
	}
	
	public String getWriteTime() {
		return writeTime;
	}
	
	public int getReadCount() {
		return readCount;
	}
	
	public int getBoardLike() {
		return boardLike;
	}
	
	
	
	
}
