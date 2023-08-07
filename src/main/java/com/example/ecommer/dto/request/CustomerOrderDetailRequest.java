package com.example.ecommer.dto.request;

import com.example.ecommer.model.CustomerOrder;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class CustomerOrderDetailRequest {

    private CustomerOrder orderId;

    private Float price = 0.0f;

    private Float priceRef = 0.0f;

    private Long quantity;

    private Long total = 0L;

    private Long status;

    @Fetch(FetchMode.JOIN)
    private Long productId;
}
