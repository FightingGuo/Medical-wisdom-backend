package com.ghc.project.seedoctor.service.impl;

import com.ghc.common.utils.DateUtils;
import com.ghc.framework.web.domain.AjaxResult;
import com.ghc.project.media.domain.MediaUser;
import com.ghc.project.media.domain.MediaUserDTO;
import com.ghc.project.media.mapper.MediaUserMapper;
import com.ghc.project.seedoctor.constant.SeeDoctorConstant;
import com.ghc.project.seedoctor.domain.PatientInfo;
import com.ghc.project.seedoctor.domain.Register;
import com.ghc.project.seedoctor.domain.RegisterPrice;
import com.ghc.project.seedoctor.domain.dto.RegisterDTO;
import com.ghc.project.seedoctor.mapper.PatientInfoMapper;
import com.ghc.project.seedoctor.mapper.RegisterMapper;
import com.ghc.project.seedoctor.service.RegisterService;
import jdk.nashorn.internal.ir.RuntimeNode;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.GregorianCalendar;
import java.util.List;

/**
 * @Date 2023/3/28 /15:42
 * @Author guohc
 * @Description
 */
@Service
@Slf4j
@Transactional
public class RegisterServiceImpl implements RegisterService {

    @Resource
    private RegisterMapper registerMapper;

    //患者mapper
    @Resource
    private PatientInfoMapper patientInfoMapper;

    @Resource
    private MediaUserMapper mediaUserMapper;


    @Override
    public List<Register> getRegister(Register register) {
        return registerMapper.getRegister(register);
    }

    @Override
    public AjaxResult getRegisterPrice(@RequestBody String registerName) {

        RegisterPrice registerPrice = registerMapper.getRegisterPrice(registerName);

        return registerPrice==null ? AjaxResult.error(SeeDoctorConstant.GET_REGISTER_IPRICE_FAIL):AjaxResult.success(registerPrice);
    }

    @Override
    public AjaxResult saveRegister(RegisterDTO register) {
        //患者信息
        PatientInfo patientInfo = register.getPatientInfo();

        //根据身份证查出患者
        PatientInfo patient = patientInfoMapper.getPatientInfoByCardID(patientInfo.getPatientCard());

        try {
            Register addRegister = new Register();
            if (null != patient) {
                //更新患者信息
                patientInfo.setPatientId(patient.getPatientId());
                patientInfoMapper.updatePatientInfo(patientInfo);
                addRegister.setPatientId(patient.getPatientId());
            } else {
                //新增患者信息
                patientInfoMapper.addPatientInfo(patientInfo);
                addRegister.setPatientId(patientInfo.getPatientId());
            }

            addRegister.setRegisterPrice(register.getRegisterPrice());
            addRegister.setRegisterType(register.getRegisterType().equals("门诊")? "0" : "1");
            addRegister.setRegisterTime(DateUtils.getDate());
            int index = new GregorianCalendar().get(GregorianCalendar.AM_PM);
            if(index==0){
                //上午
                addRegister.setRegisterSchedule("0");
            }else{
                //下午
                addRegister.setRegisterSchedule("1");
            }

            //挂号数+1
            MediaUser mediaUser = new MediaUser();
            mediaUser.setCount(register.getCount()+1L);
            mediaUser.setUserId(register.getUserId());
            mediaUserMapper.updateUser(mediaUser);

            addRegister.setDeptId(register.getDeptId());
            addRegister.setDeptName(register.getDeptName());
            addRegister.setUserId(register.getUserId());
            addRegister.setUserName(register.getUserName());


            addRegister.setStatus("2");
            //新增挂号信息
            registerMapper.addRegister(addRegister);
        } catch (Exception e){
            log.error(e.getMessage());
            return AjaxResult.error(e.getMessage());
        }
        return AjaxResult.success();
    }
}
