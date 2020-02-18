package controller;

import entity.Invitation;
import entity.Replay;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import service.invitation.InvitationSevice;
import service.replay.ReplayService;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class InvitationController {
    @Resource
    private InvitationSevice iService;
    @Resource
    private ReplayService rService;

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(String title, Integer curPage, Integer pageSize, Model model) {
        if (curPage == null) {
            curPage = 1;
        }
        pageSize = 4;
        int totalCount = iService.totalCount(title);
        int totalPageCount = totalCount % pageSize == 0 ? totalCount / pageSize : totalCount / pageSize + 1;
        if (totalCount == 0) totalPageCount = 1;
        if (curPage < 1) curPage = 1;
        if (curPage > totalPageCount) curPage = totalPageCount;
        List<Invitation> all = iService.all(title, (curPage - 1) * pageSize, pageSize);
        model.addAttribute("curPage", curPage);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("list", all);
        model.addAttribute("title", title);
        return "index";
    }

    @RequestMapping(value = "/index", method = RequestMethod.POST)
    public String index1(String title, Integer curPage, Integer pageSize, Model model) {
        if (curPage == null) {
            curPage = 1;
        }
        pageSize = 4;
        int totalCount = iService.totalCount(title);
        int totalPageCount = totalCount % pageSize == 0 ? totalCount / pageSize : totalCount / pageSize + 1;
        if (curPage < 1) curPage = 1;
        if (totalCount == 0) totalPageCount = 1;
        if (curPage > totalPageCount) curPage = totalPageCount;
        List<Invitation> all = iService.all(title, (curPage - 1) * pageSize, pageSize);
        model.addAttribute("curPage", curPage);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("list", all);
        model.addAttribute("title", title);
        return "index";
    }

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public String view(Integer invid, Integer pageNo, Integer pageSize, Model model) {
        if (pageNo == null) {
            pageNo = 1;
        }
        pageSize = 4;
        int totalCount = rService.totalCount(invid);
        int totalPageCount = totalCount % pageSize == 0 ? totalCount / pageSize : totalCount / pageSize + 1;
        if (pageNo < 1) pageNo = 1;
        if (totalCount == 0) totalPageCount = 1;
        if (pageNo > totalPageCount) pageNo = totalPageCount;
        List<Replay> list = rService.all(invid, (pageNo - 1) * pageSize, pageSize);
        model.addAttribute("pageNo", pageNo);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("list", list);
        model.addAttribute("invid", invid);
        return "view";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String add(@ModelAttribute Replay replay, Integer invid, Model model) {
        model.addAttribute("invid", invid);
        return "add";
    }

    @RequestMapping(value = "/addSave", method = RequestMethod.POST)
    @ResponseBody
    public String addSave(@RequestBody Replay replay, Integer invid, Model model) {
        if (rService.add(replay) > 0) {
//            model.addAttribute("invid", invid);
//            return "forward:/view";
            return "true";
        }
        return "false";
    }

    @RequestMapping(value = "/del/{id}", method = RequestMethod.POST)
    @ResponseBody
    public String del(@PathVariable Integer id) {
        if (iService.del(id) > 0) {
            return "true";
        }
        return "false";
    }

}

