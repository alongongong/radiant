package stock.bean;

import lombok.Data;

@Data
public class StockDTO {
	private int clNum;
	private String clName;
	private String category;
	private int price;
	private String color;
	private int buyCount;
	private int sellCount;
	private int stockCount;
	private String clDetail;
	private int like;
}
