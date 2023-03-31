package com.ghc.project.seedoctor.service.impl;

import com.ghc.framework.web.domain.AjaxResult;
import com.ghc.project.seedoctor.constant.SeeDoctorConstant;
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
    public AjaxResult selectPatientInfoByCardId(String patientCard) {
        PatientInfo patientInfoByCardID = patientInfoMapper.getPatientInfoByCardID(patientCard);

        return patientInfoByCardID==null ? AjaxResult.error(SeeDoctorConstant.GET_PATIENT_INFO_FAIL):AjaxResult.success(patientInfoByCardID);

    }

    @Override
    public AjaxResult addPatientInfo(PatientInfo patientInfo) {
        Long res = patientInfoMapper.addPatientInfo(patientInfo);

        return res == 0 ? AjaxResult.error(SeeDoctorConstant.ADD_PATIENT_INFO_FAIL):AjaxResult.success();
    }
}
