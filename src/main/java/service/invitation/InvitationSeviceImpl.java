package service.invitation;

import dao.invitation.InvitationMapper;
import dao.replay.ReplayMapper;
import entity.Invitation;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Transactional
@Service
public class InvitationSeviceImpl implements InvitationSevice {
    @Resource
    private InvitationMapper invitationMapper;
    @Resource
    private ReplayMapper replayMapper;

    @Override
    public List<Invitation> all(String title, Integer curPage, Integer pageSize) {
        return invitationMapper.all(title, curPage, pageSize);
    }

    @Override
    public int totalCount(String title) {
        return invitationMapper.totalCount(title);
    }

    @Transactional
    @Override
    public int del(Integer id) {
        if (replayMapper.del(id) > 0 || replayMapper.all(id, 1, 4).size() == 0) {
            if (invitationMapper.del(id) > 0) {
                return 1;
            }
        }
        return 0;
//        return invitationMapper.del(id);
    }
}
