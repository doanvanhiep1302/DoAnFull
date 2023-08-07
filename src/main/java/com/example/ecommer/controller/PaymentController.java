package com.example.ecommer.controller;

import com.example.ecommer.config.PaymentConfig;
import com.example.ecommer.dto.request.PaymentDTO;
import com.example.ecommer.dto.response.PaymentResponseDTO;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping(value = "/payment")
@CrossOrigin(origins = "${watch.port}")
public class PaymentController {

    @PostMapping("create_payment")
    public ResponseEntity<?> createPayment(@RequestBody PaymentDTO paymentDTO) throws UnsupportedEncodingException {
        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        Long amount = paymentDTO.getAmountLong() * 100;

        Map vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", PaymentConfig.TMMCOE);
        vnp_Params.put("vnp_Amount",  String.valueOf(amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        vnp_Params.put("vnp_BankCode", "NCB");
        vnp_Params.put("vnp_TxnRef", paymentDTO.getIdOrder() + vnp_CreateDate);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + paymentDTO.getIdOrder() + PaymentConfig.getRandomNumber(8));
        vnp_Params.put("vnp_IpAddr", PaymentConfig.IPDEFAULT);
        vnp_Params.put("vnp_Locale", "vn");
        vnp_Params.put("vnp_ReturnUrl", PaymentConfig.RETURN_URL);
        vnp_Params.put("vnp_OrderType", "20000"); // 20000 = danh muc thoi trang
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = String.valueOf(itr.next());
            String fieldValue = String.valueOf(vnp_Params.get(fieldName));
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = PaymentConfig.hmacSHA512(PaymentConfig.CHECKSUM ,  hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = PaymentConfig.VNPAY_URRL + "?" + queryUrl;
        PaymentResponseDTO result = new PaymentResponseDTO();
        result.setStatus("200");
        result.setMessage("success");
        result.setUrl(paymentUrl);
        return ResponseEntity.status(HttpStatus.OK).body(result);
    }
}
