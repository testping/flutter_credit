const serviceUrl = "https://apps.lvxinkeji.net/api/";
const servicePath={
  'getLogincode':serviceUrl+'user/getcode/', //登陆验证码
  'LoginAndRegister':serviceUrl+'user/register/', //登陆并且注册
  'threeAgreement':serviceUrl+'news/deal',
  'userFinas':serviceUrl+'user/finas',//获取检测报告
  'operators':serviceUrl+'user/mbFinas',//手机运营商获取验证码
  'operatorsLogin':serviceUrl+'user/mobreg',//手机运营商检测
  'recommendMenu':serviceUrl+'pro/menu',//智能推荐菜单
  'recommendIndex':serviceUrl+'pro/index',//智能推荐列表
  'apptionClick':serviceUrl+'pro/apption',//点击贷款产品
};

