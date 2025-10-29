package com.infotran.springboot.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.infotran.springboot.model.Product;
import com.infotran.springboot.service.ProductService;

@RestController
@RequestMapping("/api/products")
public class ProductRestController {

	@Autowired
	private ProductService productService;

	/**
	 * 取得所有產品
	 * GET http://localhost:9090/springapp/api/products
	 */
	@GetMapping
	public ResponseEntity<List<Product>> getAllProducts() {
		List<Product> products = productService.getAllProducts();
		return ResponseEntity.ok(products);
	}

	/**
	 * 根據 ID 取得單一產品
	 * GET http://localhost:9090/springapp/api/products/1
	 */
	@GetMapping("/{id}")
	public ResponseEntity<?> getProductById(@PathVariable Long id) {
		Optional<Product> product = productService.getProductById(id);
		if (product.isPresent()) {
			return ResponseEntity.ok(product.get());
		} else {
			return ResponseEntity.status(HttpStatus.NOT_FOUND)
					.body("找不到 ID 為 " + id + " 的產品");
		}
	}

	/**
	 * 新增產品
	 * POST http://localhost:9090/springapp/api/products
	 * Body (JSON):
	 * {
	 *   "name": "筆記型電腦",
	 *   "description": "高效能筆記型電腦",
	 *   "price": 25000.0,
	 *   "quantity": 10
	 * }
	 */
	@PostMapping
	public ResponseEntity<Product> createProduct(@RequestBody Product product) {
		Product createdProduct = productService.createProduct(product);
		return ResponseEntity.status(HttpStatus.CREATED).body(createdProduct);
	}

	/**
	 * 更新產品
	 * PUT http://localhost:9090/springapp/api/products/1
	 * Body (JSON):
	 * {
	 *   "name": "筆記型電腦 (更新)",
	 *   "description": "高效能筆記型電腦 (升級版)",
	 *   "price": 28000.0,
	 *   "quantity": 15
	 * }
	 */
	@PutMapping("/{id}")
	public ResponseEntity<?> updateProduct(@PathVariable Long id, @RequestBody Product productDetails) {
		try {
			Product updatedProduct = productService.updateProduct(id, productDetails);
			return ResponseEntity.ok(updatedProduct);
		} catch (RuntimeException e) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
		}
	}

	/**
	 * 刪除產品
	 * DELETE http://localhost:9090/springapp/api/products/1
	 */
	@DeleteMapping("/{id}")
	public ResponseEntity<?> deleteProduct(@PathVariable Long id) {
		try {
			productService.deleteProduct(id);
			return ResponseEntity.ok("產品已成功刪除");
		} catch (RuntimeException e) {
			return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
		}
	}

	/**
	 * 根據關鍵字搜尋產品
	 * GET http://localhost:9090/springapp/api/products/search?keyword=筆記
	 */
	@GetMapping("/search")
	public ResponseEntity<List<Product>> searchProducts(@RequestParam String keyword) {
		List<Product> products = productService.searchProducts(keyword);
		return ResponseEntity.ok(products);
	}

	/**
	 * 根據價格區間搜尋產品
	 * GET http://localhost:9090/springapp/api/products/price-range?min=1000&max=30000
	 */
	@GetMapping("/price-range")
	public ResponseEntity<List<Product>> searchProductsByPriceRange(
			@RequestParam Double min,
			@RequestParam Double max) {
		List<Product> products = productService.searchProductsByPriceRange(min, max);
		return ResponseEntity.ok(products);
	}

	/**
	 * 取得所有產品（依名稱排序）
	 * GET http://localhost:9090/springapp/api/products/sorted
	 */
	@GetMapping("/sorted")
	public ResponseEntity<List<Product>> getAllProductsSorted() {
		List<Product> products = productService.getAllProductsSortedByName();
		return ResponseEntity.ok(products);
	}
}
