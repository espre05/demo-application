package com.github.kazuki43zoo.core.config;

import lombok.Data;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
@Data
public class SecurityConfigs {

    @Value("${security.authenticationFailureMaxCount:5}")
    private int authenticationFailureMaxCount;

    @Value("${security.passwordValidDays:90}")
    private int passwordValidDays;

}