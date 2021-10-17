package stock.bean;

import lombok.Data;

@Data
public class StockDTO {
  private int clNum;// 옷번호
  private String clName;// 옷이름
  private String category;// 카테고리
  private int price;// 정가
  private String color;// 색상
  private int buyCount;// 입고수량
  private int sellCount;// 판매수량
  private int stockCount;// 재고수량
  private String clDetail;// 옷상세정보
  private int like;// 좋아요
}
