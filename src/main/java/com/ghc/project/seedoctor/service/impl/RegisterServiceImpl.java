package com.ghc.project.seedoctor.service.impl;

import com.ghc.project.seedoctor.domain.Register;
import com.ghc.project.seedoctor.mapper.PatientInfoMapper;
import com.ghc.project.seedoctor.mapper.RegisterMapper;
import com.ghc.project.seedoctor.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Date 2023/3/28 /15:42
 * @Author guohc
 * @Description
 */
@Service
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    private RegisterMapper registerMapper;

    @Autowired
    private PatientInfoMapper patientInfoMapper;


    @Override
    public List<Register> getRegister(Register register) {
        return registerMapper.getRegister(register);
    }
    
}
