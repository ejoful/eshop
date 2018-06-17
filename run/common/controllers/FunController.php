<?php
namespace common\controllers;

use Yii;
use yii\web\Controller;

class FunController extends Controller
{
    /**
     * post
     *
     * @param string $url url
     * @param string $data_string json string
     * @return json
     */
    public static function http_post_data($url, $data_arr='', $header_arr = [])
    {
    
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data_arr);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $header_arr);
    
        ob_start();
        curl_exec($ch);
        $return_content = ob_get_contents();
        ob_end_clean();
    
        if(curl_error($ch))
        {
            Yii::error('File: '. __FILE__ . ' line: ' . __LINE__ . ' Curl error: ' . curl_error($ch));
            $error_data = ["status"=>'error','reason' => '服务不可用'];
            return json_encode($error_data);
        }
        curl_close($ch);
        return $return_content;
    }
    
    /**
     * get
     *
     * @param string $url url
     * @return json
     */
    public static function http_get_data($url, $header_arr = [])
    {
    
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
    
        // Setup headers - I used the same headers from Firefox version 2.0.0.6
        // below was split up because php.net said the line was too long. :/
        $header[0] = "Accept: text/xml,application/xml,application/xhtml+xml,";
        $header[0] .= "text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5";
        $header[] = "Cache-Control: max-age=0";
        $header[] = "Connection: keep-alive";
        $header[] = "Keep-Alive: 300";
        $header[] = "Accept-Charset: ISO-8859-1,utf-8;q=0.7,*;q=0.7";
        $header[] = "Accept-Language: en-us,en;q=0.5";
        $header[] = "Pragma: "; // browsers keep this blank.
        if (!empty($header_arr)) {
            $header = array_merge($header,$header_arr);
        }
        curl_setopt($ch,CURLOPT_USERAGENT,'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8.1.13) Gecko/20080311 Firefox/2.0.0.13');
        curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
    
        ob_start();
        curl_exec($ch);
        $return_content = ob_get_contents();
        ob_end_clean();
    
        if(curl_error($ch))
        {
            Yii::error('File: '. __FILE__ . ' line: ' . __LINE__ . ' Curl error: ' . curl_error($ch));
            $error_data = ["status"=>'error','reason' => '服务不可用'];
            return json_encode($error_data);
        }
        curl_close($ch);
        return $return_content;
    }
    
    /**
     * @desc 发送文件流
     * @param string $url
     * @param binary $file
     * @return string
     *
     */
    public static function sendStreamFile($url, $file, $type)
    {
        if (empty($url) || empty($file))
        {
            return false;
        }
        $opts = array(
            'http' => array(
                'method' => 'POST',
                'header' => 'content-type:'.$type,
                'content' => $file
            )
        );
        $context = stream_context_create($opts);
        $response = file_get_contents($url, false, $context);
        return $response;
    
    }
    
    // send email to some one
    public static function sendMail($to, $from, $subject, $body)
    {
        $post_body = json_encode(
            array(
                'from' => $from,
                'to' => $to,
                'subject' => $subject,
                'body' => $body
            )
            );
    
        $send_mail = "http://mobvoi-account/mail/mime?origin=developer.chumenwenwen.com";
    
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_URL, $send_mail);
    
        curl_setopt($ch, CURLOPT_POSTFIELDS, $post_body);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array(
            'Content-Type: application/json; charset=utf-8',
            'Content-Length: ' . strlen($post_body))
            );
    
        ob_start();
        curl_exec($ch);
        $response_str = ob_get_contents();
        ob_end_clean();
    
        if(curl_error($ch))
        {
            Yii::error('File: '. __FILE__ . ' line: ' . __LINE__ . ' Curl error: ' . curl_error($ch));
            $error_data = ["status"=>'error','message' => '服务不可用'];
            return json_encode($error_data);
        }
    
        $return_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        curl_close($ch);
    
        $response = json_decode($response_str, true);
        return $response_str;
    }
    
    public static function sendMail2Developer($action, $language, $to, $app_model, $reason = '')
    {
        $from = Yii::$app->params['mail_from'][$language];
        $subject = Yii::$app->params['mail_developer_subject'][$language][$action];
        $body = str_replace('@reason', $reason, Yii::$app->params['mail_developer_body'][$language][$action]);
        $body = str_replace('@app_name', $app_model->name, $body);
        ApiController::sendMail($to, $from, $subject, $body);
    }
    
    public static function sendMail2Support($action, $developer, $app_model)
    {
        $apks_model = Apk::find()
        ->where(['package_name' => $app_model->package_name])
        ->andWhere(['app_id' => $app_model->app_id])
        ->andWhere(['current' => 1])
        ->all();
        $subject = '';
        $reason = '';
        switch ($action) {
            case 'new_app':
                $subject = '有新应用上传-'. $app_model->support_sys . '-' . $app_model->name;
                break;
            case 'update_app':
                $subject = '应用更新-'. $app_model->support_sys . '-' . $app_model->name;
                break;
            case 'no_pass_app':
                $subject = '应用审核未通过-'. $app_model->support_sys . '-' . $app_model->name;
                $reason = '未通过原因：' . $app_model->reject_msg;
                break;
            case 'online_app':
                $subject = '应用审核通过-'. $app_model->support_sys . '-' . $app_model->name;
                break;
            case 'offline_app':
                $subject = '应用被下线-'. $app_model->support_sys . '-' . $app_model->name;
                $reason = '下线原因：' . $app_model->offline_msg;
                break;
        }
        $is_standard_wear_apk = '';
        if ($app_model->is_standard_wear_apk == 1) {
            $is_standard_wear_apk = '是';
        } elseif ($app_model->is_standard_wear_apk == 0) {
            $is_standard_wear_apk = '否';
        }
        $from = '问问开发者平台<mobvoistore@mobvoi.com>';
        $to = 'mobvoistore@mobvoi.com';
        $body = '应用名称：' . $app_model->name .'<br>';
        $body .= '是否为独立应用：' . $is_standard_wear_apk .'<br>';
        $body .= '种类：' . Lookup::item('app_category', $app_model->category_id, 'cn') . '<br>';
        $body .= '定价：'. $app_model->price .'元<br>';
        $cpu_text = $apks_model[0]->cpu;
        if(!empty($apks_model[1]->cpu)) {
            $cpu_text .= ','. $apks_model[1]->cpu;
        }
        if(strcmp($cpu_text, 'all') == 0) {
            $cpu_text .= '（二者都支持，包括arm&x86）';
        }
        $body .= '硬件平台：'. $cpu_text .'<br>';
        $body .= '上传时间：' . $app_model->submit_time. '<br>';
        $body .= '开发者名称：' . $developer['name'] . '<br>';
        $body .= '开发者电话：' . $developer['phone'] . '<br>';
        $body .= '开发者email：' . $developer['email'] . '<br>';
        //如果是表盘应用
        if ($app_model->category_id == 6) {
            $body .= '表盘分类：' . Lookup::item('watch_face_type', $app_model->watch_face_type, 'cn') . '<br>';
            $body .= '关键词：' . $app_model->tags . '<br>';
        }
        $body .= '支持的系统：'. $app_model->support_sys .'<br>';
        $body .= '概述：'. $app_model->summary . '<br>';
        $body .= '描述：'. $app_model->description .'<br>';
        $app_url = "https://developer.chumenwenwen.com/htlogin/index.php?r=app%2Fview&id=$app_model->app_id";
        $body .= "审核后台链接： <a href='$app_url'>". $app_url .'</a><br>';
        $body .= $reason;
        return ApiController::sendMail($to, $from, $subject, $body);
    }

    public static function uploadImg($uploadedFile, $folder) {
        $ext = $uploadedFile->getExtension();
        $randName = time() . rand(1000, 9999) . '.' . $ext;
        $mime = \yii\helpers\FileHelper::getMimeType($uploadedFile->tempName);
        $file = time() . "_" . $uploadedFile->name;
        $url = "http://static.cdn.ticwear.com/developer/img/".$folder."/".$randName;
        if ($uploadedFile == null) {
            $message = "没有图片被上传。";
        } else if ($uploadedFile->size == 0) {
            $message = "文件大小为0。";
        } else if ($mime != "image/jpeg" && $mime != "image/png") {
            $message = "请上传jpeg或者png格式的图片。";
        } else if ($uploadedFile->tempName == null) {
            $message = "您可能试图破解我们的服务器。希望你不要这么做。";
        } else {
            $message = '';
            $fp = fopen($uploadedFile->tempName, 'r');
            $filebinary = fread($fp, filesize($uploadedFile->tempName));
            fclose($fp);
            $uploadPath = "http://mobvoi-oss/mobvoi-website/developer/img/".$folder."/".$randName;
            $result = Self::sendStreamFile($uploadPath, $filebinary, $uploadedFile->type);
            if(!$result)
            {
                $message = "上传图片失败！";
            }
            $funcNum = $_GET['CKEditorFuncNum'];
            echo "<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction($funcNum, '$url', '$message');</script>";
        }
    }

    public static function uploadMarkdownImg($image, $folder) {
        if ($image) {
                $fp = fopen($image->tempName, 'r');
                $filebinary = fread($fp, filesize($image->tempName));
                fclose($fp);
                $url = "http://mobvoi-oss/mobvoi-website/developer/img/".$folder."/".$image->name;
                $result = Self::sendStreamFile($url, $filebinary, $image->type);
                $image->tempName = "http://static.cdn.ticwear.com/developer/img/".$folder."/".$image->name;
                return Json::encode([
                'files' => [[
                    'name' => $image->tempName,
                    'size' => $image->size,
                    "url" => "http://static.cdn.ticwear.com/developer/img/".$folder."/".$image->name,
                ]]
            ]);
        }
    }
}
