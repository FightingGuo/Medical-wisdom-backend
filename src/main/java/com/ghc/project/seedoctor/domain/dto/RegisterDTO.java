package com.ghc.project.seedoctor.domain.dto;

import com.ghc.project.media.domain.MediaUserDTO;
import com.ghc.project.seedoctor.domain.PatientInfo;
import lombok.Data;

import java.math.BigDecimal;


/**
 * @author 郭昊晨
 * @version 1.0
 * 2023/5/16 - 17:22
 */
@Data
public class RegisterDTO extends MediaUserDTO{

    private PatientInfo patientInfo;

    private BigDecimal registerPrice;

    private String registerType;
}
