<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product REST API 測試</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
	background-color: #f5f5f5;
}

.container {
	max-width: 1200px;
	margin: 0 auto;
	background-color: white;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

h1 {
	color: #333;
	text-align: center;
}

.api-section {
	margin: 20px 0;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: #fafafa;
}

.api-section h3 {
	color: #0066cc;
	margin-top: 0;
}

button {
	padding: 10px 20px;
	margin: 5px;
	background-color: #0066cc;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

button:hover {
	background-color: #0052a3;
}

input, textarea {
	padding: 8px;
	margin: 5px 0;
	width: 100%;
	box-sizing: border-box;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.result {
	margin-top: 10px;
	padding: 15px;
	background-color: #f0f8ff;
	border: 1px solid #b8d4e8;
	border-radius: 5px;
	white-space: pre-wrap;
	word-wrap: break-word;
	font-family: monospace;
	font-size: 12px;
}

.form-group {
	margin: 10px 0;
}

label {
	display: inline-block;
	width: 100px;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Product REST API 測試工具</h1>
		<p style="text-align: center;">
			<a href="<c:url value='/' />">回首頁</a>
		</p>
		<hr>

		<!-- 1. 取得所有產品 -->
		<div class="api-section">
			<h3>1. 取得所有產品 (GET)</h3>
			<p>
				<strong>URL:</strong> /api/products
			</p>
			<button onclick="getAllProducts()">執行</button>
			<div id="result1" class="result"></div>
		</div>

		<!-- 2. 根據 ID 取得產品 -->
		<div class="api-section">
			<h3>2. 根據 ID 取得產品 (GET)</h3>
			<p>
				<strong>URL:</strong> /api/products/{id}
			</p>
			<div class="form-group">
				<label>產品 ID:</label> <input type="number" id="getProductId"
					value="1">
			</div>
			<button onclick="getProductById()">執行</button>
			<div id="result2" class="result"></div>
		</div>

		<!-- 3. 新增產品 -->
		<div class="api-section">
			<h3>3. 新增產品 (POST)</h3>
			<p>
				<strong>URL:</strong> /api/products
			</p>
			<div class="form-group">
				<label>產品名稱:</label> <input type="text" id="newProductName"
					value="筆記型電腦">
			</div>
			<div class="form-group">
				<label>產品描述:</label> <input type="text" id="newProductDesc"
					value="高效能筆記型電腦">
			</div>
			<div class="form-group">
				<label>價格:</label> <input type="number" id="newProductPrice"
					value="25000">
			</div>
			<div class="form-group">
				<label>數量:</label> <input type="number" id="newProductQty"
					value="10">
			</div>
			<button onclick="createProduct()">執行</button>
			<div id="result3" class="result"></div>
		</div>

		<!-- 4. 更新產品 -->
		<div class="api-section">
			<h3>4. 更新產品 (PUT)</h3>
			<p>
				<strong>URL:</strong> /api/products/{id}
			</p>
			<div class="form-group">
				<label>產品 ID:</label> <input type="number" id="updateProductId"
					value="1">
			</div>
			<div class="form-group">
				<label>產品名稱:</label> <input type="text" id="updateProductName"
					value="筆記型電腦 (更新)">
			</div>
			<div class="form-group">
				<label>產品描述:</label> <input type="text" id="updateProductDesc"
					value="高效能筆記型電腦 (升級版)">
			</div>
			<div class="form-group">
				<label>價格:</label> <input type="number" id="updateProductPrice"
					value="28000">
			</div>
			<div class="form-group">
				<label>數量:</label> <input type="number" id="updateProductQty"
					value="15">
			</div>
			<button onclick="updateProduct()">執行</button>
			<div id="result4" class="result"></div>
		</div>

		<!-- 5. 刪除產品 -->
		<div class="api-section">
			<h3>5. 刪除產品 (DELETE)</h3>
			<p>
				<strong>URL:</strong> /api/products/{id}
			</p>
			<div class="form-group">
				<label>產品 ID:</label> <input type="number" id="deleteProductId"
					value="1">
			</div>
			<button onclick="deleteProduct()">執行</button>
			<div id="result5" class="result"></div>
		</div>

		<!-- 6. 搜尋產品 -->
		<div class="api-section">
			<h3>6. 根據關鍵字搜尋產品 (GET)</h3>
			<p>
				<strong>URL:</strong> /api/products/search?keyword={keyword}
			</p>
			<div class="form-group">
				<label>關鍵字:</label> <input type="text" id="searchKeyword"
					value="筆記">
			</div>
			<button onclick="searchProducts()">執行</button>
			<div id="result6" class="result"></div>
		</div>

		<!-- 7. 價格區間搜尋 -->
		<div class="api-section">
			<h3>7. 根據價格區間搜尋產品 (GET)</h3>
			<p>
				<strong>URL:</strong> /api/products/price-range?min={min}&max={max}
			</p>
			<div class="form-group">
				<label>最低價格:</label> <input type="number" id="minPrice"
					value="1000">
			</div>
			<div class="form-group">
				<label>最高價格:</label> <input type="number" id="maxPrice"
					value="30000">
			</div>
			<button onclick="searchByPriceRange()">執行</button>
			<div id="result7" class="result"></div>
		</div>

		<!-- 8. 取得排序後的產品 -->
		<div class="api-section">
			<h3>8. 取得所有產品（依名稱排序）(GET)</h3>
			<p>
				<strong>URL:</strong> /api/products/sorted
			</p>
			<button onclick="getSortedProducts()">執行</button>
			<div id="result8" class="result"></div>
		</div>
	</div>

	<script>
		const API_BASE_URL = "${pageContext.request.contextPath}/api/products";

		// 1. 取得所有產品
		function getAllProducts() {
			$.ajax({
				url : API_BASE_URL,
				method : "GET",
				success : function(data) {
					$("#result1").text(JSON.stringify(data, null, 2));
				},
				error : function(xhr) {
					$("#result1").text("錯誤: " + xhr.responseText);
				}
			});
		}

		// 2. 根據 ID 取得產品
		function getProductById() {
			const id = $("#getProductId").val();
			$.ajax({
				url : API_BASE_URL + "/" + id,
				method : "GET",
				success : function(data) {
					$("#result2").text(JSON.stringify(data, null, 2));
				},
				error : function(xhr) {
					$("#result2").text("錯誤: " + xhr.responseText);
				}
			});
		}

		// 3. 新增產品
		function createProduct() {
			const product = {
				name : $("#newProductName").val(),
				description : $("#newProductDesc").val(),
				price : parseFloat($("#newProductPrice").val()),
				quantity : parseInt($("#newProductQty").val())
			};

			$.ajax({
				url : API_BASE_URL,
				method : "POST",
				contentType : "application/json",
				data : JSON.stringify(product),
				success : function(data) {
					$("#result3").text("成功新增產品:\n"
							+ JSON.stringify(data, null, 2));
				},
				error : function(xhr) {
					$("#result3").text("錯誤: " + xhr.responseText);
				}
			});
		}

		// 4. 更新產品
		function updateProduct() {
			const id = $("#updateProductId").val();
			const product = {
				name : $("#updateProductName").val(),
				description : $("#updateProductDesc").val(),
				price : parseFloat($("#updateProductPrice").val()),
				quantity : parseInt($("#updateProductQty").val())
			};

			$.ajax({
				url : API_BASE_URL + "/" + id,
				method : "PUT",
				contentType : "application/json",
				data : JSON.stringify(product),
				success : function(data) {
					$("#result4").text("成功更新產品:\n"
							+ JSON.stringify(data, null, 2));
				},
				error : function(xhr) {
					$("#result4").text("錯誤: " + xhr.responseText);
				}
			});
		}

		// 5. 刪除產品
		function deleteProduct() {
			const id = $("#deleteProductId").val();
			$.ajax({
				url : API_BASE_URL + "/" + id,
				method : "DELETE",
				success : function(data) {
					$("#result5").text("成功: " + data);
				},
				error : function(xhr) {
					$("#result5").text("錯誤: " + xhr.responseText);
				}
			});
		}

		// 6. 搜尋產品
		function searchProducts() {
			const keyword = $("#searchKeyword").val();
			$.ajax({
				url : API_BASE_URL + "/search",
				method : "GET",
				data : {
					keyword : keyword
				},
				success : function(data) {
					$("#result6").text(JSON.stringify(data, null, 2));
				},
				error : function(xhr) {
					$("#result6").text("錯誤: " + xhr.responseText);
				}
			});
		}

		// 7. 價格區間搜尋
		function searchByPriceRange() {
			const min = $("#minPrice").val();
			const max = $("#maxPrice").val();
			$.ajax({
				url : API_BASE_URL + "/price-range",
				method : "GET",
				data : {
					min : min,
					max : max
				},
				success : function(data) {
					$("#result7").text(JSON.stringify(data, null, 2));
				},
				error : function(xhr) {
					$("#result7").text("錯誤: " + xhr.responseText);
				}
			});
		}

		// 8. 取得排序後的產品
		function getSortedProducts() {
			$.ajax({
				url : API_BASE_URL + "/sorted",
				method : "GET",
				success : function(data) {
					$("#result8").text(JSON.stringify(data, null, 2));
				},
				error : function(xhr) {
					$("#result8").text("錯誤: " + xhr.responseText);
				}
			});
		}
	</script>
</body>
</html>
