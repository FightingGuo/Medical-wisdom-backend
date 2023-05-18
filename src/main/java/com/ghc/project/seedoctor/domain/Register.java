package com.ghc.project.seedoctor.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ghc.framework.web.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

/**
 * @Date 2023/3/28 /15:47
 * @Author guohc
 * @Description
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Register extends BaseEntity {

    /**
     * 主键
     */

    private Long id;

    /**
     * 患者姓名
     */
    private String patientName;

    /**
     * 患者id
     */
    private Long patientId;


    /**
     * 挂号的科室id
     */
    private Long deptId;

    /**
     * 科室名称
     */
    private String deptName;

    /**
     * 接诊医生的id
     */
    private Long userId;

    /**
     * 接诊医生的姓名
     */
    private String userName;

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
    private String registerTime;

    /**
     * 挂号类型：0：门诊  1：急诊
     */
    private String registerType;

    /**
     * 挂号时间段 0：上午 1：下午 2：晚上
     */
    private String registerSchedule;
}
