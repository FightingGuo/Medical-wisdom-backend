package com.ghc.project.seedoctor.domain;

import lombok.Data;

import java.math.BigDecimal;
import java.sql.Timestamp;

/**
 * @Date 2023/3/28 /15:47
 * @Author guohc
 * @Description
 */
@Data
public class Register {

    /**
     * 流水号
     */
    private Long id;

    /**
     * 患者姓名
     */
    private Long patientName;

    /**
     * 挂号的科室id
     */
    private Long deptId;

    /**
     * 挂号费用
     */
    private BigDecimal registerPrice;

    /**
     * 挂号状态 0：就诊完成 1：就诊中 2：未就诊
     */
    private String status;

    /**
     * 挂号时间
     */
    private Timestamp registerTime;

    /**
     * 挂号类型：0：门诊  1：急诊
     */
    private String registerType;

    /**
     * 挂号时间段 0：上午 1：下午 2：晚上
     */
    private String registerSchedule;
}
