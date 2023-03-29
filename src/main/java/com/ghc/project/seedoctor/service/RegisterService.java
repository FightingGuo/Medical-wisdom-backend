package com.ghc.project.seedoctor.service;

import com.ghc.project.seedoctor.domain.Register;

import java.util.List;

/**
 * @Date 2023/3/28 /15:42
 * @Author guohc
 * @Description
 */
public interface RegisterService {

    List<Register> getRegister(Register register);
}
