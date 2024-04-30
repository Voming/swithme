package swithme.model.member.dto;

public class MemberBoardDto {
	Integer idx;
	Integer boardId;
	@Override
	public String toString() {
		return "MemberBoardDto [idx=" + idx + ", boardId=" + boardId + "]";
	}
	public MemberBoardDto(Integer idx, Integer boardId) {
		super();
		this.idx = idx;
		this.boardId = boardId;
	}
	public Integer getIdx() {
		return idx;
	}
	public Integer getBoardId() {
		return boardId;
	}
	
	
}
