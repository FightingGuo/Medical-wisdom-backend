package com.ghc.project.seedoctor.service.impl;

import com.ghc.project.seedoctor.domain.PatientInfo;
import com.ghc.project.seedoctor.mapper.PatientInfoMapper;
import com.ghc.project.seedoctor.service.PatientInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Date 2023/3/26 /15:27
 * @Author guohc
 * @Description
 */
@Service
public class PatientInfoServiceImpl implements PatientInfoService {

    @Autowired
    private PatientInfoMapper patientInfoMapper;

    @Override
    public List<PatientInfo> getPatient(PatientInfo patientInfo) {
        return patientInfoMapper.getPatient(patientInfo);
    }

    @Override
    public PatientInfo selectPatientInfoByCardId(String cardId) {
        return patientInfoMapper.getPatientInfoByCardID(cardId);
    }

    @Override
    public Long addPatientInfo(PatientInfo patientInfo) {
        return patientInfoMapper.addPatientInfo(patientInfo);
    }
}
