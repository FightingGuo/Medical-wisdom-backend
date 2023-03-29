package com.ghc.project.seedoctor.mapper;

import com.ghc.project.seedoctor.domain.Register;

import java.util.List;

/**
 * @Date 2023/3/28 /16:16
 * @Author guohc
 * @Description
 */
public interface RegisterMapper {
    List<Register> getRegister(Register register);
}
