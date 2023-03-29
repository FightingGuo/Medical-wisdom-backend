package com.ghc.project.seedoctor.controlller;

import com.ghc.framework.web.controller.BaseController;
import com.ghc.framework.web.page.TableDataInfo;
import com.ghc.project.seedoctor.domain.PatientInfo;
import com.ghc.project.seedoctor.domain.Register;
import com.ghc.project.seedoctor.service.RegisterService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @Date 2023/3/26 /20:19
 * @Author guohc
 * @Description
 */
@Api("挂号列表")
@RequestMapping("/seedoctor/register")
public class RegisterController extends BaseController {

    @Autowired
    private RegisterService registerService;

    /**
     * 挂号列表信息
     *
     * @param register
     * @return
     */
    @PreAuthorize("@ss.hasPermi('seedoctor:register:getRegister')")
    @GetMapping("/list")
    @ApiOperation("获取挂号列表信息")
   public TableDataInfo getPatientInfoList(Register register) {
        startPage();
        List<Register> resList = registerService.getRegister(register);
        return getDataTable(resList);
    }



}
