package com.example.ecommer.service.impl;

import com.example.ecommer.model.CustomerOrder;
import com.example.ecommer.model.OrderHistory;
import com.example.ecommer.repository.CustomerOrderRepository;
import com.example.ecommer.repository.OrderHistoryRepository;
import com.example.ecommer.repository.ProductRepository;
import com.example.ecommer.service.OrderHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderHistoryServiceImpl implements OrderHistoryService {

    @Autowired
    private OrderHistoryRepository orderHistoryRepository;

    @Autowired
    private CustomerOrderRepository customerOrderRepository;
    @Autowired
    private ProductRepository productRepository;

    @Override
    public List<OrderHistory> orderHistoryList() {
        return orderHistoryRepository.findAll();
    }

    @Override
    public OrderHistory save(OrderHistory orderHistory) {
        OrderHistory newOrderHistory = new OrderHistory();
//        if(orderHistory.getCustomerOrderId() != null)
//        {
//            Optional<CustomerOrder> orderHistoryExit = customerOrderRepository.findById(orderHistory.getCustomerOrderId());
//            if(orderHistoryExit.isPresent()) {
//                newOrderHistory.setCustomerOrder(orderHistoryExit.get());
//            }
//        }
//        newOrderHistory.setDate(orderHistory.getDate());
        return orderHistoryRepository.save(newOrderHistory);
    }

    @Override
    public OrderHistory update(OrderHistory orderHistory) {
        return new OrderHistory();

    }

    @Override
    public void delete(OrderHistory orderHistory) {
        Optional<OrderHistory> dataOrderHistory = orderHistoryRepository.findById(orderHistory.getId());
        Optional<CustomerOrder> customerOrder = customerOrderRepository.findById(dataOrderHistory.get().getCustomerOrder().getId());
        if (customerOrder.isPresent()) {
            customerOrder.get().getCustomerOrderDetails().forEach(item -> {
                item.getProduct().setTotal(item.getProduct().getTotal() + item.getQuantity());
                productRepository.save(item.getProduct());
                orderHistoryRepository.deleteById(orderHistory.getId());
            });
        }
    }


}
