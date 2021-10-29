package cart.bean;

import lombok.Data;

@Data
public class CartDTO {
	//join 고려해서 만들기
	private int cart_id; //장바구니 아이디 
	private String userid; //사용자 아이디
	private String name; 
	private int product_id;
	private String product_name;
	private int price;
	private int money; 
	private int amount;
	private String img;
}
