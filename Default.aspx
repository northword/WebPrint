<%@ page language="C#" autoeventwireup="true" codefile="Default.aspx.cs" inherits="Print" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>打印服务器WEB端</title>
    <link rel="stylesheet" href="style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
</head>

<body>
    <h1>打印文件</h1>
    <main class="agile-its">
        <h2>B103 Brother HL 2240D</h2>
        <div class="print">
            <div class="header">
                <div class="tips">
                    <span>支持格式:</span>
                    <ul class="listtype">
                        <li>PDF (.pdf)</li>
                        <li>图片 (.png .jpg .tiff)</li>
                        <li>文本 (.txt)</li>
                        <li>Word (.doc .docx .rtf)</li>
                    </ul>
                </div>
                <div class="warn">
					<ul class="listtype">
						<li>仅 PDF 支持<code>"选页"</code>设置</li>
						<li>Word 可能有排版兼容问题，尤其不建议doc</li>
						<li>默认单面打印且无法更改</li>
						<li>提交后请等一会儿，别手抽一直点</li>
						<li></li>
					</ul>					
				</div>
				<p><a href="./weixin_file_tutor.html"><b>微信接收的文件：</b>文件详情页右上角`···` -> 保存到手机 -> 在这里点上传 -> <code>./Download/Weixin</code></a></p>
            </div>
			<div id="messages">
				<asp:label id="Message" runat="server"></asp:label>
			</div>
            <form id="upload" method="POST" enctype="multipart/form-data">
                <div class="agileinfo">
                    <div id="filedrag">
                        <span class="uploadtip">点击上传文件<br />
                            或者拖拽至此<br />
                            支持多个文件<br /></span>
                    </div>
                    <input type="file" id="files" name="files[]" multiple="multiple" required="required" accept=".pdf,.doc,.docx,.rtf,.txt,image/jpg,image/tiff,image/png" />
                </div>
                <div class="agileinfo inputbox">
                    <% if (needPwd) {
                     string pwd =String.IsNullOrEmpty(Request.Form["password"])?(String)Session["pwd"]:Request.Form["password"].Trim();
                    %>
                    <input type='password' name='password' id='password' onfocus="type='text'" onblur="type='password'" placeholder='打印密码' required='required' value='<%=pwd%>' />
                    <% } %>
                </div>
                <div class="agileinfo inputbox" id="copies">
                    <input name="copies" type="number" value="1" title="份数" placeholder="设置份数" required />
                </div>
                <div class="agileinfo inputbox">
                    <input name="range" type="text" title="页码范围如:2-8 或1,3,5" placeholder="PDF页码:2-5或3,5 (默认所有页)" />
                </div>
                <button type="submit" id="submit" onsubmit="this.disabled=true" disabled>提交</button>
            </form>
        </div>
    </main>
    <footer>
        <p>This page is based on open source projects <a href="https://github.com/NewFuture/WebPrint">NewFuture/WebPrint</a> </p>
		<p>Modified by <a href="https://github.com/Northword/WebPrint" >Jianbei Zhang</a>, 2021.6.21</p>
    </footer>
    <script src="file.js"></script>

</body>

</html>
