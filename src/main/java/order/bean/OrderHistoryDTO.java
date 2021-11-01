package order.bean;

import lombok.Data;

@Data
public class OrderHistoryDTO {
	private String orderNum;
	private String clName;
	private String color;
	private int price;
	private String delivery;
}
