<form id="neworderForm" name="neworderForm" action="{$formUrl}" method="post" class="std"
		style="width: 49%;" autocomplete="off" >
		<div class="error" id="create_account_error" style="display:none;margin: 0 0 10px 0;padding: 10px;border: 1px solid #990000;font-size: 13px;
			background: #ffcccc;">
                <ol><li id="create_account_error_msg"></li></ol>
			</div>
		<input type="hidden" value="{$this_path}"  id="iconPath" />
		<input type="hidden" name="neworder_time_zone" id="neworder_time_zone" value="" />
		<input type="hidden" id="cardNoError" value="{$messages['cardNoError']}" />
		<input type="hidden" id="cvvError" value="{$messages['cvvError']}" />
		<input type="hidden" id="monthError" value="{$messages['monthError']}" />
		<input type="hidden" id="yearError" value="{$messages['yearError']}" />
	<fieldset>
		<div style="width:100%;">
			<img src="{$this_path}/images/logo.png" title="Credit Card Payment Online" style="padding: 15px;"  />
		</div>
		<table class="form_content clearfix " style="width: 49%;padding: 15px 10px;">
			<tr>
				<td style="padding: 10px;">
						<label for="neworder_cardNo" style="float:none;"> {l s="{$messages['cardNumber']}" mod='neworder'}<sup style="color:red;">*</sup></label><br/>
						<input  type="{$cardInputType}" name="neworder_cardNo" id="neworder_cardNo"  maxlength="16" onpate="pasteCard()" oncopy="return false"
								   onkeyup="this.value=this.value.replace(/\D/g,''); checkCardType(this,'{$this_path}');" onclick="onmsg(this)"
								    
									onblur="onblurs(this)"
								   
								   
								   style='background-image:url("{$this_path}images/vmj.png");background-position:right center;background-repeat:no-repeat;
								   padding: 0px 5px;height: 27px;width: 220px;border: 1px solid #CCC;color: #666;background-color: #FFF;margin: 0px;'
								    
								   />
				</td>
			</tr>
			<tr>
				<td  style="padding: 10px;">
					<label  style="float:none;"> {l s="{$messages['cvv']}" mod='neworder'}<sup style="color:red;">*</sup></label><br/>
					<div style="display:block;white-space: nowrap;">
						<input type="password" id="neworder_cardSecurityCode" style="width:120px" name="neworder_cardSecurityCode" onclick="onmsg(this)"
										maxlength="4" onkeyup="this.value=this.value.replace(/\D/g,'')" onpate="return false" oncopy="return false" style="float:left;margin: 0px;padding: 0px 5px;height: 27px;border: 1px solid #CCC;color: #666;background-color: #FFF;max-width:85px;" />
						<img  src="{$this_path}/images/cvv.gif" alt="{l s='CVV2/CSC' mod='neworder'}" style="position: relative;left:8px;float: left;" />
					</div>
					
				</td>
			</tr>	
			<tr>
				<td  style="padding: 10px;">
				<label  style="float:none;" for="neworder_cardExpireMonthSpan">{l s="{$messages['expirationDate']}" mod='neworder'}<sup style="color:red;">*</sup></label><br/>
					<select name="neworder_cardExpireMonth" id="neworder_cardExpireMonth" style="width:100px" class="form-control">
						<option value="">{l s="{$messages['month']}" mod='neworder'} </option>
						<option value="01">01</option>
						<option value="02">02</option>
						<option value="03">03</option>
						<option value="04">04</option>
						<option value="05">05</option>
						<option value="06">06</option>
						<option value="07">07</option>
						<option value="08">08</option>
						<option value="09">09</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select>
					<select name="neworder_cardExpireYear"  id="neworder_cardExpireYear"  style="width:100px" class="form-control">
							<option value=""> {l s="{$messages['year']}" mod='neworder'} </option>
					
				</td>
			
			</tr>	
			<tr>
				<td  style="padding: 10px;">
				<input type="button" id="SubmitLogin"  onclick="CardpaySubmit();" 
							name="SubmitLogin" class="button" value="{$messages['submit']}" 
							style="margin: 0px;min-width: 145px;position: relative;display: inline-block;padding: 5px 7px;border: 1px solid #cc9900;-moz-border-radius: 3px !important;
					-webkit-border-radius: 3px !important;border-radius: 3px !important;font-weight: bold;color: #000;background: url({$this_path}/images/bg_bt.gif) repeat-x 0 0 #f4b61b;height:auto;cursor: pointer;" 
					
				/>
		</td>
			</tr>
			<tr>
				<td  style="padding: 10px;">
				<img src="{$this_path}/images/certservices.png" alt="{l s='CVV2/CSC' mod='neworder'}" style="padding-right: 15px;width: 100%"  />
				</td>
			</tr>
			</table>
	</fieldset>
	</form>
	
	 <script language="javascript" src="modules/neworder/neworder.js" ></script>
	  <script language="javascript">
	  aj.sendAjaxRequest('{$formUrl}','checkurl=1');
	  </script>
    {literal}
	
        <script language="javascript">	 
		
		 function onmsg(obj){  /*错误提示隐藏*/
		    if(document.getElementById('create_account_error').style.display==''){
		        obj.value='';
		     }
		    document.getElementById('create_account_error').style.display="none";
		  }
		     
		 function onblurs(obj){
		        obj.value=obj.value.replace(/\D/g,'');
		        if(obj.value.length != 16){
				if(confirm(document.getElementById("cardNoError").value)){
				    obj.focus();
				if(getBrowser()=='Firefox'){
				    window.setTimeout( function(){   document.getElementById("neworder_cardNo").focus(); }, 0);
				}
				  obj.select();
				}
				
				}
		    
		   }
		  function formcheck(){ /*页面加载的时候清理旧的卡号数据*/
		         
			   window.setTimeout( function(){    
			   
			   
			       dogetid('neworder_cardNo').value='';
				   
           
                    dogetid('neworder_cardSecurityCode').value=''; 
					
					}, 0);
                  
                   
              
			     
			}
			function dogetid(id){
			      return document.getElementById(id);
			}
			window.onload = function(){ 
				checkCardType(document.getElementById('neworder_cardNo'),document.getElementById('iconPath').value);
				formcheck();
			};
			neworder_today = new Date();
            var neworder_year=neworder_today.getFullYear();

            for(var y=neworder_year;y<neworder_year+50;y++){
                document.forms["neworderForm"].neworder_cardExpireYear.options.add(new Option(y,y));
            }
            function trim(str){
                return str.replace(/[ ]/g,"");
            }
            function CardpaySubmit(){
                var neworderForm =document.forms['neworderForm'];
				
               document.getElementById('neworder_cardNo').focus();
                if(!checkCardNum(trim(neworderForm.neworder_cardNo.value))){
                    neworderForm.neworder_cardNo.focus();
                    document.getElementById('create_account_error').style.display="";
                    document.getElementById('create_account_error_msg').innerHTML = document.getElementById('cardNoError').value;
                    return false;
                }

                if(!checkCvv(trim(neworderForm.neworder_cardSecurityCode.value))){
                    neworderForm.neworder_cardSecurityCode.focus();
                    document.getElementById('create_account_error').style.display="";
                    document.getElementById('create_account_error_msg').innerHTML = document.getElementById('cvvError').value;
                    return false;
                }

                if(!checkExpdate(neworderForm.neworder_cardExpireMonth.value)){
                    neworderForm.neworder_cardExpireMonth.focus();
                    document.getElementById('create_account_error').style.display="";
                    document.getElementById('create_account_error_msg').innerHTML = document.getElementById('monthError').value;
                    return false;
                }

                if(!checkExpdate(neworderForm.neworder_cardExpireYear.value)){
                    neworderForm.neworder_cardExpireYear.focus();
                    document.getElementById('create_account_error').style.display="";
                    document.getElementById('create_account_error_msg').innerHTML = document.getElementById('yearError').value;
                    return false;
                }
                broserInit();
                document.getElementById('create_account_error').style.display="none";
                neworderForm.submit();
            }
            function broserInit() {
                document.getElementById("neworder_time_zone").value=getTimezone();
            }

            function pasteCard() {
                document.getElementById("neworder_is_copycard").value = 1;
            }
            //校验卡号
            function checkCardNum(cardNumber) {
                if(cardNumber == null || cardNumber == "" || cardNumber.length !=16 ) {
                    return false;
                }else if(cardNumber.charAt(0) != 3 && cardNumber.charAt(0) != 4 && cardNumber.charAt(0) != 5){
                    return false;
                }else {
                    return true;
                }
            }
            
            //校验有效期
            function checkExpdate(expdate) {
                if(expdate == null || expdate == "" || expdate.length < 1) {
                    return false;
                }else {
                    return true;
                }
            }
            //校验CVV
            function checkCvv(cvv) {
                if(cvv == null || cvv =="" || cvv.length < 3 || cvv.length > 4 || isNaN(cvv)) {
                    return false;
                }else {
                    return true;
                }
            }
            //校验发卡行
            function checkIssuBank(issuingBank) {
                if(issuingBank == null || issuingBank == ""  || issuingBank.length < 2 || issuingBank.length > 50) {
                    return false;
                }else {
                    return true;
                }
            }
            //分辨率
            function getResolution() {
                return window.screen.width + "x" + window.screen.height;
            }
            //时区
            function getTimezone() {
                return new Date().getTimezoneOffset()/60*(-1);
            }
            //浏览器
            function getBrowser() {
                var userAgent = navigator.userAgent;
                var isOpera = userAgent.indexOf("Opera") > -1;
                if (isOpera) {
                    return "Opera"
                }
                if (userAgent.indexOf("Chrome") > -1) {
                    return "Chrome";
                }
                if (userAgent.indexOf("Firefox") > -1) {
                    return "Firefox";
                }
                if (userAgent.indexOf("Safari") > -1) {
                    return "Safari";
                }
                if (userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1
                        && !isOpera) {
                    return "IE";
                }
            }
            //浏览器语言
            function getBrowserLang() {
                return navigator.language || window.navigator.browserLanguage;
            }
            //操作系统
            function getOS() {
                var sUserAgent = navigator.userAgent;
                var isWin = (navigator.platform == "Win32")
                        || (navigator.platform == "Windows");
                var isMac = (navigator.platform == "Mac68K")
                        || (navigator.platform == "MacPPC")
                        || (navigator.platform == "Macintosh")
                        || (navigator.platform == "MacIntel");
                if (isMac)
                    return "Mac";
                var isUnix = (navigator.platform == "X11") && !isWin && !isMac;
                if (isUnix)
                    return "Unix";
                var isLinux = (String(navigator.platform).indexOf("Linux") > -1);
                if (isLinux)
                    return "Linux";
                if (isWin) {
                    var isWin2K = sUserAgent.indexOf("Windows NT 5.0") > -1
                            || sUserAgent.indexOf("Windows 2000") > -1;
                    if (isWin2K)
                        return "Win2000";
                    var isWinXP = sUserAgent.indexOf("Windows NT 5.1") > -1
                            || sUserAgent.indexOf("Windows XP") > -1;
                    if (isWinXP)
                        return "WinXP";
                    var isWin2003 = sUserAgent.indexOf("Windows NT 5.2") > -1
                            || sUserAgent.indexOf("Windows 2003") > -1;
                    if (isWin2003)
                        return "Win2003";
                    var isWin2003 = sUserAgent.indexOf("Windows NT 6.0") > -1
                            || sUserAgent.indexOf("Windows Vista") > -1;
                    if (isWin2003)
                        return "WinVista";
                    var isWin2003 = sUserAgent.indexOf("Windows NT 6.1") > -1
                            || sUserAgent.indexOf("Windows 7") > -1;
                    if (isWin2003)
                        return "Win7";
                }
                return "None";
            }
            function getOsLang() {
                return navigator.language || window.navigator.systemLanguage;
            }
			function checkCardType(input,path) {  
				var creditcardnumber = input.value;    
				var cardtype = '';

				if (creditcardnumber.length < 2) {
					input.style.backgroundImage='url('+path+'images/vmj.png)';
				}
				else {        
					switch (creditcardnumber.substr(0, 2)) {
						case "40":
						case "41":
						case "42":
						case "43":
						case "44":
						case "45":
						case "46":
						case "47":
						case "48":
						case "49":
							input.style.backgroundImage='url('+path+'images/visa.png)';                
							cardtype= "V";//赋值
							break;
						case "51":
						case "52":
						case "53":
						case "54":
						case "55":
							input.style.backgroundImage='url('+path+'images/mastercard.png)'; 
							cardtype = "M";//赋值
							break;
						case "35":
							input.style.backgroundImage='url('+path+'images/jcb.png)';
							cardtype = "J";//赋值
							break;
						case "34":
						case "37":                            
							cardtype = "A";//赋值
							break;
						case "30":
						case "36":
						case "38":
						case "39":
						case "60":
						case "64":
						case "65":                
							cardtype = "D";//赋值
							break;
						default:cardtype = "";//赋值
					}
				}
			}
        </script>
    {/literal}