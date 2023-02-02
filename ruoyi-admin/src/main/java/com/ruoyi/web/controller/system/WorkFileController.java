package com.ruoyi.web.controller.system;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.service.*;
import com.ruoyi.common.utils.RedisUtil;
import com.ruoyi.common.utils.ResponseMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.io.File;
import java.util.List;
import java.util.UUID;

/**
 * 上传，下载，管理文件类
 */

@Controller
@PropertySource("classpath:file.properties")
@RequestMapping("/system/workfile")
public class WorkFileController extends BaseController {
    @Autowired
    private WorkFileService workFileService;

    @Autowired
    private RedisUtil redisUtil;
    @Autowired
    private IActivityService activityService;

    @Autowired
    private CompetitionService competitionService;

    @Autowired
    private TeamService teamService;
    //抽取上传路径

    @Autowired
    private IUserActivityService userActivityService;
    @Autowired
    private ITeamActivityService teamActivityService;
    @Value("${filePath}")
    private String filePath;


    /**
     * 校验上传zuopin的文件，进行保存或修改
     */
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public @ResponseBody
    ResponseMessage uploadFile(MultipartFile workfile,String activityId) throws IOException {

        //设置文件保存路径
        final String path = filePath + activityId + "/";
        Activity activity =  activityService.selectActivityByActivityId(activityId);
        String competitionId = activity.getCompetitionId();
        Long userId = getLoginUser().getUserId();
        Competition competition = competitionService.findCompetitionById(competitionId);
        try {
            if(competition.getCompetitionPeopleSum()==1){
                String fileName = workfile.getOriginalFilename();
                //封装文件对象
                File file = new File(path, fileName);
                com.ruoyi.system.domain.WorkFile f = new com.ruoyi.system.domain.WorkFile();
                f.setFileId(UUID.randomUUID().toString());
                f.setFileName(fileName);
                f.setFilePath(path + fileName);
            //判断文件夹是否存在，如果不存在则创建
                if (!file.exists()) {
                    if (!file.getParentFile().exists()) {
                        file.getParentFile().mkdirs();
                    }
                    file.createNewFile();
                }
                try {
                    // 文件写入
                    workfile.transferTo(file);

                    //文件保存至数据库
                    workFileService.insertFile(f);
                    UserActivity userActivity = new UserActivity();
                    userActivity.setUserId(userId);
                    userActivity.setActivityId(activityId);
                    userActivity.setFileId(f.getFileId());
                    userActivityService.updateUserActivity(userActivity);
                } catch (Exception e) {
                    e.printStackTrace();
                    return new ResponseMessage("0", "上传失败");
                }
                return new ResponseMessage("1", "上传成功");
            }else{
                Team team = teamService.findTeamByCaptainIdAndCompetitionId(userId,competitionId);
                String teamId = team.getTeamId();
                String fileName = workfile.getOriginalFilename();

                //封装文件对象
                File file = new File(path, fileName);
                com.ruoyi.system.domain.WorkFile f = new com.ruoyi.system.domain.WorkFile();
                f.setFileId(UUID.randomUUID().toString());
                f.setFileName(fileName);
                f.setFilePath(path + fileName);
                //判断文件夹是否存在，如果不存在则创建
                if (!file.exists()) {
                    if (!file.getParentFile().exists()) {
                        file.getParentFile().mkdirs();
                    }
                    file.createNewFile();
                }
                try {
                    // 文件写入
                    workfile.transferTo(file);

                    //文件保存至数据库
                    workFileService.insertFile(f);
                    TeamActivity teamActivity = new TeamActivity();
                    teamActivity.setTeamId(teamId);
                    teamActivity.setActivityId(activityId);
                    teamActivity.setFileId(f.getFileId());
                    teamActivityService.updateTeamActivity(teamActivity);
                } catch (Exception e) {
                    e.printStackTrace();
                    return new ResponseMessage("0", "上传失败");
                }
                return new ResponseMessage("1", "上传成功");

            }
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "上传失败");
        }

    }


    /**
     * 删除文件
     */
    @RequestMapping(value = "/deleteFile")
    public @ResponseBody
    ResponseMessage deleteFile(String fileId) throws IOException {
        try {
            com.ruoyi.system.domain.WorkFile file = workFileService.findFileById(fileId);
            File f = new File(file.getFilePath());
            //文件是否存在
            if (f.exists()) {
                //存在就删除
                if (f.delete()) {
                    System.out.println("本地文件删除成功");
                } else {
                    System.out.println("本地文件删除失败");
                }
            } else {
                System.out.println("本地不存在");
            }
            workFileService.deleteFileById(fileId);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("0", "删除失败");
        }

        return new ResponseMessage("1", "删除成功");
    }

    /**
     * 文件下载
     *
     * @param file
     * @param response
     * @return
     */
    @RequestMapping(value = "/downloadFile", method = RequestMethod.POST)
    public @ResponseBody
    ResponseMessage downloadFile(@RequestBody com.ruoyi.system.domain.WorkFile file, HttpServletResponse response) {
        //获取文件的信息
        try {
            com.ruoyi.system.domain.WorkFile dbFile = workFileService.findFileById(file.getFileId());
            System.out.println(dbFile);
            //拿到文件路径
            String filePath = dbFile.getFilePath();
            File f = new File(filePath);
            System.out.println(f.getName());
            if (f.exists()) {
                byte[] buffer = new byte[1024];
                FileInputStream fis = null;
                BufferedInputStream bis = null;
                try {
                    fis = new FileInputStream(f);
                    bis = new BufferedInputStream(fis);
                    //从响应中拿到输出流对象
                    OutputStream os = response.getOutputStream();
                    int i = bis.read(buffer);
                    while (i != -1) {
                        os.write(buffer, 0, i);
                        i = bis.read(buffer);
                    }
                    return new ResponseMessage("0", "下载文件成功");
                } catch (Exception e) {
                    e.printStackTrace();
                    return new ResponseMessage("-1", "下载文件失败");
                } finally {
                    if (bis != null) {
                        try {
                            bis.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                    if (fis != null) {
                        try {
                            fis.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
            return new ResponseMessage("-1", "下载文件不存在");
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseMessage("-1", "下载文件失败");
        }
    }
    /**
     * 文件批量下载
     *
     * @param
     * @param response
     * @return
     */
    @RequestMapping(value = "/downloadAllFile", method = RequestMethod.POST)
    public @ResponseBody
    ResponseMessage downloadAllFile(@RequestParam String activityId,@RequestParam Integer competitionType, HttpServletResponse response) {
        System.out.println(activityId);
        System.out.println(competitionType);
        //获取文件的信息
        return new ResponseMessage("0", "下载文件成功");

    }
}
