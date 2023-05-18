package com.ghc.project.seedoctor.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.ghc.framework.web.domain.BaseEntity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Date;

/**
 * @Date 2023/3/26 /15:01
 * @Author guohc
 * @Description 患者信息实体类
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class PatientInfo extends BaseEntity {
    /**
     * 主键id
     */
    private Long patientId;

    /**
     * 患者姓名
     */
    @NotBlank
    private String patientName;

    /**
     * 身份证号
     */
    @NotBlank(message = "身份证号不能为空")
    @Size(max = 18,message = "身份证号不能超过18位")
    private String patientCard;

    /**
     * 性别
     */
    private String sex;

    /**
     * 电话
     */
    @NotBlank(message = "手机号不能为空")
    @Size(max = 11,message = "手机号不能超过11位")
    private String phone;

    /**
     * 删除标志
     */
    private String delFlag;

    /**
     * 出生年月
     */
    private String birthday;

    /**
     * 年龄
     */
    private Long age;

    /**
     * 地址
     */
    private String addr;
}
