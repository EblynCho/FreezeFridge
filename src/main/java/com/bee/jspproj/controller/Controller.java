package com.bee.jspproj.controller;

import com.bee.jspproj.dto.MovieVO;
import com.bee.jspproj.service.movieService;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@org.springframework.stereotype.Controller
public class Controller {


    @RequestMapping("/youtube/createAction.do")
    public ModelAndView createAction(final MultipartHttpServletRequest multiRequest, @ModelAttribute("movieVO") MovieVO movieVO, BindingResult bindingResult,
                                     Model model) throws Exception {

        movieVO.setMv_the_origin_url(movieVO.getMv_the_origin_url());
        movieService.youtubeInsert(movieVO);

        ModelAndView mv = new ModelAndView(returnView + "bsite/youtube/create");
        return mv;
    }

}
