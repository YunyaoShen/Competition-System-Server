package com.ruoyi.web.controller.system;

import com.ruoyi.system.domain.Competition;
import com.ruoyi.system.domain.Notification;
import com.ruoyi.system.service.FileService;
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
import java.util.List;
import java.util.UUID;

/**
 * 上传，下载，管理文件类
 */

@Controller
@PropertySource("classpath:file.properties")
@RequestMapping("/system/file")
public class FileController {
    @Autowired
    private FileService fileService;

    @Autowired
    private RedisUtil redisUtil;

    //抽取上传路径
    @Value("${filePath}")
    private String filePath;


    /**
     * 校验上传竞赛通知的文件，进行保存或修改
     */
    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    public @ResponseBody
    ResponseMessage uploadFile(@RequestParam("multipartFiles") MultipartFile[] multipartFiles) throws IOException {
        //获得竞赛通知表单的对应竞赛id
        String competitionId = redisUtil.get("competitionId").toString();
        //文件是否存在，标志
        Boolean tag = false;
        //设置文件保存路径
        final String path = filePath + competitionId + "/";
        if (multipartFiles != null && multipartFiles.length > 0) {
            for (MultipartFile multipartFile : multipartFiles) {
                String fileName = multipartFile.getOriginalFilename();

                List<com.ruoyi.system.domain.File> files = fileService.findFileByCompetitionId(competitionId);

                for (com.ruoyi.system.domain.File file : files) {
                    if (fileName.equals(file.getFileName())) {
                        tag = true;
                        break;
                    }
                }
                if (tag) {
                    tag = false;
                    continue;
                }
                //封装文件对象
                File file = new File(path, fileName);
                com.ruoyi.system.domain.File f = new com.ruoyi.system.domain.File();
                f.setFileId(UUID.randomUUID().toString());
                f.setFileName(fileName);
                f.setFilePath(path + fileName);
                Competition competition = new Competition();
                competition.setCompetitionId(competitionId);
                f.setCompetition(competition);

                //判断文件夹是否存在，如果不存在则创建
                if (!file.exists()) {
                    if (!file.getParentFile().exists()) {
                        file.getParentFile().mkdirs();
                    }
                    file.createNewFile();
                }
                try {
                    // 文件写入
                    multipartFile.transferTo(file);

                    //文件保存至数据库
                    fileService.insertFile(f);
                } catch (Exception e) {
                    e.printStackTrace();
                    return new ResponseMessage("0", "操作失败");
                }
            }
        }

        redisUtil.del("competitionId");
        return new ResponseMessage("1", "操作成功");
    }

    /**
     * 校验上传公告和获奖通知的文件，进行保存或修改
     */
    @RequestMapping(value = "/uploadNoticeFile", method = RequestMethod.POST)
    public @ResponseBody
    ResponseMessage uploadNoticeFile(@RequestParam("multipartFiles") MultipartFile[] multipartFiles) throws IOException {
        //获得系统公告表单的对应公告id
        String notificationId = redisUtil.get("notificationId").toString();
        //文件是否存在，标志
        Boolean tag = false;
        //设置文件保存路径
        final String path = filePath + notificationId + "/";
        System.out.println(notificationId);
        System.out.println(path);
        if (multipartFiles != null && multipartFiles.length > 0) {
            for (MultipartFile multipartFile : multipartFiles) {
                String fileName = multipartFile.getOriginalFilename();
                List<com.ruoyi.system.domain.File> files = fileService.findFileByNotificationId(notificationId);
                //遍历文件，判断文件是否存在
                for (com.ruoyi.system.domain.File file : files) {
                    if (fileName.equals(file.getFileName())) {
                        tag = true;
                        break;
                    }
                }
                if (tag) {
                    tag = false;
                    continue;
                }
                //封装文件对象
                File file = new File(path, fileName);
                com.ruoyi.system.domain.File f = new com.ruoyi.system.domain.File();
                f.setFileId(UUID.randomUUID().toString());
                f.setFileName(fileName);
                f.setFilePath(path + fileName);
                Notification notification = new Notification();
                notification.setNotificationId(notificationId);
                f.setNotification(notification);
                System.out.println(f);

                //判断文件夹是否存在，如果不存在则创建
                if (!file.exists()) {
                    if (!file.getParentFile().exists()) {
                        file.getParentFile().mkdirs();
                    }
                    file.createNewFile();
                }
                try {
                    // 文件写入
                    multipartFile.transferTo(file);
                    //文件保存至数据库
                    fileService.insertFile(f);
                } catch (Exception e) {
                    e.printStackTrace();
                    return new ResponseMessage("0", "操作失败");
                }
            }
        }

        redisUtil.del("notificationId");
        return new ResponseMessage("1", "操作成功");
    }

    /**
     * 删除文件
     */
    @RequestMapping(value = "/deleteFile")
    public @ResponseBody
    ResponseMessage deleteFile(String fileId) throws IOException {
        try {
            com.ruoyi.system.domain.File file = fileService.findFileById(fileId);
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
            fileService.deleteFileById(fileId);
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
    ResponseMessage downloadFile(@RequestBody com.ruoyi.system.domain.File file, HttpServletResponse response) {
        //获取文件的信息
        try {
            com.ruoyi.system.domain.File dbFile = fileService.findFileById(file.getFileId());
            System.out.println(dbFile);
            //拿到文件路径
            String filePath = dbFile.getFilePath();
            File f = new File(filePath);
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

}
