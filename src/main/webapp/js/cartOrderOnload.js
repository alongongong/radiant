$(function(){
	// 결제페이지 온로드(상세페이지에서 결제하기 버튼)
	$.ajax({
		url: '/radiant/order/getCartOrderPay.do',
		type: 'post',
		data: $('#payForm').serialize(),
		dataType: 'json',
		success: function(data){
			var price=0;
			var saleMoney=0;
			$.each(data.cartList, function(index, items) {
				$('#orderTopTable tbody').append($('<tr>').append($('<td>',{
					width: '130px'
				}).append($('<img>',{
					width: '120px',
					src: '../img/clothes/'+items.img,
					alt: '상품이미지',
					class: 'productImg',
					style: 'padding: 5px 5px 5px 20px; width: 120px'
				}))).append($('<td>').append($('<div>',{
					class: 'productName',
					name: 'productName'+index,
					text: items.product_name,
					style: 'font-size: 13px; font-weight: bold; width: 470px;'
				}))).append($('<td>').append($('<div>',{
					class: 'productInfo',
					name: 'productInfo'+index,
					text: items.color,
					style: 'font-size: 13px; width: 130px',
					align: 'center'
				}).append($('<span>',{
					text: ' / FREE',
					style: 'font-size: 13px;',
					align: 'center'
				})))).append($('<td>').append($('<div>',{
					width: '90px'
				}).append($('<span>',{
					text: $.comma(parseInt(items.price)) + ' 원',
					id: 'salePrice'+index,
					style: 'font-size: 10px; color: #999; text-decoration: line-through; display:block',
					align: 'center'
				})).append($('<span>',{
					class: 'productPrice',
					name: 'productPrice'+index,
					text: $.comma(parseInt(items.price)*(1-parseInt(items.salerate)/100))+' 원',
					style: 'font-size: 13px; display: block',
					align: 'center'
				})))).append($('<td>').append($('<div>',{
					class: 'productAmount',
					name: 'productAmount',
					text: items.amount,
					align: 'center',
					width: '90px'
				}))).append($('<td>').append($('<div>',{
					class: 'totPrice',
					name: 'totPrice'+index,
					text: $.comma(parseInt(items.price)*parseInt(items.amount)*(100-parseInt(items.salerate))/100)+' 원',
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
					id: 'productAmount'+index,
					name: 'productAmount'+index,
					value: items.amount,
				})).append($('<input>',{
					type: 'hidden',
					id: 'clNum'+index,
					name: 'clNum'+index,
					value: items.product_id
				})).append($('<input>',{
					type: 'hidden',
					id: 'color'+index,
					name: 'color'+index,
					value: items.color
				}))
	
	
				price += (items.price*items.amount);
				saleMoney += (items.price * items.amount * items.salerate / 100);
				
				if(items.salerate == 0){
					$('#salePrice'+index).remove();
				}
				
			}) // for
			
			
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