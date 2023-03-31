package com.ghc.project.seedoctor.domain;

import lombok.Data;

import java.math.BigDecimal;

/**
 * @Date 2023/3/31 /11:36
 * @Author guohc
 * @Description
 */
@Data
public class RegisterPrice {
    private Long id;

    private String registerName;

    private BigDecimal registerPrice;
}
