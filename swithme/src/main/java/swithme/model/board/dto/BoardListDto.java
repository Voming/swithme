package swithme.model.board.dto;

public class BoardListDto {
	
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
