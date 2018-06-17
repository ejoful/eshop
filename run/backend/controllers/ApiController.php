<?php
namespace backend\controllers;

use Yii;
use backend\models\ItemCat;
use backend\models\ItemCatSearch;
use yii\web\Controller;
use yii\filters\VerbFilter;
use common\controllers\FunController;
use backend\models\ItemPropValue;

/**
 * ApiController implements the CRUD actions for Api model.
 */
class ApiController extends Controller
{
    private static $cid_arr = [];
    private static $cok = "cookie:miid=1284367786035506350; hng=CN%7Czh-CN%7CCNY%7C156; thw=cn; ali_apache_id=11.135.97.21.1508847985324.245975.3; cna=JOJfEQ1ezgcCAXlFKqZinwrK; enc=9jUe%2FkGYf2SEJRV1kQJ05Tktev8TvtZfRY0ktJY7HYUMJzqZMxeYg6HH3q%2FhY2kcskPQYsfUVr57CAbETQQGZA%3D%3D; _uab_collina=152198567953967765577551; ali_ab=117.100.145.8.1510738606458.4; UM_distinctid=162e73ce0e4355-0dd9e2981fade3-3977065e-100200-162e73ce0e5d60; JSESSIONID=DF0A3B88824A274C75199BA2021E2DCE; l=Aj09w6W0qZ8uR/Vt19wyWKctzZM3hnEp; v=0; _tb_token_=e113eff8de77e; x=e%3D1%26p%3D*%26s%3D0%26c%3D0%26f%3D0%26g%3D0%26t%3D0%26__ll%3D-1%26_ato%3D0; whl=-1%260%260%261528629432817; _umdata=BA335E4DD2FD504FCFC08163B7CEEBC8E506769C0ED1DF9C3E82B14B5B4143F9B260DCF75F4F7DC2CD43AD3E795C914C21B7F67A532F9873D4672BE66B964947; uc3=sg2=Vyu7WXOT5aUObwKasXi3wHavdQrFmMTF3CTC%2FClQCbg%3D&nk2=AmkbKafOx9I%3D&id2=UU8PbnneKzSx&vt3=F8dBzr2PYpVmuVOzB2Q%3D&lg2=Vq8l%2BKCLz3%2F65A%3D%3D; existShop=MTUyODYzNDg1Mg%3D%3D; lgc=axianzia; tracknick=axianzia; dnk=axianzia; cookie2=27510f2e0fa45f56b4c496c1a4ceb66d; sg=a19; csg=af873881; mt=np=&ci=4_1; cookie1=U%2BItOIkoJQAKEBg7UNusLVWk5N%2Bjy%2B0nBH%2BLYA08k7o%3D; unb=277562651; skt=6dde62fdf9a23a57; t=d97c801e8442e16f1c3735dbd06730d7; _cc_=WqG3DMC9EA%3D%3D; tg=0; _l_g_=Ug%3D%3D; _nk_=axianzia; cookie17=UU8PbnneKzSx; _m_h5_tk=9cd7d707d2ab40c795a819847701f228_1528637377851; _m_h5_tk_enc=f420bc234cef4604228bfd39f034bdb4; uc1=cookie16=VT5L2FSpNgq6fDudInPRgavC%2BQ%3D%3D&cookie21=URm48syIZJfmZ9wVDIsn4w%3D%3D&cookie15=UIHiLt3xD8xYTw%3D%3D&existShop=true&pas=0&cookie14=UoTeNmdfIrRtIQ%3D%3D&tag=8&lng=zh_CN; apush9d262ee96ebd1865a8e3baaae496c5a4=%7B%22ts%22%3A1528634893851%2C%22heir%22%3A1528634890456%2C%22parentId%22%3A1528601541091%7D; isg=BHJyryq6fZDGeUJFtdWNk6Tbw7GUq3f6mFrSLzxLqyUWzxPJJJLsrSRpu2Pzv-41";
    
    
    
    
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all ItemCat models.
     * @return mixed
     */
    public function actionGetcat()
    {
        $url = "https://upload.taobao.com/auction/json/reload_cats.htm?customId=&fenxiaoProduct=";
        $header_arr = [
            'user-agent:Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36',
            self::$cok,
            
        ];
        $cat_str = FunController::http_post_data($url, '', $header_arr);
        $cat_str=iconv("gbk","UTF-8",$cat_str);
        $cat_arr = json_decode($cat_str);
//         print_r($cat_arr);die();
        $cid_arrs = ItemCat::find()
        ->select('cid')
        ->asArray()
        ->all();
        self::$cid_arr = array_column($cid_arrs, 'cid');
        foreach($cat_arr[0]->data as $cat_group) {
            foreach ($cat_group->data as $cat) {
                if (!in_array($cat->sid, self::$cid_arr)) {
                    self::$cid_arr[] =  $cat->sid;
                    $cat_model = new ItemCat();
                    $cat_model->spell = $cat->spell;
                    $cat_model->name = $cat->name;
                    $cat_model->spuid = $cat->spuid;
                    $cat_model->leaf = $cat->leaf;
                    $cat_model->cid = $cat->sid;
                    $cat_model->status = $cat->status;
                    $cat_model->save(false);
                }
                self::childcat($cat->sid);
                
            }
        }
        print_r($cat_str);
    }
    
    public static function childcat($parendid)
    {
        $url = "https://upload.taobao.com/auction/json/reload_cats.htm?customId=&fenxiaoProduct=";
        $header_arr = [
            'user-agent:Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36',
            self::$cok,
        ];
        $data = [
            'path' => 'next',
            'sid' => $parendid,
            'pv' => '',
        ];
        $cat_str = '';
        $cat_str = FunController::http_post_data($url, $data, $header_arr);
        $cat_str = iconv("gbk","UTF-8//ignore",$cat_str);
        $cat_arr = json_decode($cat_str);
//         print_r($cat_str);
//         die();
        if (!isset($cat_arr[0])) {
            error_log('parent cid: '.$parendid.'  '.$cat_str);
        }
        foreach($cat_arr[0]->data as $cats) {
            foreach($cats->data as $cat) {
//                 print_r($cat);
//                 die();
                if (!in_array($cat->sid, self::$cid_arr) && $cat_arr[0]->isBrand == 0) {
                    self::$cid_arr[] =  $cat->sid;
                    $cat_model = new ItemCat();
                    $cat_model->spell = $cat->spell;
                    $cat_model->parent_cid = $parendid;
                    $cat_model->name = $cat->name;
                    $cat_model->spuid = $cat->spuid;
                    $cat_model->leaf = $cat->leaf;
                    $cat_model->cid = $cat->sid;
                    $cat_model->status = $cat->status;
                    $cat_model->save(false);
                    
                }
                if ($cat->leaf == 0) {
                    self::childcat($cat->sid);
                }
            }
        }
    }
    
    public function actionGetcatbfs()
    {
        $url = "https://upload.taobao.com/auction/json/reload_cats.htm?customId=&fenxiaoProduct=";
        $header_arr = [
            'user-agent:Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36',
            self::$cok,
    
        ];
        $cat_str = FunController::http_post_data($url, '', $header_arr);
        $cat_str=iconv("gbk","UTF-8",$cat_str);
        $cat_arr = json_decode($cat_str);
        //         print_r($cat_arr);die();
        $cid_arrs = ItemCat::find()
        ->select('cid')
        ->asArray()
        ->all();
        self::$cid_arr = array_column($cid_arrs, 'cid');
        foreach($cat_arr[0]->data as $cat_group) {
            foreach ($cat_group->data as $cat) {
                if (!in_array($cat->sid, self::$cid_arr)) {
                    self::$cid_arr[] =  $cat->sid;
                    $cat_model = new ItemCat();
                    $cat_model->spell = $cat->spell;
                    $cat_model->name = $cat->name;
                    $cat_model->spuid = $cat->spuid;
                    $cat_model->leaf = $cat->leaf;
                    $cat_model->cid = $cat->sid;
                    $cat_model->status = $cat->status;
                    $cat_model->depth = 0;
                    $cat_model->save(false);
                }
            }
        }
        print_r($cat_str);
    }
    
    public function actionChildcatbfs()
    {
        ini_set ('memory_limit', '256M');
        $url = "https://upload.taobao.com/auction/json/reload_cats.htm?customId=&fenxiaoProduct=";
        $header_arr = [
            'user-agent:Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36',
            self::$cok,
        ];
//         $cid_arrs = ItemCat::find()
//         ->select('cid')
//         ->asArray()
//         ->all();
//         self::$cid_arr = array_column($cid_arrs, 'cid');
        
        $empty_child_cat = [];
        for($i = 0; $i < 8; $i++) {
            $par_cid_arr = ItemCat::find()->select('cid')
            ->where(['depth' => $i])
            ->andWhere(['!=', 'leaf', 0])
            ->asArray()
            ->all();
            $par_cid_arr = array_column($par_cid_arr, 'cid');
            foreach ($par_cid_arr as $parendid) {
                $data = [
                    'path' => 'next',
                    'sid' => $parendid,
                    'pv' => '',
                ];
                $cat_str = '';
                $cat_str = FunController::http_post_data($url, $data, $header_arr);
                $cat_str = iconv("gbk","UTF-8//ignore",$cat_str);
                $cat_arr = json_decode($cat_str);
//                         print_r($cat_arr[0]);
//                         die();
//                 error_log($parendid);
                if (!isset($cat_arr[0])) {
                    $empty_child_cat[] = $parendid;
                }
                if (!empty($cat_arr)) {
                    foreach($cat_arr[0]->data as $cats) {
                        foreach($cats->data as $cat) {
                            //                 print_r($cat);
                            //                 die();
//                             if ($cat_arr[0]->type == 0) {
//                                 if (!in_array($cat->sid, self::$cid_arr)) {
//                                     self::$cid_arr[] =  $cat->sid;
//                                     $cat_model = new ItemCat();
//                                     $cat_model->spell = $cat->spell;
//                                     $cat_model->parent_cid = $parendid;
//                                     $cat_model->name = $cat->name;
//                                     $cat_model->spuid = $cat->spuid;
//                                     $cat_model->leaf = $cat->leaf;
//                                     $cat_model->cid = $cat->sid;
//                                     $cat_model->status = $cat->status;
//                                     $cat_model->save(false);
//                                 }
//                             } 
                            if ($cat_arr[0]->type == 1) {
                                $pid_vid = explode(':', $cat->sid);
                                $prop_values_model = ItemPropValue::find()
                                ->select('cid')
                                ->where(['cid' => $parendid])
                                ->andWhere(['pid' => $pid_vid[0]])
                                ->andWhere(['vid' => $pid_vid[1]])
                                ->one();
                                if (empty($prop_values_model)) {
                                    $cat_model = new ItemPropValue();
                                    $cat_model->leaf = $cat->leaf;
                                    $cat_model->name = $cat->name;
                                    $cat_model->sid = $cat->sid;
                                    $cat_model->prop_name = $cat_arr[0]->pName;
                                    $cat_model->pid = $pid_vid[0];
                                    $cat_model->vid = $pid_vid[1];
                                    $cat_model->spell = $cat->spell;
                                    $cat_model->spuid = $cat->spuid;
                                    $cat_model->status = $cat->status;
                                    $cat_model->cid = $parendid;
                                    $cat_model->save(false);
                                }
                                unset($prop_values_model);
                            } else {
                                error_log('cid: ' . $parendid. ' type： '.$cat_arr[0]->type);
                            }
                            
                        }
                    }
                }
                
            }
            ItemCat::updateAll(['depth' => $i+1], ['parent_cid' => $par_cid_arr]);
        }
        error_log('parent cid: '.implode(',', $empty_child_cat));
    }

    
}
