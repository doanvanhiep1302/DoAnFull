package com.example.ecommer.model;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.experimental.Accessors;
import org.hibernate.annotations.UpdateTimestamp;

import javax.persistence.*;
import java.util.Date;

@Table(name = "product-history")
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class ProductHistory {

    public Object getProductId;
    public Object getTotalOld;
    public Object getTotalNow;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @Column(name = "product_id")
    private Long productId;

    @Column(name = "total_old")
    private Long totalOld;

    @Column(name = "total_now")
    private Long totalNow;

    @Column(name = "update_time")
    @UpdateTimestamp
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    public void setProductId(Object getProductId) {
    }

    public void setTotalNow(Object getTotalNow) {
    }

    public void setTotalOld(Object getTotalOld) {
    }
}
