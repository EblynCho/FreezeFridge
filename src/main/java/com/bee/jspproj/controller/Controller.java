//package com.bee.jspproj.controller;
//
//import com.bee.jspproj.dto.MovieVO;
//import com.bee.jspproj.service.movieService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.ui.Model;
//import org.springframework.validation.BindingResult;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.multipart.MultipartHttpServletRequest;
//import org.springframework.web.servlet.ModelAndView;
//
//import java.util.List;
//
//@org.springframework.stereotype.Controller
//public class Controller {
//
//    @Autowired
//    private movieService movieService;
//
//    @RequestMapping(value = "/board/list", method = RequestMethod.GET)
//    public String list(@ModelAttribute("movieVO") MovieVO movieVO, Model model) {
//        List<MovieVO> resultList = movieService.getList(movieVO);
//
//        model.addAttribute("resultList", resultList);
//
//        return "/board/list";
//    }
//
////    @RequestMapping("/youtube/createAction.do")
////    public ModelAndView createAction(final MultipartHttpServletRequest multiRequest, @ModelAttribute("movieVO") MovieVO movieVO, BindingResult bindingResult,
////                                     Model model) throws Exception {
////
////        movieVO.setMv_the_origin_url(movieVO.getMv_the_origin_url());
////        movieService.youtubeInsert(movieVO);
////
////        ModelAndView mv = new ModelAndView(returnView + "bsite/youtube/create");
////        return mv;
////    }
//
//}
