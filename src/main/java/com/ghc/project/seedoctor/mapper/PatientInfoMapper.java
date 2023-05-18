package com.ghc.project.seedoctor.mapper;

import com.ghc.project.seedoctor.domain.PatientInfo;

import java.util.List;

/**
 * @Date 2023/3/26 /15:29
 * @Author guohc
 * @Description
 */
public interface PatientInfoMapper {

    List<PatientInfo> getPatient(PatientInfo patientInfo);

    PatientInfo getPatientInfoByCardID(String patientCard);

    Long addPatientInfo(PatientInfo patientInfo);

    Long updatePatientInfo(PatientInfo patientInfo);
}
