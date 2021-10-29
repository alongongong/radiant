package order.bean;

import java.util.Date;

import lombok.Data;

@Data
public class OrderDTO {
	private int orderNum;
	private String id;
	private int clNum;
	private String color;
	private int outcount;
	private Date logtime;
}
