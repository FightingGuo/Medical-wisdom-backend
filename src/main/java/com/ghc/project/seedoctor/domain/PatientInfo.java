package com.ghc.project.seedoctor.domain;

import lombok.Data;

import java.util.Date;

/**
 * @Date 2023/3/26 /15:01
 * @Author guohc
 * @Description 患者信息实体类
 */
@Data
public class PatientInfo {
    private Long patientId;

    private String patientName;

    private String patientCard;

    private String sex;

    private String phone;

    private String delFlag;

    private Date birthday;

    private Long age;

    private String addr;

    private String createUser;

    private Date createTime;

    private String updateUser;

    private Date updateTime;
}
