package com.infotran.springboot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infotran.springboot.model.Product;
import com.infotran.springboot.repository.ProductRepository;

@Service
public class ProductService {

	@Autowired
	private ProductRepository productRepository;

	// 取得所有產品
	public List<Product> getAllProducts() {
		return productRepository.findAll();
	}

	// 根據 ID 取得產品
	public Optional<Product> getProductById(Long id) {
		return productRepository.findById(id);
	}

	// 新增產品
	public Product createProduct(Product product) {
		return productRepository.save(product);
	}

	// 更新產品
	public Product updateProduct(Long id, Product productDetails) {
		Optional<Product> optionalProduct = productRepository.findById(id);

		if (optionalProduct.isPresent()) {
			Product product = optionalProduct.get();
			product.setName(productDetails.getName());
			product.setDescription(productDetails.getDescription());
			product.setPrice(productDetails.getPrice());
			product.setQuantity(productDetails.getQuantity());
			return productRepository.save(product);
		} else {
			throw new RuntimeException("找不到 ID 為 " + id + " 的產品");
		}
	}

	// 刪除產品
	public void deleteProduct(Long id) {
		if (productRepository.existsById(id)) {
			productRepository.deleteById(id);
		} else {
			throw new RuntimeException("找不到 ID 為 " + id + " 的產品");
		}
	}

	// 根據關鍵字搜尋產品
	public List<Product> searchProducts(String keyword) {
		return productRepository.findByNameContaining(keyword);
	}

	// 根據價格區間搜尋產品
	public List<Product> searchProductsByPriceRange(Double minPrice, Double maxPrice) {
		return productRepository.findByPriceBetween(minPrice, maxPrice);
	}

	// 取得所有產品（依名稱排序）
	public List<Product> getAllProductsSortedByName() {
		return productRepository.findAllByOrderByNameAsc();
	}
}
