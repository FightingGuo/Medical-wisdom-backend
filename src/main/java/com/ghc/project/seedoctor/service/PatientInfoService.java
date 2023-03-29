package com.ghc.project.seedoctor.service;

import com.ghc.project.seedoctor.domain.PatientInfo;

import java.util.List;

/**
 * @Date 2023/3/26 /15:24
 * @Author guohc
 * @Description
 */
public interface PatientInfoService {

    List<PatientInfo> getPatient(PatientInfo patientInfo);

    PatientInfo selectPatientInfoByCardId(String cardId);

    Long addPatientInfo(PatientInfo patientInfo);
}
