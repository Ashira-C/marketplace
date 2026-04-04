package com.marketplace.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.marketplace.backend.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Long> {
}
