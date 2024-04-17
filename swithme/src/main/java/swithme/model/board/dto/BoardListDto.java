package swithme.model.board.dto;

public class BoardListDto {
	
//	BOARD_ID     NOT NULL NUMBER         
//	BOARD_WRITER NOT NULL VARCHAR2(20)   
//	TITLE        NOT NULL VARCHAR2(120)  
//	CONTENT      NOT NULL VARCHAR2(4000) 
//	WRITE_TIME   NOT NULL TIMESTAMP(6)   
//	READ_COUNT   NOT NULL NUMBER         
//	BOARD_LIKE   NOT NULL NUMBER 
	
	private int boardId;
	private String title;
	private String boardWriter;
	private String writeTime; //timeStamp
	private int readCount;
	
	
	
	@Override
	public String toString() {
		return "BoardListDto [boardId=" + boardId + ", title=" + title + ", boardWriter=" + boardWriter + ", writeTime="
				+ writeTime + ", readCount=" + readCount + "]";
	}

	public BoardListDto(int boardId, String title, String boardWriter, String writeTime, int readCount) {
		super();
		this.boardId = boardId;
		this.title = title;
		this.boardWriter = boardWriter;
		this.writeTime = writeTime;
		this.readCount = readCount;
	}

	public int getBoardId() {
		return boardId;
	}

	public String getTitle() {
		return title;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public String getWriteTime() {
		return writeTime;
	}

	public int getReadCount() {
		return readCount;
	}
	
	
	

	
	
}
