package com.ghc.project.media.domain;

import lombok.Data;

/**
 * @Date 2023/3/30 /16:32
 * @Author guohc
 * @Description
 */
@Data
public class MediaUserDTO {

    private Long userId;

    private Long deptId;

    private Long count;

    private String userName;

    private String deptName;
}
