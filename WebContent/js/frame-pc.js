var _error_info = new Array();
_error_info["0"] = "\u627e\u4e0d\u5230\u670d\u52a1\u5668\uff01";
_error_info["400"] = "\u8bf7\u6c42\u65e0\u6548";
_error_info["401.1"] = "\u672a\u6388\u6743\uff1a\u767b\u5f55\u5931\u8d25";
_error_info["401.2"] = "\u672a\u6388\u6743\uff1a\u670d\u52a1\u5668\u914d\u7f6e\u95ee\u9898\u5bfc\u81f4\u767b\u5f55\u5931\u8d25";
_error_info["401.3"] = "ACL \u7981\u6b62\u8bbf\u95ee\u8d44\u6e90";
_error_info["401.4"] = "\u672a\u6388\u6743\uff1a\u6388\u6743\u88ab\u7b5b\u9009\u5668\u62d2\u7edd";
_error_info["401.5"] = "\u672a\u6388\u6743\uff1aISAPI \u6216 CGI \u6388\u6743\u5931\u8d25";
_error_info["403"] = "\u7981\u6b62\u8bbf\u95ee";
_error_info["403.1"] = "\u7981\u6b62\u8bbf\u95ee\uff1a\u7981\u6b62\u53ef\u6267\u884c\u8bbf\u95ee";
_error_info["403.2"] = "\u7981\u6b62\u8bbf\u95ee\uff1a\u7981\u6b62\u8bfb\u8bbf\u95ee";
_error_info["403.3"] = "\u7981\u6b62\u8bbf\u95ee\uff1a\u7981\u6b62\u5199\u8bbf\u95ee";
_error_info["403.4"] = "\u7981\u6b62\u8bbf\u95ee\uff1a\u8981\u6c42 SSL";
_error_info["403.5"] = "\u7981\u6b62\u8bbf\u95ee\uff1a\u8981\u6c42 SSL 128";
_error_info["403.6"] = "\u7981\u6b62\u8bbf\u95ee\uff1aIP \u5730\u5740\u88ab\u62d2\u7edd";
_error_info["403.7"] = "\u7981\u6b62\u8bbf\u95ee\uff1a\u8981\u6c42\u5ba2\u6237\u8bc1\u4e66";
_error_info["403.8"] = "\u7981\u6b62\u8bbf\u95ee\uff1a\u7981\u6b62\u7ad9\u70b9\u8bbf\u95ee";
_error_info["403.9"] = "\u7981\u6b62\u8bbf\u95ee\uff1a\u8fde\u63a5\u7684\u7528\u6237\u8fc7\u591a";
_error_info["403.11"] = "\u7981\u6b62\u8bbf\u95ee\uff1a\u5bc6\u7801\u66f4\u6539";
_error_info["403.12"] = "\u7981\u6b62\u8bbf\u95ee\uff1a\u6620\u5c04\u5668\u62d2\u7edd\u8bbf\u95ee";
_error_info["403.13"] = "\u7981\u6b62\u8bbf\u95ee\uff1a\u5ba2\u6237\u8bc1\u4e66\u5df2\u88ab\u540a\u9500";
_error_info["403.15"] = "\u7981\u6b62\u8bbf\u95ee\uff1a\u5ba2\u6237\u8bbf\u95ee\u8bb8\u53ef\u8fc7\u591a";
_error_info["403.16"] = "\u7981\u6b62\u8bbf\u95ee\uff1a\u5ba2\u6237\u8bc1\u4e66\u4e0d\u53ef\u4fe1\u6216\u8005\u65e0\u6548";
_error_info["403.17"] = "\u7981\u6b62\u8bbf\u95ee\uff1a\u5ba2\u6237\u8bc1\u4e66\u5df2\u7ecf\u5230\u671f\u6216\u8005\u5c1a\u672a\u751f\u6548";
_error_info["404.1"] = "\u65e0\u6cd5\u627e\u5230 Web \u7ad9\u70b9";
_error_info["404"] = "\u65e0\u6cd5\u627e\u5230\u6587\u4ef6";
_error_info["405"] = "\u8d44\u6e90\u88ab\u7981\u6b62";
_error_info["406"] = "\u65e0\u6cd5\u63a5\u53d7";
_error_info["407"] = "\u8981\u6c42\u4ee3\u7406\u8eab\u4efd\u9a8c\u8bc1";
_error_info["410"] = "\u6c38\u8fdc\u4e0d\u53ef\u7528";
_error_info["412"] = "\u5148\u51b3\u6761\u4ef6\u5931\u8d25";
_error_info["414"] = "\u8bf7\u6c42 ,URI \u592a\u957f";
_error_info["500"] = "\u5185\u90e8\u670d\u52a1\u5668\u9519\u8bef";
_error_info["500.1"] = "\u5185\u90e8\u670d\u52a1\u5668\u9519\u8bef ,ASP \u9519\u8bef";
_error_info["500.11"] = "\u670d\u52a1\u5668\u5173\u95ed";
_error_info["500.12"] = " \u5e94\u7528\u7a0b\u5e8f\u91cd\u65b0\u542f\u52a8";
_error_info["500.13"] = "\u670d\u52a1\u5668\u592a\u5fd9";
_error_info["500.14"] = "\u5e94\u7528\u7a0b\u5e8f\u65e0\u6548";
_error_info["500.15"] = "\u4e0d\u5141\u8bb8\u8bf7\u6c42 global.asa";
_error_info["501"] = "\u672a\u5b9e\u73b0";
_error_info["502"] = "\u7f51\u5173\u9519\u8bef";
function getErrorMsg(code) {
    if (_error_info) {
        if (_error_info[code]) {
            return _error_info[code];
        } else {
            console.debug("\u672a\u5b9a\u4e49\u7684\u5f02\u5e38\uff01");
            return "\u672a\u5b9a\u4e49\u7684\u5f02\u5e38\uff01";
        }
    } else {
        console.debug("\u5f02\u5e38\u4fe1\u606f\u672a\u521d\u59cb\u5316\uff01");
        return "\u5f02\u5e38\u4fe1\u606f\u672a\u521d\u59cb\u5316\uff01";
    }
}
var BaseUrl = "/";
var pageUrl = BaseUrl + "_page/";
var ajaxUrl = BaseUrl + "ajax.do";
/**
 * ����
 */
var AjaxDebug = true;
/**
 * �Ƿ񵯳�ajax�����ʾ
 */
var isAjaxAlert = false;
/**
 * ����ajaxǰ��:input״̬
 */
var _input_status = new Array();
/**
 * �������һ��ajax��ķ��ؽ��������Ϊһ��map  returnData['xx']
 */
var returnData = null;
/**
 * �ϴ�״̬
 */
var uploadStatus = false;
/**
 * ҳ����صĵȴ�����
 */
var changeLoading = null;
/**
 * ҳ����صȴ��Ķ�ʱ��
 */
var changeLoadingTime = null;
/**
 * ��ֹ�û���ε������ֹʱ��
 */
var balkTime = 1000;
/**
 * ҳ���еĿɲ���Ԫ�أ��ı���Ͱ�ť��
 */
var pageElement;
/**
 * ajax�Ľ�������ʱ��
 */
var ajaxLoading = null;
/**
 * ҳ��Ĳ˵���
 */
var mid = null;
/**
 * ҳ���·��
 */
var pagePath = null;
/**
 * data table jquery �����Ĭ�Ϻ���Ƥ������$(document.ready())�и�ֵ
 */
var tableTheme = null;
/**
 * ��ʼ��һЩ�����ڴ��ڼ������֮����ܻ�ȡ�Ĳ���
 */
function getTopHight() {
    try {
        return $(getTopWindows()).scrollTop();
    } catch (e) {
        return 0;
    }
}

/**
 * ��ȡ���Ĵ���
 */
function getTopWindows() {
    var win = window;
    while (win != parent) {
        win = win.parent;
    }
    return win;
}

/**
 * ��ʾ��
 * @param content ��ʾ�����ݣ�����Ϊ��
 * @param title ��ʾ��ı��⣬��Ϊ��
 * @param dialog ��ȶ�����ʾʱʹ�ã���һ��json���󣬲ο�jquery ui ��dialog������
 * @param html ��ȶ�����ʾʱʹ�ã����ݵ�html���롣
 */
function alertMsg(content, title, dialog, html) {
    alert(content);
}
/**
 * ɾ�����б���Ĭ���ύ�¼���
 * ��form�е���س�����Ĭ�ϵ��ύ�¼�
 */
$(document).ready(function() {
    //���ڼ��� ����������
    changeLoading = $("<div/>").addClass("_loading").css("display", "none").appendTo("body");
    $("<img/>").attr({
        "src": BaseUrl + "images/loading.gif",
        "width": "200"
    }).css("margin", "auto").prependTo(changeLoading);
    $("<h2/>").attr("align", "center").css("margin", "15px").html("���ڼ���").prependTo(changeLoading);

    $("td[col]").live("click", tableTdClick);       //Ϊʹ��padBackTable�������ı��ί���¼�
});
/**
 * ��ʾ���ؽ���
 */
function showLoading() {
    changeLoading.css("left", $(window).width() / 2 - 100);
    changeLoadingTime = setTimeout(function() {
        changeLoading.fadeIn(300);      //��ʾ�ȴ�����ʾ����
    }, 500);        //800ms ����ʾ�ȴ�����
}
/**
 * ���ؼ��ؽ���
 */
function hideLoading() {
    clearTimeout(changeLoadingTime);    //�����ʾ������ȡ����ʱ��
    changeLoading.fadeOut();     //����ѵ��������صȴ�����ʾ����
}

/**
 * ��ʾjson���ݰ�����
 */
function showData(d) {
    var str = "";
    for (var i in d) {
        str = str + i + " : " + d[i] + "\n";
    }
    return str;
}

/**
 * json����ת�ַ�����ʽ
 */
function json2str(o) {
    var arr = [];
    var fmt = function(s) {
        if (typeof s == 'object' && s != null)
            return json2str(s);
        return /^(string|number)$/.test(typeof s) ? "'" + s + "'" : s;
    }
    for (var i in o)
        arr.push("'" + i + "':" + fmt(o[i]));
    return '{' + arr.join(',') + '}';
}

/**
 * ��ǰ ʱ��
 */
function getNowTime() {
    var time = new Date();
    return time.getHours() + ":" + time.getMinutes() + ":" + time.getSeconds();
}

/**
 * ��ǰ ���� + ʱ��
 */
function getNowDateTime() {
    var time = new Date();
    return time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate() + " " + time.getHours() + ":" + time.getMinutes() + ":" + time.getSeconds();
}

/**
 * ��ǰ ����
 */
function getNowDate() {
    var time = new Date();
    return time.getFullYear() + "-" + (time.getMonth() + 1) + "-" + time.getDate();
}

/**
 * Ajax��Options���󣬿ɶ�Ajax������ϸ����
 * �����Ϊ������뿪��
 * @param formId �����ύ����Χ��������pageҲ���Ծ����form��һ��ʹ��page��
 */
AjaxOptions = function(formId) {
    /**
     * ��ִ��ajax����������Ƿ������ʾ<br />���ͣ�boolean
     */
    this.isAlert = true;
    /**
     * ���������Ϊ�첽���������Ҫ����ͬ�������뽫��������Ϊfalse
     * ���ͣ� Boolean
     */
    this.async = true;

    /**
     * �����������ajax����ʱ���û��Ƿ���Խ������롣
     * ����Ϊtrueʱ��ajax�ڼ����б���ȫΪdisabled״̬��
     */
    this.noInput = true;
    /**
     * Ҫ�ύ�ı�
     */
    this.form = $(formId);

    /**
     * (Ĭ�ϣ�true�� dataTypeΪscript��jsonpʱĬ��Ϊfalse) ����Ϊfalse���������ҳ��
     * ���� Boolean
     */
    this.cache = false;

    /**
     * ���ͣ� String
     */
    this.url = ajaxUrl;

    /**
     * ���ͣ�boolean
     * Ϊtrueʱ��ʾ�������һ��ҳ�棬Ϊfalseʱ��ʾ�������һ������
     */
    this.isPage = false;

    /**
     * ������Ϣ���ָ������
     */
    this.padBackElement = undefined;
    /**
     * �Ƿ����
     */
    this.isPadBack = true;

    /**
     * ���ͣ� Object
     */
    this.data = "";
    if (this.form.length) {//�жϱ��Ƿ�Ϊ��
        this.data = this.form.serialize();
        if (!$.trim(this.data)) {
            this.data = this.form.find("form").serialize();
        }
    }


    /**
     * Ĭ�ϵĳɹ��ص�����
     * @param data ���������ص�����
     */
    this.success = function(data) {
        hideLoading();      //����
        if (this.isPage) {
            if ($.isFunction(this.sus)) {
                console.debug("��ʼִ���Զ���ĳɹ��ص�������");
                this.sus(data);
            }
            if ($.isFunction(this.after)) {
                console.debug("��ʼִ���Զ����after������");
                this.after(200, "�ɹ�");
            }
            return;
        }
        try {
            this.responseData = eval('(' + data + ')');       //���ַ���תΪjson
        } catch (e) {
            this.responseData = {
                'head': {}
            };
        }
        if (this.responseData.head.response_code != "000000") {
            //�쳣����
            console.error("�쳣����=" + this.responseData.head.response_code + "  ����=" + this.responseData.head.response_desc);
            alertMsg(this.responseData.head.response_desc + " :\n" + this.responseData.error_msg);
            if ($.isFunction(this.fal)) {
                console.warn("ִ���쳣����ʼ����ʧ�ܻص�������");
                this.fal(this.responseData.head.response_desc, this.responseData.head.response_code);
                return;
            }
        }
        if (this.isPadBack) {
            padBackData(this.responseData, this.padBackElement);        //�ѷ������ݻ��ҳ��
        }
    };

    /**
     * ������ɺ�ص����� (����ɹ���ʧ��֮�������)��
     * ������ XMLHttpRequest �����һ�������ɹ��������͵��ַ�����
     * ���ͣ� function(XMLHttpRequest, textStatus)
     */
    this.complete = function(request, status) {
        hideLoading();      //����
        if (status == "success") {
            if (this.isPage)
                return;     //����������ҳ�棬ֱ���˳�
            if (this.responseData.head.response_code == "000000") {
                if (this.isAlert) {
                    console.debug("�����ɹ���");
                }
                if ($.isFunction(this.sus)) {
                    console.debug("��ʼִ���Զ���ĳɹ��ص�������");
                    if (this.responseData.result) {
                        this.sus(this.responseData.result);
                    } else {
                        this.sus(this.responseData);
                    }
                }
            }
            if ($.isFunction(this.after)) {
                console.debug("��ʼִ��finally����");
                this.after(this.responseData.head.response_code, this.responseData.head.response_desc);
            }
        }
        //        getReturnDateObj().append(" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������ " + getNowTime());
    };

    /**
     * ��������ǰ���޸� XMLHttpRequest ����ĺ�����������Զ��� HTTP ͷ��XMLHttpRequest ������Ψһ�Ĳ�����
     * ����һ�� Ajax �¼����������false����ȡ������ajax����
     * ���ͣ� function(XMLHttpRequest)
     */
    this.beforeSend = function(XMLHttpRequest) {
        this.data = this.data + "&_type=ajax&m_id=" + mid;
        var nowTime = getNowTime();
        console.debug("url:\t" + this.url + "\ndata:\t" + this.data.replace(/&/g, "\n\t") + "\ntype:\t" + this.type + "\ntime:\t" + nowTime);
        //showLoading();
        return true;
    };

    /**
     * (Ĭ��: "application/x-www-form-urlencoded") ������Ϣ��������ʱ���ݱ������͡�Ĭ��ֵ�ʺϴ���������
     * �������ȷ�ش�����һ��content-type�� $.ajax() ��ô���ض��ᷢ�͸�����������ʹû������Ҫ���ͣ�
     * ���ͣ� String
     */
    this.contentType = "application/x-www-form-urlencoded; charset=utf-8";

    /**
     * ���������������Ajax��ػص������������ġ�
     * Ҳ����˵���ûص�������thisָ���������������趨�����������ôthis��ָ����ñ���AJAX����ʱ���ݵ�options��������
     * ����ָ��һ��DOMԪ����Ϊcontext������������������success�ص�������������Ϊ���DOMԪ�ء�
     * ���ͣ�Object�� (document.body)
     */
    this.context = undefined;

    /**
     * ��Ajax���ص�ԭʼ���ݵĽ���Ԥ����ĺ�����
     * �ṩdata��type����������data��Ajax���ص�ԭʼ���ݣ�type�ǵ���jQuery.ajaxʱ�ṩ��dataType������
     * �������ص�ֵ����jQuery��һ������
     * ���ͣ� function(data, type)
     */
    this.dataFilter = function(data, type) {
        if (type) {
            console.debug("dataFilter-->data type:" + type);
        }
        return data;
    };

    /**
     * Ԥ�ڷ��������ص��������͡�
     * �����ָ����jQuery ���Զ����� HTTP �� MIME ��Ϣ�������жϣ�����XML MIME���;ͱ�ʶ��ΪXML��
     * ��1.4�У�JSON�ͻ�����һ��JavaScript���󣬶�script���ִ������ű������������˷��ص����ݻ�������ֵ�����󣬴��ݸ��ص�����������ֵ:
     *      "xml": ���� XML �ĵ������� jQuery ����
     *      "html": ���ش��ı� HTML ��Ϣ��������script��ǩ���ڲ���domʱִ�С�
     *      "script": ���ش��ı� JavaScript ���롣�����Զ�������������������"cache"������'''ע�⣺'''��Զ������ʱ(����ͬһ������)������POST���󶼽�תΪGET����(��Ϊ��ʹ��DOM��script��ǩ������)
     *      "json": ���� JSON ���� ��
     *      "jsonp": JSONP ��ʽ��ʹ�� JSONP ��ʽ���ú���ʱ���� "myurl?callback=?" jQuery ���Զ��滻 ? Ϊ��ȷ�ĺ���������ִ�лص�������
     *      "text": ���ش��ı��ַ���
     * ���ͣ�String
     */
    this.dataType = undefined;

    /**
     * (Ĭ��: �Զ��ж� (xml �� html)) ����ʧ��ʱ���ô˺�����
     * ����������������XMLHttpRequest ���󡢴�����Ϣ������ѡ��������쳣����
     * ��������˴��󣬴�����Ϣ���ڶ������������˵õ�null֮�⣬��������"timeout", "error", "notmodified" �� "parsererror"��
     * ���ͣ� function(XMLHttpRequest, textStatus, errorThrow)
     */
    this.error = function(request, status, error) {
        switch (status) {
            case "timeout":
                console.error("����ʱ�����Ժ�������Ƿ�ɹ���");
                error_msg = "����ʱ�����Ժ�������Ƿ�ɹ���";
                alertMsg("����ʱ�����Ժ�������Ƿ�ɹ���");
                break;
            case "error":
            case "notmodified":
            case "parsererror":
                var error_msg = null;
                try {
                    if (request.status == 0 || request.status == 1 || request.status == 2 || request.status == 3) {
                        //0 (δ��ʼ��), 1 (����װ��), 2 (װ�����), 3 (������), 4 (���)
                        error_msg = "ϵͳ���ڵȴ���Ӧ�����Ժ�";
                    } else {
                        error_msg = _error_info[request.status];
                        if (!error_msg) {
                            error_msg = "�������δ���壡";
                            console.error("�������δ���壡");
                        }
                    }
                } catch (e) {
                    console.error("function : AjaxOptions.error()\nname : " + e.name + "\nmessage : " + e.message + "\n ������Ϣδ���룡");
                    error_msg = "�������δ���壡";
                }
                console.error("(" + request.status + ")" + error_msg);
                break;
            default:
                console.error("������δ��Ӧ��");
                error_msg = "������δ��Ӧ��";
                alertMsg("������δ��Ӧ��");
                break;
        }
        if ($.isFunction(this.fal)) {
            console.debug("��ʼִ���Զ�����쳣�ص�������");
            this.fal(error_msg, request.status);
        }
        if ($.isFunction(this.after)) {
            console.debug("��ʼִ��finally����");
            this.after(request.status, error_msg);
        }
    };

    /**
     * (Ĭ��: true) �Ƿ񴥷�ȫ�� AJAX �¼�������Ϊ false �����ᴥ��ȫ�� AJAX �¼�.
     */
    this.global = true;

    /**
     * (Ĭ��: false) ���ڷ��������ݸı�ʱ��ȡ�����ݡ�ʹ�� HTTP �� Last-Modified ͷ��Ϣ�жϡ�
     */
    this.ifModified = false;

    /**
     * ��һ��jsonp��������д�ص����������֡�
     * ���ֵ���������"callback=?"����GET��POST������URL�������"callback"���֣�
     * ����{jsonp:'onJsonPLoad'}�ᵼ�½�"onJsonPLoad=?"������������
     * ���ͣ� String
     */
    this.jsonp = undefined;

    /**
     * Ϊjsonp����ָ��һ���ص���������
     * ���ֵ������ȡ��jQuery�Զ����ɵ������������
     * ����Ҫ������jQuery���ɶȶ��صĺ�����������������������ף�Ҳ�ܷ�����ṩ�ص������ʹ�����
     * ��Ҳ�������������������GET�����ʱ��ָ������ص���������
     * ���ͣ� String
     */
    this.jsonpCallback = undefined;

    /**
     * ������ӦHTTP������֤���������
     * ���ͣ� String
     */
    this.password = undefined;

    /**
     * (Ĭ��: true) Ĭ������£�ͨ��dataѡ��ݽ��������ݣ�
     * �����һ������(�����Ͻ�ֻҪ�����ַ���)�����ᴦ��ת����һ����ѯ�ַ����������Ĭ���������� "application/x-www-form-urlencoded"��
     * ���Ҫ���� DOM ����Ϣ��������ϣ��ת������Ϣ��������Ϊ false��
     */
    this.processData = true;

    /**
     * ֻ�е�����ʱdataTypeΪ"jsonp"��"script"������type��"GET"�Ż�����ǿ���޸�charset��ͨ��ֻ�ڱ��غ�Զ�̵����ݱ��벻ͬʱʹ�á�
     * ���ͣ� String
     */
    this.scriptCharset = undefined;

    /**
     * ������ӦHTTP������֤������û���
     * ���ͣ� String
     */
    this.username = undefined;

    /**
     * ע��������Ϊ�첽ʱ��Ч
     * ���ͣ� Number
     */
    this.timeout = 10000;

    /**
     * ���ͣ� String
     */
    this.type = "post";

    /**
     * �Զ���ĳɹ��ص�����
     * @param data ajax���ص�����
     */
    this.sus = undefined;

    /**
     * �Զ�����쳣�ص�����
     */
    this.fal = function(desc, code) {
        //alert("ϵͳ����: " + code + " -- " + desc);
    };

    /**
     * �Զ����finally����
     */
    this.after = function(code, desc) {

    };

    /**
     * ���������ص����� map����
     */
    this.responseData = undefined;
    /**
     * ��data�����Ӳ���
     */
    this.put = function(key, value) {
        this.data = this.data.putParam(key, value);
    };
    /**
     * ��ȡdata�е�ֵ
     */
    this.get = function(key) {
        return this.data.getParam(key);
    };
    /**
     * ɾ��data�еĲ���
     */
    this.remove = function(key) {
        this.data = this.data.remove(key);
    };
};

/**
 * ��һ���򵥵����ݶ�����cloneҳ��
 * @param data�� ajax��������
 * @param form�� form�� ��ѡ
 * @return Boolean
 */
function padBackData(data, form) {
    //������ݻ��Ŀǰ��������ֻ�ܴ���һ����񣬵��ͻ��˵�JS(����һ�δ���)�ɴ�����
    //�����������, �����, �������, ������, ������, ��񳤶�, ������, ��HTML����
    var tempType, tempSet, tempArr, tempI;
    //����form��Ϊһ��jQueryѡ����
    if (form && typeof(form) == "string") {
        form = $(form);
        if (!form.length) {
            console.warn("����ʱû���ҵ�Ŀ��ؼ���ֱ�ӻ��document");
            form = $(document);
        }
    } else {
        console.warn("����ʱû���ҵ�Ŀ��ؼ���ֱ�ӻ��document");
        form = $(document);
    }
    try {
        for (var key in data) {
            if (typeof(data[key]) == "object" && key != "head") {
                //��������䵽���
                padBackTable(data[key], key);
            } else {
                tempType = form.find("#" + key).attr("type");        //����ı�������
                if (!tempType) {
                    //ʹ��ID��ȡ����ʱʹ��NAME����
                    tempSet = form.find("[name='" + key + "']");
                    tempType = tempSet.attr("type");
                } else {
                    //��ʹ��ID��ȡ
                    tempSet = form.find("#" + key);
                }
                if (tempType) {
                    switch (tempType) {
                        case "text":
                        case "password":
                        case "hidden":
                        case "textarea":
                            tempSet.attr("value", data[key]);     //ֱ�Ӹ�ֵ
                            break;
                        case "radio":
                            tempSet.each(function() {
                                if ($.trim($(this).attr("value")) == $.trim(data[key])) {
                                    $(this).attr("checked", "checked");
                                }
                            });
                            break;
                        case "checkbox":
                            tempSet.each(function() {
                                tempArr = data[key];//.split(ResCutArr);         //�ָ������е�����Ԫ��
                                //ʹ��ѭ���жϣ�����һ��Ԫ��Ϊ��һ��Ԫ�ص��Ӽ������
                                for (tempI = 0; tempI < tempArr.length; tempI++) {
                                    if (tempArr[tempI] == $.trim($(this).attr("value"))) {
                                        break;
                                    }
                                }
                                if (tempI != tempArr.length) {
                                    $(this).attr("checked", "checked");
                                }
                            });
                            break;
                        default:
                            if (tempType.indexOf("select") != -1) {
                                //�Ե���select��ֵ
                                tempSet.val(data[key]);
                            }
                            break;
                    }
                } else {
                    //�Ǳ�Ԫ��  ʹ��ID
                    tempSet = form.find("#" + key);
                    if (tempSet.length > 0) {
                        tempType = form.find("#" + key).get(0).tagName.toLocaleLowerCase();        //����ı�������
                        switch (tempType) {
                            case "select" :
                            case "textarea" :
                                tempSet.val(data[key]);
                                break;
                            default :
                                var str = data[key];
                                if (typeof(str) == "string") {
                                    str = str.replace(/\r\n/g, "<br />");
                                    str = str.replace(/\n/g, "<br />");
                                    str = str.replace(/\r/g, "<br />");
                                    str = str.replace(/\"/g, "&quot;");
                                    str = str.replace(/\'/g, "&acute;");
                                }
                                tempSet.html(str);
                                break;
                        }
                    }
                }
            }
        }
        return true;
    } catch (e) {
        console.error("function : padBackData()\nname : " + e.name + "\nmessage : " + e.message);
        return false;
    }
}

/**
 * ��һ��json������䵽�����<br />���Ϊtable��ǩ�����ҵ�һ��tr��ǩ��������th��ǩ����ͷ��<br />
 * th��ǩ�а���data-key���ԣ��������е�ֵΪjson�е�key�����û�и����Ի�data��û�и�ֵ�����в��������ֵ
 * @param tableData Ҫ�������ݣ�������һ�����飬�����е�Ԫ��Ϊjson
 * @param tableId ����id
 */
function padBackTable(tableData, tableId) {
    var tableObj, tableLength, keyList, thead, tbody;
    try {
        tableObj = $(tableId);
        if (!tableObj.length) {
            alertMsg(tableId + " ������");
            return;
        }
        if (tableObj.attr("id")) {
            if (tableObj.find("thead").length == 0) {     //���û��thead��ǩ������һ��
                console.debug("��� " + tableId + " û�� thead ��ǩ");
                return;
            }
            thead = tableObj.find("thead");
            if (tableObj.find("tbody").length == 0) {     //���û��tbody��ǩ������һ��
                console.debug("��� " + tableId + " û�� tbody ��ǩ");
                tableObj.append($("<tbody/>"));
            }
            tbody = tableObj.find("tbody");
            tableLength = 0;
            keyList = new Array();
            thead.find("tr th").each(function(i) {
                tableLength++;
                keyList[i] = $(this).attr("data-key");
                if (!keyList[i]) {
                    keyList[i] = "";
                }
            });

            tbody.empty();
            tableObj.data("_content", tableData);
            var tr, td, rowData;
            for (var index in tableData) {
                tr = $("<tr/>").attr("row", index);
                rowData = tableData[index];
                if (typeof(rowData) == "object") {
                    for (var k = 0; k < keyList.length; k++) {
                        td = $("<td/>").attr("col", k);
                        if (keyList[k]) {
                            td.html(rowData[keyList[k]]);
                        } else {
                            td.html("&nbsp;");
                        }
                        tr.append(td);
                    }
                }
                tbody.append(tr);
            }
            tableObj.removeClass("tablelist").addClass("tablelist");

        } else {
            console.warn("��񲻴��ڣ�");
        }
    } catch (e) {
        console.error("function : padBackTable()\nname : " + e.name + "\nmessage : " + e.message);
    }
}
/**
 * ʹ��padBackTable����������ĵ���¼�
 * �ᴥ��ʹ��$.click(funtion(e, r, c, rd, td){})����ϵĵ������
 */
function tableTdClick(e) {
    var row, col, rowData, tableData, tr, table;
    col = $(this).attr("col");
    tr = $(this).parent();
    row = tr.attr("row");
    table = tr.parent().parent();
    tableData = table.data("_content");
    rowData = tableData[row];
    table.trigger("clicktd", [row, col, rowData, tableData]);//��������ϵĵ������
}
/**
 * ���ر���ϰ󶨵�����
 */
function getTableData(selector) {
    return $(selector).data("_content");
}

/**
 * �ѱ�����װ�ɿ��ύ�����ݰ�����jquery��serialize��ȣ�����disabled״̬�����Ա�ǩ
 */
function structFormData(form) {
    form = $(form);
    if (form.length == 0) {
        return "";
    }
    var data = "";
    form.find(":text,:password,:radio:checked,:checkbox:checked,:hidden,textarea").each(function() {
        if ($(this).attr("name")) {
            data = data + $(this).attr("name") + "=" + encodeURI($(this).val()) + "&";
        }
    });
    form.find("select").each(function(i, s) {
        s = $(s);
        if (s.attr("name")) {
            s.find("option:selected").each(function(j, option) {
                option = $(option);
                data = data + s.attr("name") + "=" + encodeURI(option.attr("value")) + "&";
            });
        }
    });
    return data;
}

/**
 * �ѱ�����װ��json
 */
function jsonFormData(form) {
    form = $(form);
    if (form.length == 0) {
        return "";
    }
    var data = {};
    form.find(":text,:password,:radio:checked,:checkbox:checked,:hidden,textarea").each(function() {
        if ($(this).attr("name")) {
            data[$(this).attr("name")] = $(this).val();
        }
    });
    form.find("select").each(function(i, s) {
        s = $(s);
        if (s.attr("name")) {
            s.find("option:selected").each(function(j, option) {
                option = $(option);
                data[s.attr("name")] = option.attr("value");
            });
        }
    });
    return data;
}

/**
 * ִ�в�ѯSQL���
 * @param sql ��ѯ���
 * @param sus �ɹ��ص�����
 * @param fal ʧ�ܻص�����
 */
function queryAsync(sql, sus, fal) {
    if (!$.trim(sql)) {
        alertMsg("sql��䲻��Ϊ��");
        return;
    }
    var pix = $.trim(sql).substr(0, 6);
    if (pix != "select") {
        alertMsg("query����ֻ��ִ�в�ѯ���");
        return;
    }
    var o = new AjaxOptions();
    o.isAlert = false;
    o.isPadBack = false;
    o.put("service_code", "01");
    o.put("sql", encodeURIComponent(sql));
    if ($.isFunction(sus)) {
        o.sus = sus;
    }
    console.log("ִ�е�SQL��䣺" + sql);
    o.fal = fal;
    $.ajax(o);
}

/**
 * ��ѯ��ͬ������
 * @param {string} sql
 * @returns {unresolved} ��ѯ���
 */
function query(sql) {
    if (!$.trim(sql)) {
        alertMsg("sql��䲻��Ϊ��");
        throw new Error("sql��䲻��Ϊ��");
    }
    var pix = $.trim(sql).substr(0, 6);
    if (pix != "select") {
        alertMsg("query����ֻ��ִ�в�ѯ���");
        throw new Error("query����ֻ��ִ�в�ѯ���");
    }
    var res = null;
    var o = new AjaxOptions();
    o.async = false;
    o.isAlert = false;
    o.isPadBack = false;
    o.put("service_code", "01");
    o.put("sql", encodeURIComponent(sql));
    o.sus = function(result) {
        if (result && result.length > 0) {
            res = result;
        }
    };
    o.fal = function(error) {
        throw new Error(error);
    };
    console.log("ִ�е�SQL��䣺" + sql);
    $.ajax(o);
    return res;
}

/**
 * ִ�и���SQL���
 * @param sql SQL���
 * @param sus �ɹ��ص�����
 * @param fal ʧ�ܻص�����
 */
function updateAsync(sql, sus, fal) {
    if (!$.trim(sql)) {
        alertMsg("sql��䲻��Ϊ��");
        return;
    }
    var pix = $.trim(sql).substr(0, 6);
    if (pix != "update" && pix != "insert" && pix != "delete") {
        alertMsg("update����ֻ��ִ�и������");
        return;
    }
    var o = new AjaxOptions();
    o.isAlert = false;
    o.isPadBack = false;
    o.put("service_code", "02");
    o.put("sql", encodeURIComponent(sql));
    if ($.isFunction(sus)) {
        o.sus = sus;
    }
    console.log("ִ�е�SQL��䣺" + sql);
    o.fal = fal;
    $.ajax(o);
}

/**
 * ͬ��ִ�и���SQL���
 * @param sql SQL���
 */
function update(sql) {
    if (!$.trim(sql)) {
        alertMsg("sql��䲻��Ϊ��");
        throw new Error("sql��䲻��Ϊ��");
    }
    var pix = $.trim(sql).substr(0, 6);
    if (pix != "update" && pix != "insert" && pix != "delete") {
        alertMsg("update����ֻ��ִ�и������");
        throw new Error("update����ֻ��ִ�и������");
    }
    var res = null;
    var o = new AjaxOptions();
    o.isAlert = false;
    o.isPadBack = false;
    o.async = false;
    o.put("service_code", "02");
    o.put("sql", encodeURIComponent(sql));
    o.sus = function(result) {
        res = result["update_row_count"];
    };
    o.fal = function(error) {
        throw new Error(error);
    };
    console.log("ִ�е�SQL��䣺" + sql);
    $.ajax(o);
    return res;
}
/**
 * ����ִ�и���SQL���
 * @param sqls SQL���
 * @param sus �ɹ��ص�����
 * @param fal ʧ�ܻص�����
 */
function batchUpdateAsync(sqls, sus, fal) {
    if (!sqls) {
        alertMsg("sql��䲻��Ϊ��");
        return;
    }
    if (typeof(sqls) != "array" && typeof(sqls) != "object") {
        alertMsg("���봫��һ��sql���");
        return;
    }
    if (sqls.length < 1) {
        alertMsg("sql��䲻��Ϊ��");
        return;
    }
    for (var i = 0; i < sqls.length; i++) {
        console.log("ִ�е�SQL��� " + i + "��" + sql);
        var sql = sqls[i];
        var pix = $.trim(sql).substr(0, 6);
        if (pix != "update" && pix != "insert" && pix != "delete") {
            alertMsg("�� " + i + " ��SQL��䲻�Ǹ�����䣡");
            return;
        }
        sqls[i] = encodeURIComponent(sql);
    }
    var o = new AjaxOptions();
    o.isAlert = false;
    o.isPadBack = false;
    o.put("service_code", "03");
    o.put("sql", sqls);
    if ($.isFunction(sus)) {
        o.sus = sus;
    }
    o.fal = fal;
    $.ajax(o);
}
/**
 * ͬ������ִ�и���SQL���
 * @param sqls SQL���
 */
function batchUpdate(sqls) {
    if (!sqls) {
        alertMsg("sql��䲻��Ϊ��");
        return;
    }
    if (typeof(sqls) != "array" && typeof(sqls) != "object") {
        alertMsg("���봫��һ��sql���");
        return;
    }
    if (sqls.length < 1) {
        alertMsg("sql��䲻��Ϊ��");
        return;
    }
    for (var i = 0; i < sqls.length; i++) {
        console.log("ִ�е�SQL��� " + i + "��" + sql);
        var sql = sqls[i];
        var pix = $.trim(sql).substr(0, 6);
        if (pix != "update" && pix != "insert" && pix != "delete") {
            alertMsg("�� " + i + " ��SQL��䲻�Ǹ�����䣡");
            throw new Error("�� " + i + " ��SQL��䲻�Ǹ�����䣡");
        }
        sqls[i] = encodeURIComponent(sql);
    }
    var res = null;
    var o = new AjaxOptions();
    o.async = false;
    o.isAlert = false;
    o.isPadBack = false;
    o.put("service_code", "03");
    o.put("sql", sqls);
    o.sus = function(result) {
        res = result["update_rows_count"];
    };
    o.fal = function(error) {
        throw new Error(error);
    };
    $.ajax(o);
    return res;
}
/**
 * ���ajax����ʱ��data����<br />
 * ��ȡһ��������ֵ
 */
String.prototype.getParam = function(key) {
    return dataToMap(this)[key];
};
/**
 * ���ajax����ʱ��data����<br />
 * ɾ��һ������<br />
 * �����᷵��һ���µ��ַ�������Ҫ��ԭ�ַ������¸�ֵ
 */
String.prototype.removeParam = function(key) {
    var map = dataToMap(this);
    map[key] = null;
    return structData(map);
};

/**
 * ���ajax����ʱ��data����<br />
 * ����һ������������ò����Ѿ��������滻<br />
 * �����᷵��һ���µ��ַ�������Ҫ��ԭ�ַ������¸�ֵ
 */
String.prototype.putParam = function(key, value) {
    var map = dataToMap(this);
    map[key] = value;
    return structData(map);
};

/**
 * ��jquery serialize()ת�ı�����תΪmap
 * @param data ������
 */
function dataToMap(data) {
    var arr = data.split("&");
    var map = new Object();
    var kv;
    for (var i in arr) {
        kv = arr[i].split("=");
        if (kv.length == 2) {
            if (map[kv[0]]) {
                if (typeof(map[kv[0]]) == "string") {
                    var vr = new Array();
                    vr[0] = map[kv[0]];
                    vr[1] = kv[1];
                    map[kv[0]] = vr;
                } else {
                    map[kv[0]][map[kv[0]].length] = kv[1];
                }
            } else {
                map[kv[0]] = kv[1];
            }
        }
    }
    return map;
}

/**
 * ��map��json��װ�ɱ����ݰ�������������飬�����Ԫ�ز�����json����
 */
function structData(data) {
    if (!data) {
        return "";
    }
    if (typeof(data) != "object") {
        return data;
    }
    var str = "";
    for (var i in data) {
        if (!data[i]) {
            continue;
        }
        if (str) {
            str = str + "&";
        }
        if (typeof(data[i]) == "object") {
            for (var j in data[i]) {
                str = str + i + "=" + data[i][j] + "&";
            }
        } else {
            str = str + i + "=" + data[i];
        }
    }
    return str;
}

/**
 * ��array��json��װ�ɱ����ݰ�������������飬�����е�Ԫ�ؿ����Ǽ򵥵�json���󣬷�json���󲻴���
 */
function structArrayData(data) {
    if (!data) {
        return "";
    }
    if (typeof(data) != "object") {
        return data;
    }
    var str = "";
    var arr = {};
    for (var i in data) {
        if (!data[i]) {
            continue;
        }
        if (typeof(data[i]) == "object") {
            for (var j in data[i]) {
                if (!arr[j]) {
                    arr[j] = (data[i][j] ? data[i][j] : "null");
                } else {
                    arr[j] = arr[j] + "#@#" + (data[i][j] ? data[i][j] : "null");
                }
            }
        }
    }
    for (var i in arr) {
        if (str) {
            str = str + "&";
        }
        str = str + i + "=" + arr[i];
    }
    return str;
}

/**
 * ����Javascript��ÿ������(Object)��prototype���� ΪJavascript�е����ö�����ӷ��������ԡ�
 */
String.prototype._length = function()
{
    var len = 0;
    for (var i = 0; i < this.length; i++)
        if (this.charCodeAt(i) >= 10000) {
            len += 2;
        } else {
            len++;
        }
    return len;
};
/**
 * ��֤������Ϊ��
 */
function notNull(i_field, obj)
{
    var i_value = $.trim($(obj).attr("value"));
    $(obj).attr("value", i_value);
    if (i_value == "" || i_value == null)
    {
        return i_field + "����Ϊ�գ�";
    }
    return 1;
}
/**
 * �����½��
 */
function username(i_field, obj) {
    var value = $.trim($(obj).val());
    $(obj).val(value);
    var patrn = /^[a-zA-Z0-9]{1}([a-zA-Z0-9]|[._-]){4,19}$/;
    if (!patrn.exec(value)) {
        return i_field + "����Ϊ5��19λ��Ӣ�ĺ�����";
    } else {
        return 1;
    }
}
/**
 * ��������
 */
function password(i_field, obj) {
    var value = $.trim($(obj).val());
    $(obj).val(value);
    var patrn = /^[a-zA-Z0-9]{1}([a-zA-Z0-9]|[._-]){4,19}$/;
    if (!patrn.exec(value)) {
        return i_field + "����Ϊ5��19λ��Ӣ�ĺ�����";
    } else {
        return 1;
    }
}
/**
 * ���麺��
 */
function isChinese(i_field, i_length, obj)
{
    var i_value = $.trim($(obj).attr("value"));
    i_value = delspace(i_value);
    $(obj).attr("value", i_value);
    var hzyz = notNull(i_field, obj);
    if (hzyz != 1)
        return hzyz;
    var hzcd = dyLength(i_field, i_length, obj);
    if (hzcd != 1) {
        return hzcd;
    }
    for (i = 0; i < i_value.length; i++) {
        if (i_value.charCodeAt(i) < 128)
            return "'" + i_field + "'ֻ��Ϊ����";
    }
    return 1;
}
/**
 * �����������
 */
function hasChinese(i_field, obj)
{
    var i_value = $.trim($(obj).attr("value"));
    i_value = delspace(i_value);
    var hzyz = notNull(i_field, obj);
    if (hzyz != 1)
        return hzyz;
    for (i = 0; i < i_value.length; i++) {
        if (i_value.charCodeAt(i) > 128)
            return "'" + i_field + "'���ܰ�������";
    }
    return 1;
}

/**
 *����֤������ zjmc��A 18λ���֤�� H 15λ���֤
 *��ȷ����1
 */
function check_zjhm(zjmc, zjhm) {
    var birthday = "";
    var zjhm1 = "";
    var zjhm2 = "";
    var s = "";
    //    var zjhmObj = document.getElementById(zjhm);
    var zjhmObj = $(zjhm);
    zjhmObj.attr("value", $.trim(zjhmObj.attr("value")));
    zjhmObj.attr("value", zjhmObj.attr("value").toUpperCase());
    zjhmObj.attr("value", delspace(zjhmObj.attr("value")));
    //    $( zjhm).attr("value", zjhmObj.value);
    zjhm = zjhmObj.attr("value");
    if (!zjhm) {
        return "֤�����벻��Ϊ��";
    }
    if (zjmc == "A" || zjmc == "H") { //���֤����
        if (zjmc == 'H' && zjhm.length != 15) {
            return "���֤�����볤�Ȳ���ȷ,���飡";
        }
        if (zjmc == 'A' && zjhm.length != 18) {
            return "���֤�����볤�Ȳ���ȷ,���飡";
        }
        zjhm1 = zjhm;
        if (zjhm.length == 18) {
            zjhm1 = zjhm.substr(0, 17);
            zjhm2 = zjhm.substr(17, 1);
        }

        re = new RegExp("[^0-9]");
        s = zjhm1.match(re);
        if (s != null && s != "") {
            return "�����ֵ�к��зǷ��ַ�'" + s + "'���飡";
        }
        //ȡ��������
        if (zjhm.length == 15) {
            birthday = "19" + zjhm.substr(6, 6);
        } else {
            re = new RegExp("[^0-9A-Z]");
            s = zjhm2.match(re);
            if (s != null && s != "") { //18λ���֤��ĩλҪ�����ֻ��ַ�
                return "�����ֵ�к��зǷ��ַ�'" + s + "'���飡";
            }
            birthday = zjhm.substr(6, 8);
        }
        birthday = birthday.substr(0, 4) + "-" + birthday.substr(4, 2) + "-" + birthday.substr(6, 2);
        var birthyz = isDateBirthday("���֤�����������", birthday, zjhmObj);
        if (birthyz != 1) { //������ڵĺϷ���
            return birthyz;
        }
        if (zjhm.length == 18) {
            return (sfzCheck(zjhm, zjhmObj)); //��18λ�������֤����ĩλУ��
        } else {
            return sfzCheck(id15to18(zjhm));
        }
    } else if (zjmc == "B") {
        if (!(zjhm.length == 9 || zjhm.length == 10)) {
            return "��֯�������볤��ӦΪ9λ��10λ��";
        }

    }
    return 1;
}
/**
 * ����У��
 * @param {type} i_field
 * @param {type} obj
 * @returns {undefined}
 */
function isDate(i_field,obj){
    return isDateBirthday(i_field,$.trim($(obj).attr("value")));
}

/**
 * ����У��
 * @param i_field ����lable
 * @param thedate ����ֵ(�ַ���)
 */
function isDateBirthday(i_field, thedate) {
    var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/;
    var r = thedate.match(reg);
    if (r == null)
    {
        return "'" + i_field + "' ���Ƿ��ַ���";

    }
    var d = new Date(r[1], r[3] - 1, r[4]);
    var newStr = d.getFullYear() + r[2] + (d.getMonth() + 1) + r[2] + d.getDate();
    var newDate = r[1] + r[2] + (r[3] - 0) + r[2] + (r[4] - 0);
    if (newStr == newDate)
    {
        return 1;
    }
    return "'" + i_field + "'���ڸ�ʽ����,ӦΪYYYY-MM-DD��";
}

function sfzCheck(hm, obj) {
    var w = new Array();
    var ll_sum;
    var ll_i;
    var ls_check;
    w[0] = 7;
    w[1] = 9;
    w[2] = 10;
    w[3] = 5;
    w[4] = 8;
    w[5] = 4;
    w[6] = 2;
    w[7] = 1;
    w[8] = 6;
    w[9] = 3;
    w[10] = 7;
    w[11] = 9;
    w[12] = 10;
    w[13] = 5;
    w[14] = 8;
    w[15] = 4;
    w[16] = 2;
    ll_sum = 0;

    for (ll_i = 0; ll_i <= 16; ll_i++) {
        ll_sum = ll_sum + (hm.substr(ll_i, 1) - 0) * w[ll_i];

    }
    ll_sum = ll_sum % 11;

    switch (ll_sum) {
        case 0 :
            ls_check = "1";
            break;
        case 1 :
            ls_check = "0";
            break;
        case 2 :
            ls_check = "X";
            break;
        case 3 :
            ls_check = "9";
            break;
        case 4 :
            ls_check = "8";
            break;
        case 5 :
            ls_check = "7";
            break;
        case 6 :
            ls_check = "6";
            break;
        case 7 :
            ls_check = "5";
            break;
        case 8 :
            ls_check = "4";
            break;
        case 9 :
            ls_check = "3";
            break;
        case 10 :
            ls_check = "2";
            break;
    }
    if (hm.substr(17, 1) != ls_check) {
        return "���֤�������";
    }
    return 1
}
/**
 * ���֤��15λת18λ
 */
function id15to18(zjhm) {
    var strJiaoYan = new Array("1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2");
    var intQuan = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1);
    var ll_sum = 0;
    var i;
    zjhm = zjhm.substring(0, 6) + "19" + zjhm.substring(6);
    for (i = 0; i <= 16; i++) {
        ll_sum = ll_sum + (parseFloat(zjhm.substr(i, 1))) * intQuan[i];
    }
    ll_sum = ll_sum % 11;
    zjhm = zjhm + strJiaoYan[ll_sum];
    return zjhm;
}

/**
 * �Զ����������еĿո�
 */
function delspace(string) {
    var temp = "";
    string = '' + string;
    splitstring = string.split(" "); //˫����֮���Ǹ��ո�
    for (i = 0; i < splitstring.length; i++)
        temp += splitstring[i];
    return temp;
}
/**
 * ��鳤��
 */
function isLength(i_field, i_length, obj) {
    var obj_value = $.trim($(obj).attr("value"));
    var i_value = delspace(obj_value);
    $(obj).attr("value", i_value);
    if (!(i_value.length == i_length)) {
        return "'" + i_field + "' �ĳ���Ҫ��Ϊ' " + i_length + " '��";
    }
    return 1;
}
/**
 *����Ƿ�Ϊ��ĸ�������λ����֤����isLength()ʹ��
 */
function isChar(i_field, obj) {
    var value = $.trim($(obj).attr("value"));
    $(obj).attr("value", value);
    var pattern = /^[a-zA-Z]+$/;
    if (!pattern.exec(value)) {
        return i_field + "����Ϊ��ĸ";
    } else {
        return 1;
    }
    ;
}
/**
 *����Ƿ�Ϊ��ĸ�����֣������λ����֤����isLength()ʹ��
 */
function isCharOrNum(i_field, obj) {
    var value = $.trim($(obj).attr("value"));
    $(obj).attr("value", value);
    var pattern = /^[a-zA-Z0-9]+$/;
    if (!pattern.exec(value)) {
        return i_field + "����Ϊ��ĸ������";
    } else {
        return 1;
    }
    ;
}
;
/***
 * ����Ƿ�Ϊ����
 */
function isNum(i_field, obj) {
    var obj_value = $.trim($(obj).attr("value"));
    var i_value = delspace(obj_value);
    $(obj).attr("value", i_value);
    var lengthyz = notNull(i_field, obj);
    if (lengthyz != 1) {
        return lengthyz;
    }

    re = new RegExp("[^0-9.-]");
    var s = i_value.match(re);
    if (s != null && s != "") {
        return "'" + i_field + "' �к��зǷ��ַ� '" + s + "' ��";
    }
    return 1;
}
/**
 * �����������
 */
function check_yzbm(obj) {
    var obj_value = $.trim($(obj).attr("value"));
    $(obj).attr("value", obj_value);
    var yzbmyz = isLength("��������", "6", obj);
    if (yzbmyz != 1) {
        return yzbmyz;
    }
    yzbmyz = isNum("��������", obj);
    if (yzbmyz != 1) {
        return yzbmyz;
    }
    return 1;
}
/**
 * ���鳤�����Ϊi_lengthλ
 */
function xyLength(i_field, i_length, obj) {
    var obj_value = $.trim($(obj).attr("value"));
    var i_value = delspace(obj_value);
    $(obj).attr("value", i_value);
    if (i_value._length() > i_length) {
        return "'" + i_field + "' �ĳ����Ϊ '" + i_length + "' ��";
    }
    return 1;
}
//��������Ϊi_lengthλ
function dyLength(i_field, i_length, obj) {
    var obj_value = $.trim($(obj).attr("value"));
    var i_value = delspace(obj_value);
    $(obj).attr("value", i_value);
    if (i_value.length < i_length) {
        return "'" + i_field + "' �ĳ�������Ϊ '" + i_length + "'��";
    }
    return 1;
}