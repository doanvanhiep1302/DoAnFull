package com.example.ecommer.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
public class JwtResponse {

    private String token;

    private Long id;


    private String username;

    private String email;

    private String address;

    private String phoneNumber;

    private String fullName;
    private List<String> roles;

}
