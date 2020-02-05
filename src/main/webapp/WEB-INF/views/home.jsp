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
		<thead>
			<tr id="title">
				<td>#</td>
				<td>Name</td>
				<td>Price</td>
				<td>orderCount</td>
				<td>type</td>
			</tr>
		</thead>
		<tbody id="tbody">
			<c:forEach var="products" items="${products}" varStatus="status">

				<tr id="items">
					<td class="item">${products.id}</td>
					<td class="item">${products.name}</td>
					<td class="item">${products.price}</td>
					<td class="item">${products.orderCount}</td>
					<td class="item">${products.type}</td>
				</tr>

			</c:forEach>
		</tbody>
	</table>
	<h3 id="lifefood"></h3>
	<h3 id="priceorder"></h3>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		var option = 0;

		function makeTable(result) {

			for (key in result) {

				var res = '';
				res += "<tr>";
				res += "<td>" + result[key].id + "</td>";
				res += "<td>" + result[key].name + "</td>";
				res += "<td>" + result[key].price + "</td>";
				res += "<td>" + result[key].orderCount + "</td>";
				res += "<td>" + result[key].type + "</td>";
				res += "</tr>";

				$('tbody').append(res);

			}
		}

		// 	전체 검색
		$('#all-btn').on('click', function() {

			option = 0;

			$("#lifefood").text("");
			$("#priceorder").text("");

			$.ajax({
				type : 'GET',
				url : '/all/',
				dataType : 'json'

			}).done(function(result) {
				$("#tbody").empty();
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

			$.ajax({
				type : 'GET',
				url : '/type/주방',
				dataType : 'json'

			}).done(function(result) {
				$("#tbody").empty();
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

			$.ajax({
				type : 'GET',
				url : '/type/음식',
				dataType : 'json'

			}).done(function(result) {
				$("#tbody").empty();
				makeTable(result);

			}).fail(function() {
				console.log('실패');
			});

		});

		// 가격버튼
		$('#price-btn').on('click', function() {
			$("#priceorder").text("가격");

			// 가격 + 주방
			if (option == 1) {

				$.ajax({
					type : 'GET',
					url : '/price/주방',
					dataType : 'json'

				}).done(function(result) {
					$("#tbody").empty();
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
					$("#tbody").empty();
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
					$("#tbody").empty();
					makeTable(result);

				}).fail(function() {
					console.log('실패');
				});
			}
		});

		//    주문
		$('#order-btn').on('click', function() {
			$("#priceorder").text("주문");

			// 주방+주문
			if (option == 1) {
				$.ajax({
					type : 'GET',
					url : '/order/주방',
					dataType : 'json'

				}).done(function(result) {
					$("#tbody").empty();
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
					$("#tbody").empty();
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
					$("#tbody").empty();
					makeTable(result);

				}).fail(function() {
					console.log('실패');
				});
			}
		});
	</script>
</body>
</html>