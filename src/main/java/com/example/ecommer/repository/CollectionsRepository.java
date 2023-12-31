package com.example.ecommer.repository;

import com.example.ecommer.model.Collections;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CollectionsRepository extends JpaRepository<Collections, Long> {

    Optional<Collections> findById(long id);

    List<Collections> findByCategoryId(Long categoryId);

    boolean existsCollectionsByNameAndCategoryId(String name, Long categoryId);
}
