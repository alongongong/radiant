package stock.bean;

import lombok.Data;

@Data
public class StockDTO {

	private int clNum;
	private String clName;
	private String category;
	private int price;
	private int salerate;
	private String color;
	private int enterCount;
	private int outCount;
	private String clDetail;
	private int likeCount;
	private String img;
}
