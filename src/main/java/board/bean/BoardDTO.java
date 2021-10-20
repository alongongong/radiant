package board.bean;

import lombok.Data;

@Data
public class BoardDTO {
	private int boardSeq;
	private String id;
	private String subject;
	private String content;
	private String boardPwd;
	private int reply;
	private int hit;
	private String logtime;
}
