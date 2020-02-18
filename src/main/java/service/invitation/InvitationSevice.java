package service.invitation;

import entity.Invitation;

import java.util.List;

public interface InvitationSevice {
    List<Invitation> all(String title, Integer curPage, Integer pageSize);

    int totalCount(String title);

    int del(Integer id);
}
