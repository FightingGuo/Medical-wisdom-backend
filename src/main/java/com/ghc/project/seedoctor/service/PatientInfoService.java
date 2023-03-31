package com.ghc.project.seedoctor.service;

import com.ghc.framework.web.domain.AjaxResult;
import com.ghc.project.seedoctor.domain.PatientInfo;

import java.util.List;

/**
 * @Date 2023/3/26 /15:24
 * @Author guohc
 * @Description
 */
public interface PatientInfoService {

    List<PatientInfo> getPatient(PatientInfo patientInfo);

    AjaxResult selectPatientInfoByCardId(String patientCard);

    AjaxResult addPatientInfo(PatientInfo patientInfo);
}
