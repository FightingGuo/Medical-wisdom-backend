package com.ghc.project.seedoctor.domain.dto;

import io.swagger.annotations.ApiModel;
import lombok.Data;

/**
 * @Date 2023/3/30 /13:47
 * @Author guohc
 * @Description
 */
public class GetByPatientCardDTO {

    @Data
    @ApiModel(value = "获取患者信息传入参数" ,description = "")
    public static class In {

    }

    @Data
    @ApiModel(value = "" ,description = "")
    public static class Out {

    }
}
