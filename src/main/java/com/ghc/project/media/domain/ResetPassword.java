package com.ghc.project.media.domain;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

/**
 * @Date 2023/1/17 /11:53
 * @Author guohc
 * @Description  批量重置用户密码  （实体接收前端传回的id）
 */
@Data
public class ResetPassword {

    /**
     * 需要重置密码的用户id
     */
    Long[] userIds;

    @NotBlank(message = "密码不能为空")
    @Size(min = 6, max = 20, message = "密码长度不少与6个字符不能超过20个字符")
    String password;
}
