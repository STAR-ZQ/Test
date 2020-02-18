package service.replay;

import entity.Replay;

import java.util.List;

public interface ReplayService {
    List<Replay> all(Integer invid, Integer curPage, Integer pageSize);

    int totalCount(Integer invid);

    int del(Integer invid);

    int add(Replay r);
}
