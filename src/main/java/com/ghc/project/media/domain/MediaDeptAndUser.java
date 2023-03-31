package com.ghc.project.media.domain;

import lombok.Data;

import java.util.LinkedList;
import java.util.List;

/**
 * @Date 2023/3/30 /16:18
 * @Author guohc
 * @Description
 */
@Data
public class MediaDeptAndUser extends MediaDeptList{

    private List<MediaUserList> mediaUserLists;

    {
        mediaUserLists = new LinkedList<>();
    }
}
