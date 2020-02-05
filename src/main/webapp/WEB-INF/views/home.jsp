<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈페이지</title>
</head>
<body>
	<button id="all-btn">전체보기</button>
	<button id="life-btn">주방용품</button>
	<button id="food-btn">음식</button>
	<button id="price-btn">가격순</button>
	<button id="order-btn">주문순</button>

	<table border="1" id="table">
		<tr id="title">
			<th>#</th>
			<th>Name</th>
			<th>Price</th>
			<th>orderCount</th>
			<th>type</th>
		</tr>

		<c:forEach var="products" items="${products}" varStatus="status">

			<tr id="items">
				<td class="item">${products.id}</td>
				<td class="item">${products.name}</td>
				<td class="item">${products.price}</td>
				<td class="item">${products.orderCount}</td>
				<td class="item">${products.type}</td>
			</tr>

		</c:forEach>
	</table>
	<h3 id="lifefood"></h3>
	<h3 id="priceorder"></h3>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
	
		var option = 0;

		function reUseTable() {
			$("#table").empty();
			$('#table').append("<tr>");
			$('#table').append("<th>#</th>");
			$('#table').append("<th>Name</th>");
			$('#table').append("<th>Price</th>");
			$('#table').append("<th>orderCount</th>");
			$('#table').append("<th>type</th>");
			$('#table').append("</tr>");
		}

		function makeTable(result) {

			for (i = 0; i < result.length; i++) {

				$('#table').append("<tr id='items'>");
				$("#table").append("<td class='item'>" + result[i].id + "</td>");
				$("#table").append("<td class='item'>" + result[i].name + "</td>");
				$("#table").append("<td class='item'>" + result[i].price + "</td>");
				$("#table").append("<td class='item'>" + result[i].orderCount + "</td>");
				$("#table").append("<td class='item'>" + result[i].type + "</td>");
				$('#table').append('</tr>');

			}
		}

		// 	전체 검색
		$('#all-btn').on('click', function() {

			option = 0;
			
			$("#lifefood").text("");
			$("#priceorder").text("");

			reUseTable();

			$.ajax({
				type : 'GET',
				url : '/all/',
				dataType : 'json'

			}).done(function(result) {

				makeTable(result);

			}).fail(function() {
				console.log('실패');
			});

		});

		// 주방버튼	
		$('#life-btn').on('click', function() {

			option = 1;
			
			$("#lifefood").text("주방");
			$("#priceorder").text("");

			reUseTable();

			$.ajax({
				type : 'GET',
				url : '/type/주방',
				dataType : 'json'

			}).done(function(result) {

				makeTable(result);

			}).fail(function() {
				console.log('실패');
			});

		});

		// 음식버튼   
		$('#food-btn').on('click', function() {

			option = 2;
			
			$("#lifefood").text("음식");
			$("#priceorder").text("");

			reUseTable();

			$.ajax({
				type : 'GET',
				url : '/type/음식',
				dataType : 'json'

			}).done(function(result) {

				makeTable(result);

			}).fail(function() {
				console.log('실패');
			});

		});

		// 가격버튼
		$('#price-btn').on('click', function() {
			$("#priceorder").text("가격");

			reUseTable();

			// 가격 + 주방
			if (option == 1) {

				$.ajax({
					type : 'GET',
					url : '/price/주방',
					dataType : 'json'

				}).done(function(result) {

					makeTable(result);

				}).fail(function() {
					console.log('실패');
				});

				// 가격 + 음식
			} else if (option == 2) {
				$.ajax({
					type : 'GET',
					url : '/price/음식',
					dataType : 'json'

				}).done(function(result) {

					makeTable(result);

				}).fail(function() {
					console.log('실패');
				});

			} else {
				$.ajax({
					type : 'GET',
					url : '/sort/price',
					dataType : 'json'

				}).done(function(result) {

					makeTable(result);

				}).fail(function() {
					console.log('실패');
				});
			}
		});

		//    주문
		$('#order-btn').on('click', function() {
			$("#priceorder").text("주문");

			reUseTable();

			// 주방+주문
			if (option == 1) {
				$.ajax({
					type : 'GET',
					url : '/order/주방',
					dataType : 'json'

				}).done(function(result) {

					makeTable(result);

				}).fail(function() {
					console.log('실패');
				});

				// 음식 + 주문

			} else if (option == 2) {
				$.ajax({
					type : 'GET',
					url : '/order/음식',
					dataType : 'json'

				}).done(function(result) {

					makeTable(result);

				}).fail(function() {
					console.log('실패');
				});

			} else {
				$.ajax({
					type : 'GET',
					url : '/sort/orderCount',
					dataType : 'json'

				}).done(function(result) {

					makeTable(result);

				}).fail(function() {
					console.log('실패');
				});
			}
		});
	</script>
</body>
</html>