package com.ghc.project.seedoctor.controlller;

import com.ghc.framework.web.controller.BaseController;
import com.ghc.framework.web.domain.AjaxResult;
import com.ghc.framework.web.page.TableDataInfo;
import com.ghc.project.seedoctor.domain.Register;
import com.ghc.project.seedoctor.domain.dto.RegisterDTO;
import com.ghc.project.seedoctor.service.RegisterService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @Date 2023/3/26 /20:19
 * @Author guohc
 * @Description
 */
@Api("挂号列表")
@RequestMapping("/seedoctor/register")
@RestController
public class RegisterController extends BaseController {

    @Autowired
    private RegisterService registerService;

    /**
     * 挂号列表信息
     *
     * @param register
     * @return
     */
    @GetMapping("/list")
    @ApiOperation("获取挂号列表信息")
    public TableDataInfo getPatientInfoList(Register register) {
        startPage();
        List<Register> resList = registerService.getRegister(register);
        return getDataTable(resList);
    }

    @PostMapping("/price")
    @ApiOperation("获取挂号类型价格")
    public AjaxResult getRegisterPrice(@RequestBody String registerName) {

        return registerService.getRegisterPrice(registerName);
    }

    @PostMapping
    @ApiOperation("新增挂号信息")
    public AjaxResult saveRegister(@RequestBody RegisterDTO register) {
        return AjaxResult.success(registerService.saveRegister(register));
    }
}
