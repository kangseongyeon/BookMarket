function CheckAddBook() {

	/*var bookId = document.newBook.bookId.value;
	var name = document.newBook.name.value;
	var unitPrice = document.newBook.unitPrice.value;
	var unitsInStock = document.newBook.unitsInStock.value;
	*/
	var bookId = document.getElementById("bookId");
	var name = document.getElementById("name");
	var unitPrice = document.getElementById("unitPrice");
	var unitsInStock = document.getElementById("unitsInStock");
	
	// 상품ID 체크
	if (!check(/^ISBN[0-9]{4,11}$/, bookId,
			"[도서코드]\nISBN과 숫자를 조합하여 5~12자까지 입력하세요\n첫글자는 반드시 ISBN로 시작하세요"))
		return false;
	// 상품명 체크
	if (name.value.length < 4 || name.value.length > 12) {
		alert("[도서명]\n최소 4자에서 최대 50자까지 입력하세요");
		name.select();
		name.focus();
		return false;
	}
	// 상품가격 체크
	if (unitPrice.value.length == 0 || isNaN(unitPrice.value)) {
		alert("[가격]\n숫자만 입력하세요");
		unitPrice.select();
		unitPrice.focus();
		return false;
	}

	if (unitPrice.value < 0) {
		alert("[가격]\n음수를 입력할 수 없습니다");
		unitPrice.select();
		unitPrice.focus();
		return false;
	} else if (!check(/^\d+(?:[.]?[\d]?[\d])?$/, unitPrice,
			"[가격]\n소수점 2자리까만 입력해주세요"))
		return false;

	// 재고수 체크
	if (unitsInStock.value.length == 0 || isNaN(unitsInStock.value)) {
		alert("[재고수]\n숫자만 입력하세요");
		unitsInStock.select();
		unitsInStock.focus();
		return false;
	}

	function check(regExp, e, msg) {

		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}

	 document.newBook.submit()
}
