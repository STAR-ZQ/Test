package dao.invitation;

import entity.Invitation;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface InvitationMapper {
    List<Invitation> all(@Param("title") String title, @Param("curPage") Integer curPage, @Param("pageSize") Integer pageSize);

    int totalCount(@Param("title") String title);

    int del(@Param("id") Integer id);
}
