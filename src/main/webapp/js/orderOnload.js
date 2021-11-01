$(function(){
	// 결제페이지 온로드(상세페이지에서 결제하기 버튼)
	$.ajax({
		url: '/radiant/order/getOrderpay.do',
		type: 'post',
		data: $('#payForm').serialize(),
		dataType: 'json',
		success: function(data){
			var price=0;
			var saleMoney=0;
			for(j=0; j<data.i; j++) {
				$('#orderTopTable tbody').append($('<tr>').append($('<td>',{
					width: '130px'
				}).append($('<img>',{
					width: '120px',
					src: '../img/clothes/'+data.img,
					alt: '상품이미지',
					class: 'productImg',
					style: 'padding: 5px 5px 5px 20px; width: 120px'
				}))).append($('<td>').append($('<div>',{
					class: 'productName',
					name: 'productName'+j,
					text: data.clName,
					style: 'font-size: 13px; font-weight: bold; width: 470px;'
				}))).append($('<td>').append($('<div>',{
					class: 'productInfo',
					name: 'productInfo'+j,
					text: data.color[j],
					style: 'font-size: 13px; width: 130px',
					align: 'center'
				}).append($('<span>',{
					text: ' / FREE',
					style: 'font-size: 13px;',
					align: 'center'
				})))).append($('<td>').append($('<div>',{
					width: '90px'
				}).append($('<span>',{
					text: $.comma(parseInt(data.price)) + ' 원',
					id: 'salePrice'+j,
					style: 'font-size: 10px; color: #999; text-decoration: line-through; display:block',
					align: 'center'
				})).append($('<span>',{
					class: 'productPrice',
					name: 'productPrice'+j,
					text: $.comma(parseInt(data.price)*(1-parseInt(data.salerate)/100))+' 원',
					style: 'font-size: 13px; display: block',
					align: 'center'
				})))).append($('<td>').append($('<div>',{
					class: 'productAmount',
					name: 'productAmount',
					text: data.outcount[j],
					align: 'center',
					width: '90px'
				}))).append($('<td>').append($('<div>',{
					class: 'totPrice',
					name: 'totPrice'+j,
					text: $.comma(parseInt(data.price)*parseInt(data.outcount[j])*(100-parseInt(data.salerate))/100)+' 원',
					style: 'font-size: 13px; width: 110px',
					align: 'center'
				}))).append($('<td>').append($('<div>',{
					text: '100원',
					style: 'font-size: 13px; width: 110px',
					align: 'center',
					class: 'newProductSaved'
				}))))
				
				$('#payForm #topDiv').append($('<input>',{
					type: 'hidden',
					id: 'productAmount'+j,
					name: 'productAmount'+j,
					value: data.outcount[j],
				}))
	
	
				price += (data.price*data.outcount[j]);
				saleMoney += (data.price * data.outcount[j] * data.salerate / 100);
				
				if(data.salerate == 0){
					$('#salePrice'+j).remove();
				}
				
			} // for
			
			
			$('#priceAll').text($.comma(price)+'원'); // 총 상품금액
			
			if(price >= 80000) {
				$('#shipMoney').text('0');
				$('#hiddenShipMoney').val('0');
			} else {$('#shipMoney').text('3,000'); 
				$('#hiddenShipMoney').val('3000');
			}// 배송료
			
			
			$('#saleMoney').text($.comma(saleMoney)); // 기본할인
			$('#totSaleMoney').text($.comma(saleMoney)); // 총할인금액
			var totPrice = price + parseInt($.uncomma($('#shipMoney').text()))-saleMoney
			$('#totPrice').text($.comma(totPrice)); // 촣 결제금액
			
			// 주문자 정보 입력
			$('#userInfoTable #userInfoName').val(data.userName);
			$('#userInfoTable #userInfoTel1').val(data.userTel1);
			$('#userInfoTable #userInfoTel2').val(data.userTel2);
			$('#userInfoTable #userInfoTel3').val(data.userTel3);
			$('#userInfoTable #userInfoEmail').val(data.userEmail);
			
			$.each(data.list, function(index, items){
				$('select').append($('<option>',{
					value: items.shipName,
					text: items.shipName
				}))
				
				$('#shipInfoSelect').change(function(){
					if($('#shipInfoSelect').val()==items.shipName){
						$('#shipInfoTable #shipName').val(items.receiver);
						$('#shipInfoTable #shipTel1').val(items.shipTel1);
						$('#shipInfoTable #shipTel2').val(items.shipTel2);
						$('#shipInfoTable #shipTel3').val(items.shipTel3);
						$('#shipInfoTable #shipZipcode').val(items.shipZipcode);
						$('#shipInfoTable #shipAddr1').val(items.shipAddr1);
						$('#shipInfoTable #shipAddr2').val(items.shipAddr2);
						
					}
				});
			
			});
	
		}, // success
		error: function(err){
			console.log(err)
		}
	}); // 온로드
	
	
	// 세자리마다 콤마찍기 함수
	$.comma = function (x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}
	
	// 콜마 없애기 함수
	$.uncomma =  function (x) {
		return x.replace(/[^\d]+/g, '');
	}


	
});

