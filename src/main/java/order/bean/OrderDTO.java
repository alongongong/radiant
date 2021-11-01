package order.bean;

import java.util.Date;

import lombok.Data;

@Data
public class OrderDTO {
	private int orderNum; // 주문번호 yyyyMMdd-R0010000형식으로
	private String id;
	private int clNum;
	private String color;
	private int outCount; // 구매수량
	private int shipMoney; // 배송비
	private String shipName;
	private String shipTel1;
	private String shipTel2;
	private String shipTel3;
	private String shipZipcode;
	private String shipAddr1;
	private String shipAddr2;
	private String shipMemo; // 배송메모
	private String payment; // 구매수단
	private String delivery; // 배송상황
	private Date logtime;
	private String img;
}
