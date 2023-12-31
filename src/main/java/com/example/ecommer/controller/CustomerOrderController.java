package com.example.ecommer.controller;

import com.example.ecommer.constant.ErrorCode;
import com.example.ecommer.dto.ApiResponse;
import com.example.ecommer.dto.request.AddToCartRequest;
import com.example.ecommer.dto.request.PaymentDTO;
import com.example.ecommer.exception.CustomException;
import com.example.ecommer.repository.CustomerOrderRepository;
import com.example.ecommer.repository.OrderHistoryRepository;
import com.example.ecommer.service.impl.CustomerOrderServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.transaction.Transactional;

@RestController
@RequestMapping("order")
@CrossOrigin(origins = "${watch.port}")
@Transactional
public class CustomerOrderController {

    @Autowired
    private CustomerOrderServiceImpl customerOrderService;

    @Autowired
    private CustomerOrderRepository customerOrderRepository;

    @Autowired
    OrderHistoryRepository orderHistoryRepository;

    @GetMapping("/find-order-active-by-user")
//    @PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
    public ResponseEntity<ApiResponse> listOrderActiveByUser(@RequestParam(value = "userId", required = false) Long userId,
                                                             @RequestParam(value = "isPaid", required = false) Boolean isPaid) {
        ApiResponse response;
        try {
            response = new ApiResponse(customerOrderService.findByUserAndStatus(userId, isPaid));
        } catch (CustomException e) {
            response = new ApiResponse(e);
        } catch (Exception e) {
            response = new ApiResponse(ErrorCode.API_FAIL_UNKNOW);
        }
        return ResponseEntity.ok(response);
    }

    @GetMapping("/get-details")
//    @PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
    public ResponseEntity<ApiResponse> getDetails(@RequestParam(name = "order_id") Long orderId) {
        ApiResponse response;
        try {
            response = new ApiResponse(customerOrderService.findById(orderId));
        } catch (CustomException e) {
            response = new ApiResponse(e);
        } catch (Exception e) {
            response = new ApiResponse(ErrorCode.API_FAIL_UNKNOW);
        }
        return ResponseEntity.ok(response);
    }

    @PostMapping("/add")
    public ResponseEntity<ApiResponse> addOrder(@RequestBody AddToCartRequest addToCartRequest) {
        ApiResponse response;
        try {
            response = new ApiResponse(customerOrderService.addToCard(addToCartRequest));
        } catch (CustomException e) {
            response = new ApiResponse(e);
        }
        return ResponseEntity.ok(response);
    }

    @PostMapping("/update-status")
    public ResponseEntity<ApiResponse> updateStatus(@RequestBody AddToCartRequest addToCartRequest) {
        ApiResponse response;
        try {
            response = new ApiResponse(customerOrderService.updateStatus(addToCartRequest));
        } catch (CustomException e) {
            response = new ApiResponse(e);
        }
        return ResponseEntity.ok(response);
    }

    @PostMapping("/update")
//    @PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
    public ResponseEntity<ApiResponse> updateUser(@RequestBody AddToCartRequest addToCartRequest) {
        ApiResponse response;
        try {
            response = new ApiResponse(customerOrderService.updateCard(addToCartRequest));
//            response = new ApiResponse(ErrorCode.SUCCESS);
        } catch (CustomException e) {
            response = new ApiResponse(e);
        }
        return ResponseEntity.ok(response);
    }

    @GetMapping("/delete-detail")
//    @PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
    public ResponseEntity<ApiResponse> deleteOrderDetail(@RequestParam(name = "id") Long id) {
        ApiResponse response;
        try {
            customerOrderService.deleteCustomerOrderDetail(id);
            response = new ApiResponse(ErrorCode.SUCCESS);
        } catch (CustomException e) {
            response = new ApiResponse(e);
        }
        return ResponseEntity.ok(response);
    }

    @GetMapping("/find-by-user")
//    @PreAuthorize("hasRole('USER') or hasRole('ADMIN')")
    public ResponseEntity<ApiResponse> findByUser(@RequestParam(name = "userId") Long userId, @RequestParam(name = "isPaid", defaultValue = "true") Boolean isPaid,
                                                  @RequestParam(name = "pageNo") Integer pageNo,
                                                  @RequestParam(name = "pageSize") Integer pageSize) {
        ApiResponse response;
        try {
            response = new ApiResponse(customerOrderService.findByUserAndStatus(userId, isPaid));
        } catch (CustomException e) {
            response = new ApiResponse(e);
        }
        return ResponseEntity.ok(response);
    }


    @PostMapping("/payment")
    public ResponseEntity<ApiResponse> paymentCustomerOrder(@RequestBody PaymentDTO customerOrder) {
        ApiResponse response;
        try {
            customerOrderService.paymentCustomerOrder(customerOrder);
            response = new ApiResponse(ErrorCode.SUCCESS);
        } catch (CustomException e) {
            response = new ApiResponse(e);
        }
        return ResponseEntity.ok(response);
    }

}
