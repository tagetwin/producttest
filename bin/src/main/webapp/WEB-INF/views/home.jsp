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
	<button id="life-btn" value="life">주방용품</button>
	<button id="food-btn" value="food">음식</button>
	<button id="price-btn">가격순</button>
	<button id="order-btn">주문순</button>

	<table border="1" id="table">
		<tr id="title">
			<th>#</th>
			<th>Name</th>
			<th>Price</th>
			<th>orderCount</th>
			<th>Type</th>
		</tr>

		<c:forEach var="products" items="${products}" varStatus="status">
			<tbody>
			<tr id="items">
				<td class="item">${products.id}</td>
				<td class="item">${products.name}</td>
				<td class="item">${products.price}</td>
				<td class="item">${products.orderCount}</td>
				<td class="item">${products.type}</td>
			</tr>
			</tbody>
		</c:forEach>
	</table>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
	
		$('#all-btn').on('click', function(){

			
	  		$.ajax({
				type : 'GET',
				url : '/all/',
	 			dataType : 'json'			
	  			
	  		}).done(function(result){
	  			console.log(result);
	  			console.log('성공');
	  			$(".item").remove();
	  			$("#items").remove();
	  			
	  			for(i=0; i<result.length; i++){
	  				var id = result[i].id
	  				var name = result[i].name
	  				var price = result[i].price
	  				var orderCount = result[i].orderCount
	  				var type = result[i].type
						  				
	  				$('tbody').append("<tr id='items'>")
	      			$("#items").append("<td class='item'>"+id+"</td>");
	      			$("#items").append("<td class='item'>"+name+"</td>");
	      			$("#items").append("<td class='item'>"+price+"</td>");
	      			$("#items").append("<td class='item'>"+orderCount+"</td>");
	      			$("#items").append("<td class='item' id='item2'>"+type+"</td>");
	      			$('#item2').after('</tr>');
	  			}
	  	
	 		}).fail(function(){
				console.log('실패');
	 		});
		  
	    });

	
      $('#life-btn').on('click', function(){

			var type = $('#life-btn').val();
    	  	
      		$.ajax({
    			type : 'GET',
    			url : '/life/',
     			dataType : 'json'			
      			
      		}).done(function(result){
      			console.log(result);
      			console.log('주방성공');
      			
      			$(".item").remove();
      			for(i=0; i<result.length; i++){
      				$("#title").after("<tr id='items'>")
	      			$("#items").append("<td class='item'>"+result[i].id+"</td>");
	      			$("#items").append("<td class='item'>"+result[i].name+"</td>");
	      			$("#items").append("<td class='item'>"+result[i].price+"</td>");
	      			$("#items").append("<td class='item'>"+result[i].orderCount+"</td>");
	      			$("#items").append("<td class='item'>"+result[i].type+"</td>");
	      			$("#items").after("</tr>")
      			}
    			
     		}).fail(function(){
				console.log('실패');
     		});
    	  
        })    	 
        
        $('#food-btn').on('click', function(){

        	var type = $('#life-btn').val();
        	
      		$.ajax({
    			type : 'GET',
    			url : '/food/',
     			dataType : 'json'			
      			
      		}).done(function(result){
      			console.log(result);
      			console.log('음식성공');
      			$(".item").remove();
      			for(i=0; i<result.length; i++){
      				$("#title").after("<tr id='items'>")
	      			$("#items").append("<td class='item'>"+result[i].id+"</td>");
	      			$("#items").append("<td class='item'>"+result[i].name+"</td>");
	      			$("#items").append("<td class='item'>"+result[i].price+"</td>");
	      			$("#items").append("<td class='item'>"+result[i].orderCount+"</td>");
	      			$("#items").append("<td class='item'>"+result[i].type+"</td>");
	      			$("#items").after("</tr>")
      			}
    			
     		}).fail(function(){
				console.log('실패');
     		});
    	  
        });

      $('#price-btn').on('click', function(){

    		$.ajax({
  			type : 'GET',
  			url : '/price/',
   			dataType : 'json'			
    			
    		}).done(function(result){
    			console.log(result);
    			console.log('가격성공');
    			$(".item").remove();
    			for(i=0; i<result.length; i++){
    				$("#title").after("<tr id='items'>")
	      			$("#items").append("<td class='item'>"+result[i].id+"</td>");
	      			$("#items").append("<td class='item'>"+result[i].name+"</td>");
	      			$("#items").append("<td class='item'>"+result[i].price+"</td>");
	      			$("#items").append("<td class='item'>"+result[i].orderCount+"</td>");
	      			$("#items").append("<td class='item'>"+result[i].type+"</td>");
	      			$("#items").after("</tr>")
    			}
  			
   		}).fail(function(){
				console.log('실패');
   		});
  	  
      });   
      
      $('#order-btn').on('click', function(){

      		$.ajax({
    			type : 'GET',
    			url : '/order/',
     			dataType : 'json'			
      			
      		}).done(function(result){
      			console.log(result);
      			console.log('주문수성공');
      			$(".item").remove();
      			for(i=0; i<result.length; i++){
      				$("#title").after("<tr id='items'>")
	      			$("#items").append("<td class='item'>"+result[i].id+"</td>"+"<td class='item'>"+result[i].name+"</td>"+"<td class='item'>"+result[i].price+"</td>"+"<td class='item'>"+result[i].orderCount+"</td>"+"<td class='item'>"+result[i].type+"</td>");
// 	      			$("#items").prepend("<td class='item'>"+result[i].name+"</td>");
// 	      			$("#items").prepend("<td class='item'>"+result[i].price+"</td>");
// 	      			$("#items").prepend("<td class='item'>"+result[i].orderCount+"</td>");
// 	      			$("#items").prepend("<td class='item'>"+result[i].type+"</td>");
	      			$("#items").append("</tr>")
      			}
    			
     		}).fail(function(){
				console.log('실패');
     		});
    	  
        });       	      
    </script>
</body>
</html>