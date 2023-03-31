package com.ghc.project.seedoctor.service.impl;

import com.ghc.framework.web.domain.AjaxResult;
import com.ghc.project.seedoctor.constant.SeeDoctorConstant;
import com.ghc.project.seedoctor.domain.Register;
import com.ghc.project.seedoctor.domain.RegisterPrice;
import com.ghc.project.seedoctor.mapper.PatientInfoMapper;
import com.ghc.project.seedoctor.mapper.RegisterMapper;
import com.ghc.project.seedoctor.service.RegisterService;
import jdk.nashorn.internal.ir.RuntimeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

    @Override
    public AjaxResult getRegisterPrice(@RequestBody String registerName) {

        RegisterPrice registerPrice = registerMapper.getRegisterPrice(registerName);

        return registerPrice==null ? AjaxResult.error(SeeDoctorConstant.GET_REGISTER_IPRICE_FAIL):AjaxResult.success(registerPrice);
    }

}
