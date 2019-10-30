package cn.shendu.controller;

import cn.shendu.domain.MedInformation;
import cn.shendu.service.MedInfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/medInfs")
public class MedInfController {

    @Autowired
    private MedInfService medInfService;

    @RequestMapping("/findAll.do")
    public ModelAndView findAll()throws Exception{
        ModelAndView mv = new ModelAndView();
        List<MedInformation> medinf = medInfService.findAll();
        mv.addObject("MedInfList",medinf);
        mv.setViewName("medinf-list");
        return mv;
    }
}
