package com.ghc.project.seedoctor.controlller;

import com.ghc.framework.web.controller.BaseController;
import com.ghc.framework.web.domain.AjaxResult;
import com.ghc.framework.web.page.TableDataInfo;
import com.ghc.project.seedoctor.domain.PatientInfo;
import com.ghc.project.seedoctor.service.PatientInfoService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.constraints.NotBlank;
import java.util.List;

/**
 * @Date 2023/3/26 /15:17
 * @Author guohc
 * @Description
 */
@Api("患者信息")
@RequestMapping("/seedoctor/patient")
@RestController
public class PatentInfoController extends BaseController {

    @Autowired
    private PatientInfoService patientInfoService;

    /**
     * 获取患者信息
     *
     * @param patientInfo
     * @return
     */
//    @PreAuthorize("@ss.hasPermi('seedoctor:patient:getPatientInfo')")
    @GetMapping("/list")
    @ApiOperation("获取患者信息")
    public TableDataInfo getPatientInfoList(PatientInfo patientInfo) {
        startPage();
        List<PatientInfo> patient = patientInfoService.getPatient(patientInfo);
        return getDataTable(patient);
    }

    /**
     * 根据身份证获取患者信息
     *
     * @param patientCard
     * @return
     */
//    @PreAuthorize("@ss.hasPermi('seedoctor:patient:getPatientInfo')")
    @GetMapping(value = "/{patientCard}")
    @ApiOperation("根据身份证获取患者信息")
    public AjaxResult getInfo(@PathVariable String patientCard) {

        return patientInfoService.selectPatientInfoByCardId(patientCard);
    }

    /**
     * 处理前端传空串
     * @return
     */
    @GetMapping
    @ApiOperation("根据身份证获取患者信息")
    public AjaxResult getInfo1() {
        return getInfo("");
    }

    /**
     * 新增患者信息
     *
     * @param patientInfo
     * @return
     */
//    @PreAuthorize("@ss.hasPermi('seedoctor:patient:list')")
    @PostMapping
    @ApiOperation("新增患者信息")
    public AjaxResult addInfo(@Validated @RequestBody PatientInfo patientInfo) {
        return AjaxResult.success(patientInfoService.addPatientInfo(patientInfo));
    }
}
