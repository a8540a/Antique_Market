function CheckAddProduct(){
	var productName = document.getElementById("name");
	var productPrice = document.getElementById("startPrice");
	
	if(productName.value.length<2||productName.value.length>10){
		alert("상품 이름은 최소 2자에서 최대10자까지 입력하세요");
		name.select();
		name.focus();
		return false
	}
	if(productPrice.value.length==0||isNaN(productPrice.value)){
		alert("가격에는 숫자만 입력하세요");
		unitPrice.select();
		unitPrice.focus();
		return false
	}
	if(productPrice.value<0){
		alert("가격에는 양수만 입력하세요");
		unitPrice.select();
		unitPrice.focus();
		return false
	}	
	
	
	
	document.newProduct.submit()
}

