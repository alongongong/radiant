package board.bean;

import java.util.Date;

import lombok.Data;

@Data
public class CommentDTO {
	private int commentSeq;
	private int boardSeq;
	private String commentId;
	private String commentText;
	private String commentDate;
	private int commentParent;
}
