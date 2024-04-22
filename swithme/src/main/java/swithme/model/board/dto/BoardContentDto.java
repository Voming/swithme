package swithme.model.board.dto;

public class BoardContentDto {

	private Integer boardId;
	private String title;
	private String boardWriter;
	private String writeTime; //timeStamp
	private Integer boardLike;
	private String content;

	@Override
	public String toString() {
		return "BoardContentDto [boardId=" + boardId + ", title=" + title + ", boardWriter=" + boardWriter
				+ ", writeTime=" + writeTime + ", boardLike=" + boardLike + ", content=" + content + "]";
	}

	public BoardContentDto(Integer boardId, String title, String boardWriter, String writeTime, Integer boardLike, String content) {
		super();
		this.boardId = boardId;
		this.title = title;
		this.boardWriter = boardWriter;
		this.writeTime = writeTime;
		this.boardLike = boardLike;
//		this.content = content;
		content = content.replaceAll("\\r?\\n","<br>");
		//줄바꿈 태그 바꾸기 -> 그냥 글을 쓰면 화면상 줄바꿈이 나타나지 않음
		content = content.replaceAll(" ","&nbsp;");
		//띄워쓰기를 html 코드로 변경 => database 꺼내오는 부분에 넣기
	}

	public Integer getBoardId() {
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

	public Integer getBoardLike() {
		return boardLike;
	}

	public String getContent() {
		return content;
	}
	
	
}
