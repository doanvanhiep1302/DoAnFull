package com.example.ecommer.repository;

import com.example.ecommer.model.CustomerOrder;
import com.example.ecommer.model.OrderHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface OrderHistoryRepository extends JpaRepository<OrderHistory, Long> {

    Optional<OrderHistory> findByCustomerOrder(CustomerOrder customerOrder);

//    @Query(value = "SELECT * FROM order_history",  nativeQuery = true)
//    List<OrderHistory> find;

}
