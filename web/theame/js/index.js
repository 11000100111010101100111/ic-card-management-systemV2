/**
 * Created by Administrator on 2016/4/9.
 */
 function getQueryStr(name,str) {
    var reg = new RegExp("(^|&|\\?)" + name + "=([^&]*)(&|$)", "i");
    var result = (str || location.search.substr(1)).match(reg);
    if (result != null) return decodeURIComponent(result[2]);
    return null;
}
//鐗堟湰鏇存柊
var config = {
    base: '/platform',
    paths: {
        'libs': '/public/js/libs',
        'plugs':'/public/js/plugs'
    },
    comboSuffix: '?v='+__ver
};
seajs.config(config);

var COOKIE_NAME = 'student_no';
if ($.cookie(COOKIE_NAME) && $.cookie(COOKIE_NAME) != "null") {
    $("#user_name").val($.cookie(COOKIE_NAME));
    document.getElementById("remember").checked = true;
}
var t='';
var result_url = getQueryStr('result_url') || '';

seajs.use(['libs/md5','libs/dialog'],function(security) {
    $('#img_valid_code').click(function () {
        $(this).attr('src', '/login/validcode?' + Math.random());
    });
    var _submit_flag = false;
    var login = function () {
        if(is_sso == 1){
            //鍗曠偣鐧诲綍鐩存帴鐧诲綍
        }else{
            var user_name = $.trim($("#user_name").val());
            var school_id = $(this).data('id');
            if (user_name.length < 1) {
                if (school_id == '196') {
                    $.showMessage('璇疯緭鍏�18浣嶈韩浠借瘉鍙�');
                } else {
                    $.showMessage('璇疯緭鍏ュ鍙�');
                }
                return false;
            }
            var password = $.trim($('#password').val());
            if (password.length < 1) {
                if (school_id == '196') {
                    $.showMessage('璇疯緭鍏�18浣嶈韩浠借瘉鍙�');
                } else {
                    $.showMessage('璇疯緭鍏ュ瘑鐮�');
                }
                return false;
            }
            password = security.hex_md5(password);
            var valid_code = $.trim($("#valid_code").val());
            if(valid_code.length < 1){
                $.showMessage('璇疯緭鍏ラ獙璇佺爜');
                return false;
            }
        }
        if (!_submit_flag) {
            _submit_flag = true;
            var _data = {
                user_name: user_name || '',
                valid_code: valid_code || ''
            };
            _data['mm'] = password || '';
            if(is_sso == 1){
                submit(_data);
            }else {
                $.ajax({
                    url:'/login/get_encode_token',
                    type:'post',
                    data:{
                        code:$.trim($('#password').val())
                    },
                    success: function (result) {
                        if(result.code == 1){
                            t = result.data;
                            submit(_data);
                        }else{
                            _submit_flag = false;
                            $.showMessage(result.msg);
                        }
                    },
                    error:function () {
                        _submit_flag = false;
                        $.showMessage('鐧绘湇鍔″櫒杩炴帴澶辫触锛�');
                    }
                });
            }
        } else {
            $.showMessage('璇蜂笉瑕侀噸澶嶇櫥褰�');
        }
    };
    var submit = function(data){
        $.ajax({
            url: '/login/submit',
            type: 'post',
            dataType: "json",
            data: data,
            headers:{
                't':t
            },
            success: function (result) {
                _submit_flag = false;
                if(!!result.data.error_code){
                    if(result.data.error_code == -1){
                        $('#img_valid_code').attr('src', '/login/validcode?' + Math.random());
                        changePass();
                        $("#student_no").val($("#user_name").val());
                    }else{
                        $.showMessage(result.msg,3000);
                    }
                }else if (result.code == 1) {
                    if (result.data.qr_code_url) {
                        $('.login_qr img').attr('src', result.data.qr_code_url  )
                        $('.login_qr').show();
                        $('.login-form').hide();
                        setTimeout(function(){
                            $("#login_btn").trigger('click');
                        },5000);
                        $('#div_main').show();
                        $(document.body).addClass('loginpage');
                    } else {
                        setCookie();
                        $.cookie('remember_inform_student',null,{path: '/'});
                        if(is_sso != 1) {
                            $.showMessage('鐧诲綍鎴愬姛');
                        }
                        if ($.cookie('isBack')=='true') {
                            $.cookie('isBack', 'false');
                            if($.cookie('backUrl')){
                                location.href=$.cookie('backUrl');
                            }
                            history.back();
                        }else if(result_url != ''){
                            location.href = result_url;
                        }  else {
                            location.href = '/student';
                        }
                    }
                }else if(result.code == 120104 && ($('#login_btn').data('id') == 2413 || $('#login_btn').data('id') == 832)){ //韬唤鏍￠獙 榛戦緳姹熺壒娈婂鐞�
                    _submit_flag = false;
                    identityAuth();
                }
                else {
                    if (!!result.data.logo_need_valid) {
                        $('#div_code_input').show();
                        $('#div_code').show();
                    }
                    $('#img_valid_code').attr('src', '/login/validcode?' + Math.random());
                    $.showMessage(result.msg,3000);
                }
            },
            error:function(){
                _submit_flag = false;
                $.showMessage('鐧诲綍澶辫触锛屾湇鍔″櫒杩炴帴澶辫触锛�');
            }
        });
    }
    $('.login-form').on('click', '#login_btn', function() {
        login();
    });
    if(is_sso == 1){
        login();
    }
    var setCookie = function () {
        if (document.getElementById("remember").checked) {
            $.cookie(COOKIE_NAME, $("#user_name").val(), {path: '/', expires: 10});
            //var date = new Date();
            //date.setTime(date.getTime() + (3 * 24 * 60 * 60 * 1000)); //涓夊ぉ鍚庣殑杩欎釜鏃跺€欒繃鏈�
            //$.cookie(COOKIE_NAME, $("#username").val(), { path: '/', expires: date });
        } else {
            $.cookie(COOKIE_NAME, null, {path: '/'});  //鍒犻櫎cookie
        }
    };

    var testPass = function (s) {
        if(!s) return false; //鏈緭鍏�
        if (s.length<9) return false; // 灏忎簬8浣�

        var str = $.trim(s);
        if (!/\d/.test(str)) return false; //鏁板瓧
        if (!/[a-z]/.test(str)) return false; //灏忓啓
        if (!/[A-Z]/.test(str)) return false; //澶у啓
        return true;
    };
    /**
     * 鏍￠獙瀵嗙爜
     * @param s 闇€瑕佹牎楠岀殑鍙傛暟鍊�
     * @returns {boolean} 杩斿洖true/false
     */
    var testPass2 = function (s) {
        if(!s) return false; //鏈緭鍏�
        if (s.length<10) return false; // 灏忎簬10浣�

        var str = $.trim(s);
        if (!/\d/.test(str)) return false; //鏁板瓧
        if (!/[a-z]/.test(str)) return false; //灏忓啓
        if (!/[A-Z]/.test(str)) return false; //澶у啓
        return true;
    };
    var changePass = function() {
        $.message({
            title: '淇敼瀵嗙爜',
            content: '' +
                '<div class="form-group" style="text-align: left;border: 1px solid #ccc">鏍规嵁鍥藉缃戠粶淇℃伅瀹夊叏瑕佹眰锛岀櫥褰曠殑瀵嗙爜蹇呴』绗﹀悎浠ヤ笅瑙勫垯锛�' +
                '<p>1銆佸瘑鐮侀暱搴﹀ぇ浜�8浣嶏紝</p>' +
                '<p>2銆佸繀椤绘槸澶у皬鍐欏瓧姣嶅拰鏁板瓧鐨勭粍鍚堛€�</p>' +
                '</div>' +
                '<div class="form-group hide"><label for="student_no" class="control-label">瀛﹀彿锛�</label><input id="student_no" type="text" class="form-control" placeholder="璇疯緭鍏ュ鍙�"/></div>' +
                '<div class="form-group"><label for="pwd" class="control-label">鏃у瘑鐮侊細</label><input id="pwd" type="password" class="form-control" placeholder="璇疯緭鍏ユ棫瀵嗙爜"/></div>' +
                '<div class="form-group"><label for="pwd1" class="control-label">鏂板瘑鐮侊細</label><input id="pwd1" type="password" class="form-control" placeholder="璇疯緭鍏ユ柊瀵嗙爜"/></div>' +
                '<div class="form-group"><label for="pwd2" class="control-label">閲嶅鏂板瘑鐮侊細</label><input id="pwd2" type="password" class="form-control" placeholder="璇烽噸澶嶈緭鍏ユ柊瀵嗙爜"/></div>'+
                '<div class="form-group"><label for="pwd_valid_code" class="control-label">鍥惧舰楠岃瘉鐮侊細</label><div style="position:relative;"><input type="text" id="pwd_valid_code" maxlength="4" class="form-control"style="display: inline-block;width: 100px"placeholder="鍥惧舰楠岃瘉鐮�"><img class="pwd_valid_code"src="/login/validcode"style="height:33px;cursor: pointer;"/></div></div>',
            btns: [['鍙栨秷', function () {
                this.close();
            }], ['纭畾', function () {
                var _this = this;
                var postData = {};
                postData.user_name =$.trim($("#student_no").val());
                postData.old_mm = security.hex_md5($("#pwd").val());
                postData.mm = security.hex_md5($("#pwd1").val());
                var pwd2 = security.hex_md5($("#pwd2").val());
                postData.valid_code = $.trim($("#pwd_valid_code").val());
                if(!$("#student_no").val()){
                    $.showMessage('璇疯緭鍏ュ鍙�!');
                    return false;
                }
                if(!$("#pwd").val() || !$("#pwd1").val()){
                    $.showMessage('璇疯緭鍏ュ瘑鐮�!');
                    return false;
                }
                if(!testPass($("#pwd1").val())){
                    $("#pwd1").val("").focus();
                    $.showMessage('鏂板瘑鐮佸繀椤诲ぇ浜�8浣嶅苟涓旀槸澶у皬鍐欏瓧姣嶅拰鏁板瓧缁勫悎',3000);
                    return false;
                }
                if (postData.mm != pwd2) {
                    $("#pwd2").val("").focus();
                    $.showMessage('涓ゆ杈撳叆瀵嗙爜涓嶄竴鑷�!');
                    return false;
                }
                if($("#pwd_valid_code").val().length <4){
                    $.showMessage('璇疯緭鍏�4浣嶇殑鍥惧舰楠岃瘉鐮�!');
                    return false;
                }
                $.ajax({
                    url:'/login/get_encode_token',
                    type:'post',
                    data:{
                        code:$.trim($("#pwd1").val())
                    },
                    success: function (result) {
                        if(result.code == 1){
                            updP(postData,result.data);
                        }else{
                            $('.pwd_valid_code').attr('src', '/login/validcode?' + Math.random());
                            $.showMessage(result.msg);
                        }
                    },
                    error:function () {
                        $.showMessage('鏈嶅姟鍣ㄨ繛鎺ュけ璐ワ紒');
                    }
                });


                return false;
            }]]
        });
        $(".ui-dialog-close").remove();
        $(".ui-dialog-button [type=button]").eq(0).remove();
    };

    var updP=function(data,t){
        var _this = this;
        $.ajax({
            url: "/login/update_pwd",
            dataType: "json",
            type: 'post',
            data: data,
            headers:{
                't':t
            },
            success: function (data) {
                var d = $.dialog({content: data.msg, quickClose: true}).show();
                if(data.code == 1){
                    $.showMessage('鎿嶄綔鎴愬姛');
                    setTimeout(function () {
                        window.location.reload();
                    }, 1500);
                }else{
                    d.close().remove();
                    $('.pwd_valid_code').attr('src', '/login/validcode?' + Math.random());
                    $.showMessage(data.msg);
                }
            }
        });
    };

    //淇敼瀵嗙爜鐨勫埛鏂伴獙璇佺爜
    $(document).on('click','.pwd_valid_code',function () {
        $('.pwd_valid_code').attr('src', '/login/validcode?' + Math.random());
    });
    //蹇樿瀵嗙爜
    $('.login-form').on('click', '#showReset', function() {
        html = $('.login-form').html();
        $('.login-form').html(resetHtml);
    });

    /**
     * 浜戝崡鍐涘垱瀛靛寲
     */
    var setEffectiveness = function() {
        //鎵嬫満鍙锋鍒�/韬唤璇�/閭
        var sjh = /^(13[0-9]|14[01456879]|15[0-35-9]|16[2567]|17[0-8]|18[0-9]|19[0-35-9])\d{8}$/,
            sfz = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/,
            yx = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/,
            xm =  /^([\u4e00-\u9fa5]{2,20}|[a-zA-Z.\s]{2,20})$/;

        //鏄惁鎺ュ彈杩囧叾浠栧煿璁�
        $('#reg_block').on('change','#reg_sfjsgqtpx',function () {
            $(this).val() == '鏄�'?$("#reg_cjpxjg").parents("tr").show(): $("#reg_cjpxjg").parents("tr").hide();
        });
        $('#reg_block').on('change','#reg_sftyjr',function () {
            $(this).val() == '鏄�'?$("#reg_sssf").parents("tr").show(): $("#reg_sssf").parents("tr").hide();
        });
        //鍒濆鍖栧鍚嶆晥楠�
        $(document).on('keyup','#reg_xm',function () {
            var reg = /^[\u0391-\uFFE5A-Za-z]+$/;
            reg.test($(this).val())? '':$(this).val('');
        });
        //鐐瑰嚮娉ㄥ唽
        $(document).on("click",'#btnRegs',function() {
            var is = isValue();
            for ( i in is) {
                if(is[i] !==  true) {
                    $.showMessage(is[i]);
                    return
                }
            }
            if(!xm.test( $("#reg_xm").val())) {
                $.showMessage('璇峰～鍐欐纭殑濮撳悕');
                return
            }
            if(!sjh.test( $("#reg_sjh").val())) {
                $.showMessage('璇峰～鍐欐纭殑鎵嬫満鍙�');
                return
            }
            if(!sfz.test( $("#reg_sfz").val() )) {
                $.showMessage('璇峰～鍐欐纭殑韬唤璇�');
                return
            }
            if(!yx.test($("#reg_yx").val())) {
                $.showMessage('璇峰～鍐欐纭殑閭');
                return
            }

            var data =  {
                xm:$("#reg_xm").val(),
                xb:$("#reg_xb").val(),
                sftyjr:$("#reg_sftyjr").val() == '蹇呴€�'?undefined:$("#reg_sftyjr").val(),
                sssf: $("#reg_sssf").val() == '璇烽€夋嫨'?undefined:$("#reg_sssf").val(),
                sfzh:$("#reg_sfz").val(),
                nld:$("#reg_nl").val(),
                xlcc:$("#reg_xl").val()== '璇烽€夋嫨'?undefined:$("#reg_xl").val(),
                jnzs:$("#reg_jnzs").val()== ''?undefined:$("#reg_jnzs").val(),
                sfjsgqtpx:$("#reg_sfjsgqtpx").val()== '璇烽€夋嫨'?undefined:$("#reg_sfjsgqtpx").val(),
                cjpxdjg:$("#reg_cjpxjg").val()== ''?undefined:$("#reg_cjpxjg").val(),
                fwxq:$("#reg_fwxq").val()== '璇烽€夋嫨'?undefined:$("#reg_fwxq").val(),
                ssdz:$("#province").val()+$("#city").val(),
                czd:$("#provinces").val()+$("#citys").val(),
                mobile:$("#reg_sjh").val(),
                email:$("#reg_yx").val(),
                reg_valid_code:$("#reg_valid_code").val()
            }
            getValueAjax(data);
        });

        //璇锋眰
        function getValueAjax(data) {
            $.ajax({
                url: '/login/submit_jc',
                type: 'post',
                data: data,
                headers:{
                    'Content-Type':'application/x-www-form-urlencoded'
                },
                success: function(result) {
                    if (result.code == 1) {
                        $("#reg_block").hide();
                        $.showMessage(result.msg);
                        setTimeout(function () {
                            window.location.reload();
                        },1000);
                    } else {
                        $.showMessage(result.msg);
                    }
                }
            });
        }
        //
        /**
         * 娉ㄥ唽楠岃瘉蹇呭～
         * @return Array
         */
        function isValue (){
            var isAr = {
                isreg_xm:false,
                isreg_sftyjr:false,
                isreg_sssf:false,
                isprovince:false,
                iscity:false,
                isprovinces:false,
                iscitys:false,
                isreg_sjh:false,
                isreg_yx:false,
                isreg_yzm:false
            }

            $("#reg_yx").val() ? isAr.isreg_yx = true : isAr.isreg_yx = '璇峰～鍐欓偖绠�';
            $("#reg_sjh").val() ? isAr.isreg_sjh = true : isAr.isreg_sjh = '璇峰～鍐欐墜鏈哄彿';
            $("#citys").val() && $("#citys").val()!= '璇烽€夋嫨' ? isAr.iscitys = true : isAr.iscitys = '璇烽€夋嫨甯镐綇鍦板競鍖�';
            $("#provinces").val() && $("#provinces").val()!= '璇烽€夋嫨'? isAr.isprovinces = true : isAr.isprovinces = '璇烽€夋嫨甯镐綇鍦扮渷浠�';
            $("#city").val() && $("#city").val()!= '璇烽€夋嫨'? isAr.iscity = true : isAr.iscity = '璇烽€夋嫨灞炲湴甯傚尯';
            $("#province").val()&& $("#province").val()!= '璇烽€夋嫨' ? isAr.isprovince = true : isAr.isprovince = '璇烽€夋嫨灞炲湴鐪佷唤';
            $("#reg_sfz").val() ? isAr.isreg_sssf = true : isAr.isreg_sssf = '璇峰～鍐欒韩浠借瘉';
            $("#reg_xm").val() ? isAr.isreg_xm = true : isAr.isreg_xm = '璇峰～鍐欏鍚�';
            $("#reg_valid_code").val() ? isAr.isreg_yzm = true : isAr.isreg_yzm = '璇疯緭鍏ラ獙璇佺爜';
            $("#reg_sftyjr").val() && $("#reg_sftyjr").val()!= '璇烽€夋嫨'? isAr.isreg_sftyjr = true : isAr.isreg_sftyjr = '璇烽€夋嫨鏄惁閫€褰瑰啗浜�';

            return isAr
        };
    };

    setEffectiveness();
    $('.login-form').on('click', '#showLogin', function() {
        $('.login-form').html(html);
    });

    $('.login-form').on('click', '#resetPassword', function() {
        var user_name = $.trim($('#user_name').val());
        var sfzhm = $.trim($('#sfzhm').val());
        var password = security.hex_md5($.trim($('#password').val()));
        var valid_code = $.trim($('#valid_code').val());

        if (!user_name) {
            return $.showMessage('瀛﹀彿涓嶈兘涓虹┖锛�');
        }
        if (!sfzhm) {
            return $.showMessage('韬唤璇佸彿鍚庡叚浣嶄笉鑳戒负绌猴紒');
        }
        if (!testPass($.trim($('#password').val()))) {
            return $.showMessage('鏂板瘑鐮佸繀椤诲ぇ浜�8浣嶅苟涓旀槸澶у皬鍐欏瓧姣嶅拰鏁板瓧缁勫悎',3000);
        }
        if (!valid_code) {
            return $.showMessage('鍥惧舰楠岃瘉鐮佷笉鑳戒负绌猴紒');
        }

        var data = {
            user_name: user_name,
            sfzhm: sfzhm,
            valid_code: valid_code
        };
        data['mm'] = password;

        $.ajax({
            url:'/login/get_encode_token',
            type:'post',
            data:{
                code:$.trim($("#password").val())
            },
            success: function (result) {
                if(result.code == 1){
                    ajaxReset(data,result.data);
                }else{
                    $('.img_code').attr('src', '/login/validcode?' + Math.random());
                    $.showMessage(result.msg,3000);
                }
            },
            error:function () {
                $.showMessage('鏈嶅姟鍣ㄨ繛鎺ュけ璐ワ紒');
            }
        });
    });

    $('.login-form').on('click', '#span_ico_eye', function(){
        var is_eye_open = $(this).hasClass('glyphicon-eye-open');
        if(is_eye_open){
            $(this).removeClass('glyphicon-eye-open').addClass('glyphicon-eye-close').attr('title', '瀵嗙爜涓嶅彲瑙�');
            $('#password').attr('type', 'password');
        }
        else{
            $(this).removeClass('glyphicon-eye-close').addClass('glyphicon-eye-open').attr('title', '瀵嗙爜鍙');
            $('#password').attr('type', 'text');
        }
    });


    //娉ㄥ唽
    $('.login-form').on('click', '#showReg', function() {
        $("#reg_block").show();
    });
    //鍙栨秷娉ㄥ唽
    $('#reg_hide').click(function () {
        $("#reg_block").hide();
    });
    //鍒锋柊楠岃瘉鐮�
    $('.img_code').click(function () {
        $('.img_code').attr('src', '/login/validcode?' + Math.random());
    });
    //娉ㄥ唽-鏄剧ず瀵嗙爜
    $('#reg_ico_eye').click(function(){
        var is_eye_open = $(this).hasClass('glyphicon-eye-open');
        if(is_eye_open){
            $(this).removeClass('glyphicon-eye-open').addClass('glyphicon-eye-close').attr('title', '瀵嗙爜涓嶅彲瑙�');
            $('#reg_password').attr('type', 'password');
        }
        else{
            $(this).removeClass('glyphicon-eye-close').addClass('glyphicon-eye-open').attr('title', '瀵嗙爜鍙');
            $('#reg_password').attr('type', 'text');
        }
    });

    var _reg_flag = false;
    //娉ㄥ唽-鎻愪氦
    $("#btnReg").click(function () {
        //鍙栨暟鏍￠獙蹇呭～
        var data = {
            reg_mobile:$.trim($("#reg_mobile").val()),
            reg_valid_code:$.trim($("#reg_valid_code").val()),
            reg_year:$.trim($("#reg_year").val()),
            reg_school_name:$.trim($("#reg_school_name").val()),
            reg_zy:$.trim($("#reg_zy").val()),
            reg_xl:$.trim($("#reg_xl").val()),
            reg_xh:$.trim($("#reg_xh").val()),
            reg_xm:$.trim($("#reg_xm").val()),
            reg_xb: $.trim($("#reg_xb").val()),
            reg_szfh:$.trim($("#reg_szfh").val())
        }

        for(var key in data){
            if(data[key] == '') {
                $.showMessage("璇疯緭鍏�" + $("#" + key).prop('placeholder'));
                $("#" + key).focus();
                return;
            }
        }
        if(data.reg_mobile.length != 11){
            $.showMessage('璇疯緭鍏ユ纭殑鎵嬫満鍙�');
            $("#reg_mobile").focus();
            return;
        }
        //瀵嗙爜涓嶈兘灏忎簬6浣嶆暟
        if (data.reg_szfh.length != 6) {
            $.showMessage('璇疯緭鍏ヨ韩浠借瘉鍚庡叚浣�');
            $("#reg_szfh").focus();
            return;
        }

        if (!_reg_flag) {
            _reg_flag = true;
            $.ajax({
                url: '/login/reg',
                type: 'post',
                dataType: "json",
                data: data,
                success: function (result) {
                    _reg_flag = false;
                    $.showMessage(result.msg,2000);
                    if (result.code == 1) {
                        $("#reg_block").hide();
                        //鑷姩濉厖璐﹀彿瀵嗙爜鐧诲綍
                        $("#user_name").val(data.reg_mobile);
                        $("#password").val(data.reg_szfh);
                        login();
                    }
                    else {
                        $('.img_code').attr('src', '/login/validcode?' + Math.random());
                    }
                },
                error:function(){
                    _reg_flag = false;
                    $.showMessage('鐧诲綍澶辫触锛屾湇鍔″櫒杩炴帴澶辫触锛�');
                }
            });
        } else {
            $.showMessage('璇蜂笉瑕侀噸澶嶇櫥褰�');
        }
    });

    $('.login-form').on('click', '.img_code', function(){
        $(this).attr('src', '/login/validcode?'+Math.random());
    });

    var ajaxReset = function(data,t) {
        $.ajax({
            url: '/login/reset_password',
            type: 'post',
            data: data,
            headers:{
                t:t
            },
            success: function(result) {
                $('.img_code').attr('src', '/login/validcode?'+Math.random());

                if (result.code == 1) {
                    $.showMessage('淇敼鎴愬姛锛�');
                    setTimeout(function() {
                        location.reload();
                    }, 2000);
                } else {
                    $.showMessage(result.msg);
                }
            }
        });
    };

    var html = '';
    var resetHtml = [];
    resetHtml.push('<p class="f18 mb18">閲嶇疆瀵嗙爜</p>');
    resetHtml.push('<table id="reset_block">');
    resetHtml.push('<tr><td>瀛﹀彿</td><td><input type="text" id="user_name" class="form-control"></td></tr>');
    resetHtml.push('<tr><td>韬唤璇佸悗鍏綅</td><td><input type="text" id="sfzhm" class="form-control"></td></tr>');
    resetHtml.push('<tr><td>鏂板瘑鐮�</td><td style="position:relative;"><input type="text" id="password" class="form-control"><span class="glyphicon glyphicon-eye-open" title="瀵嗙爜鍙" id="span_ico_eye" aria-hidden="true"></span></td></tr>');
    resetHtml.push('<tr><td>鍥惧舰鐮�</td><td><input type="text" id="valid_code" class="form-control"><img class="img_code" src="/login/validcode" style="height:33px;"></td></tr>');
    resetHtml.push('<tr><td><input type="button" id="resetPassword" class="btn-pr ok-btn" value="鎻愪氦"></td><td><span id="showLogin" class="login_tips" style="margin-left:10px;">宸叉湁璐﹀彿锛熷幓鐧诲綍</span></td></tr>');
    resetHtml.push('</table>');
    resetHtml = resetHtml.join('');

    /**
     * 寮卞瘑鐮佽韩浠芥牎楠�
     */
    var identityAuth = function () {
        $.message({
            title: '鎻愮ず',
            content: '' +
                '<div class="form-group" style="text-align: center;font-size: 20px;font-weight: bold">\n' +
                '棣栨鐧诲綍锛岄渶瑕佹偍鍏堣繘琛岃韩浠介獙璇�' +
                '</div>' +
                '<div class="form-group"><label for="xm" class="control-label"><span style="color: red">*</span>濮撳悕锛�</label><input id="xm" type="text" maxlength="20" class="form-control" placeholder="璇疯緭鍏ュ鍚�"/></div>' +
                '<div class="form-group"><label for="sfzh" class="control-label"><span style="color: red">*</span>韬唤璇佸彿锛�</label><input id="sfzh" maxlength="18" type="text" class="form-control" placeholder="璇疯緭鍏ヨ韩浠借瘉鍙�"/></div>' +
                '<div class="form-group"><label for="xh" class="control-label"><span style="color: red">*</span>瀛﹀彿锛�</label><input id="xh" type="text" class="form-control" placeholder="璇疯緭鍏ュ鍙�"/></div>'+
                '<div class="form-group"><label for="zy" class="control-label"><span style="color: red">*</span>涓撲笟锛�</label><input id="zy" type="text" class="form-control" placeholder="璇疯緭鍏ヤ笓涓�"/></div>'+
                '<div class="form-group"><label for="xy" class="control-label"><span style="color: red">*</span>瀛﹂櫌锛�</label><input id="xy" type="text" class="form-control" placeholder="璇疯緭鍏ュ闄�"/></div>',
            btns: [['鍙栨秷', function () {
                this.close();
            }], ['涓嬩竴姝�', function () {
                var _this = this;

                //琛ㄥ崟鏁版嵁鎺ユ敹
                var postData = {};
                postData.xm =$.trim($("#xm").val());
                postData.sfzh =$.trim($("#sfzh").val());
                postData.xh =$.trim($("#xh").val());
                postData.zy =$.trim($("#zy").val());
                postData.xy =$.trim($("#xy").val());

                //蹇呭～鏍￠獙
                if(!postData.xm){
                    $.showMessage('璇疯緭鍏ュ鍚�');
                    return false;
                }
                if(!postData.sfzh){
                    $.showMessage('璇疯緭鍏ヨ韩浠借瘉鍙�');
                    return false;
                }
                if(!postData.xh){
                    $.showMessage('璇疯緭鍏ュ鍙�');
                    return false;
                }
                if(!postData.zy){
                    $.showMessage('璇疯緭鍏ヤ笓涓�');
                    return false;
                }
                if(!postData.xy){
                    $.showMessage('璇疯緭鍏ュ闄�');
                    return false;
                }

                //璋冪敤韬唤璁よ瘉鎺ュ彛
                $.ajax({
                    url:'/login/authinfo',
                    type:'post',
                    data:postData,
                    success: function (result) {
                        if(result.code == 0){
                            _this.close();
                            setPaddWork(postData)
                        }else{
                            var msg_dialog = $.message({
                                title: '鎻愮ず',
                                content: '<p style="text-align: center;font-weight: bold;font-size: 16px">鎮ㄧ殑韬唤璇佷俊鎭湭閫氳繃璁よ瘉</p>' +
                                    '<p style="text-align: center;font-weight: bold;font-size: 16px">璇疯皟鏁磋緭鍏ラ」鍚庡啀娆¤繘琛岃璇�</p>',
                                btns: [['鍙栨秷', function () {
                                    this.close();
                                }], ['鍐嶆璁よ瘉', function () {
                                    this.close();
                                }]],
                            });

                            $(msg_dialog.node).find('.ui-dialog-close').remove();
                            $(msg_dialog.node).find('button[i-id="鍙栨秷"]').remove();
                            $(document).off('keydown');
                        }
                    },
                    error:function () {
                        $.showMessage('鏈嶅姟鍣ㄨ繛鎺ュけ璐ワ紒');
                    }
                });


                return false;
            }]]
        });
        $(".ui-dialog-close").remove();
        $(".ui-dialog-button [type=button]").eq(0).remove();
        $(document).off('keydown');
    };

    /**
     * 璁よ瘉鎴愬姛鍚庤缃瘑鐮�
     */
    var setPaddWork = function (postData) {
        var pass_dialog = $.message({
            title: '鎻愮ず',
            content:
                '<div class="form-group" style="text-align: left;border: 1px solid #ccc">鏍规嵁鍥藉缃戠粶淇℃伅瀹夊叏瑕佹眰锛岀櫥褰曠殑瀵嗙爜蹇呴』绗﹀悎浠ヤ笅瑙勫垯锛�' +
                '<p>1銆佸瘑鐮侀暱搴﹀ぇ浜庣瓑浜�10浣嶏紝</p>' +
                '<p>2銆佸繀椤绘槸澶у皬鍐欏瓧姣嶅拰鏁板瓧鐨勭粍鍚堛€�</p></div>'+
                '<div class="form-group"><label for="pass2" class="control-label"><span style="color: red">*</span>瀵嗙爜锛�</label><input id="mm" type="password" maxlength="20" class="form-control" placeholder="璇疯緭鍏ュ瘑鐮�"/></div>' +
                '<div class="form-group"><label for="pass1" class="control-label"><span style="color: red">*</span>閲嶅杈撳叆鏂板瘑鐮侊細</label><input id="mm2" type="password" maxlength="20" class="form-control" placeholder="璇疯緭鍏ラ噸澶嶈緭鍏ユ柊瀵嗙爜"/></div>',
            btns: [['鍙栨秷', function () {
                this.close();
            }], ['鎻愪氦', function () {
                var _self = this;
                //琛ㄥ崟鏀堕泦
                var _postData = postData;
                _postData.mm = $.trim($('#mm').val());
                var mm2 = $.trim($('#mm2').val());

                //蹇呭～鏍￠獙
                if(!_postData.mm){
                    $.showMessage('璇疯緭鍏ュ瘑鐮�',3000);
                    return false;
                }
                if(!mm2){
                    $.showMessage('璇疯緭鍏ラ噸澶嶈緭鍏ユ柊瀵嗙爜',3000);
                    return false;
                }
                if(_postData.mm != mm2){
                    $.showMessage('涓ゆ瀵嗙爜杈撳叆涓嶄竴鑷�',3000);
                    return false;
                }
                if (!testPass2(_postData.mm) || !testPass2(mm2)) {
                    $.showMessage('鏂板瘑鐮佸繀椤诲ぇ浜庣瓑浜�10浣嶅苟涓旀槸澶у皬鍐欏瓧姣嶅拰鏁板瓧缁勫悎',3000);
                    return false;
                }

                //璋冪敤淇敼瀵嗙爜鎺ュ彛
                $.ajax({
                    url:'/login/authsubmit',
                    type:'post',
                    data:_postData,
                    success: function (result) {

                        $.showMessage(result.msg);
                        if(result.code == 0){
                            _self.close();
                        }
                    },
                    error:function () {
                        $.showMessage('鏈嶅姟鍣ㄨ繛鎺ュけ璐ワ紒');
                    }
                });
                return false;
            }]],
        });

        $(pass_dialog.node).find('.ui-dialog-close').remove();
        $(pass_dialog.node).find('button[i-id="鍙栨秷"]').remove();
        $(document).off('keydown');
    }
});
