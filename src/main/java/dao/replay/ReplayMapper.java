package dao.replay;

import entity.Replay;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReplayMapper {
    List<Replay> all(@Param("invid") Integer invid, @Param("curPage") Integer curPage, @Param("pageSize") Integer pageSize);

    int totalCount(@Param("invid") Integer invid);

    int del(@Param("invid") Integer invid);

    int add(@Param("r") Replay r);
}
