package order.bean;

import java.util.Date;

import lombok.Data;

@Data
public class OrderDTO {
	private int orderNum; // 주문번호 yyyyMMdd-R0010000형식으로
	private String id;
	private int clNum;
	private String color;
	private int outcount; // 구매수량
	private int price; // 상품가격
	private int totPrice; // 총 구매가격
	private Date logtime;
	private String img;
}
