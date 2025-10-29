package com.infotran.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.infotran.springboot.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

	// Spring Data JPA 會自動實作基本的 CRUD 方法：
	// - save()
	// - findById()
	// - findAll()
	// - deleteById()
	// - count()
	// 等等...

	// 自訂查詢方法：根據產品名稱搜尋
	List<Product> findByNameContaining(String keyword);

	// 自訂查詢方法：根據價格區間搜尋
	List<Product> findByPriceBetween(Double minPrice, Double maxPrice);

	// 自訂查詢方法：根據名稱排序
	List<Product> findAllByOrderByNameAsc();
}
