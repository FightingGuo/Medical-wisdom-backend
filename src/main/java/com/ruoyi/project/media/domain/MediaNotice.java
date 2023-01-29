package com.ruoyi.project.media.domain;

import com.ruoyi.framework.aspectj.lang.annotation.Excel;
import com.ruoyi.framework.web.domain.BaseEntity;
import lombok.Data;
import org.apache.poi.hpsf.Decimal;

import java.math.BigDecimal;

/**
 * @Date 2023/1/29 /10:28
 * @Author guohc
 * @Description 通知管理
 */
@Data
public class MediaNotice extends BaseEntity {

    /**
     * 公告ID
     */
    @Excel(name = "公告ID")
    private Long noticeId;

    /**
     * 公告标题
     */
    @Excel(name = "公告标题")
    private String noticeTitle;


    /**
     * 删除标准(0存在 2删除)
     */
    private String delFlag;

    /**
     * 公告类型
     */
    @Excel(name = "公告类型")
    private String noticeType;

    /**
     * 状态
     */
    @Excel(name = "状态", readConverterExp = "0=正常,1=停用")
    private String status;

    /**
     * 公告内容
     */
    @Excel(name = "公告内容")
    private String noticeContent;


}
