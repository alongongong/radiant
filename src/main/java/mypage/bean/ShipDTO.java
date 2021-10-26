package mypage.bean;

import lombok.Data;

@Data
public class ShipDTO {
	private String shipName;
	private String shipZipcode;
	private String shipAddr1;
	private String shipAddr2;
	private String receiver;
	private String shipTel1;
	private String shipTel2;
	private String shipTel3;
	private String baseShipCheck;
}
