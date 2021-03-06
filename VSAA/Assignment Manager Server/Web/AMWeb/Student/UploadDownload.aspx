<%@ Page language="c#" Codebehind="UploadDownload.cs" AutoEventWireup="false" Inherits="Microsoft.VisualStudio.Academic.AssignmentManager.Student.UploadDownload" %>
<%@ Register TagPrefix="AM" TagName="Nav" Src="../UserControls/student.ascx" %>
<%@ Register TagPrefix="AM" TagName="GoBack" Src="../UserControls/goBack.ascx" %>
<HTML>
	<HEAD>
		<TITLE>
			<%Response.Write(Title);%>
		</TITLE>
	</HEAD> <!-- nav user control here -->
	<script language="javascript">
		
		//********************************************// //*** Global Variables ***// //********************************************// //****Global Error strings
	<%
	Response.Write("var err_No_Starter_Files = '" + UploadDownload_err_No_Starter_Files + "';\r\n");
	Response.Write("var err_No_Action = '" + UploadDownload_err_No_Action + "';\r\n");
	Response.Write("var err_No_Files_Downloaded = '" + UploadDownload_err_No_Files_Downloaded + "';\r\n");
	Response.Write("var err_No_Files_Uploaded = '" + UploadDownload_err_No_Files_Uploaded + "';\r\n");
	Response.Write("var err_Server_Location_Not_Found = '" + UploadDownload_err_Server_Location_Not_Found + "';\r\n");
	Response.Write("var err_Local_Download_Location_Not_Exist = '" + UploadDownload_err_Local_Download_Location_Not_Exist + "';\r\n");
	Response.Write("var err_XMLFileList_Load_Failed = '" + UploadDownload_err_XMLFileList_Load_Failed + "';\r\n");
	Response.Write("var err_File_Does_Not_Exist = '" + UploadDownload_err_File_Does_Not_Exist + "';\r\n");
	Response.Write("var err_Attempt_To_Copy = '" + UploadDownload_err_Attempt_To_Copy + "';\r\n");
	Response.Write("var err_Attempt_To_Copy_Failed = '" + UploadDownload_err_Attempt_To_Copy_Failed + "';\r\n");
	Response.Write("var err_Upload_Location_Not_Available = '" + UploadDownload_err_Upload_Location_Not_Available + "';\r\n");
	Response.Write("var err_Download_Location_Not_Available = '" + UploadDownload_err_Download_Location_Not_Available + "';\r\n");
	Response.Write("var prob_Opening_Web_Project = '" + UploadDownload_prob_Opening_Web_Project + "';\r\n");
	Response.Write("var err_Select_Proj_To_Upload = '" + UploadDownload_err_Select_Proj_To_Upload + "';\r\n");
	Response.Write("var err_Terminate_And_Delete = '" + UploadDownload_err_Terminate_And_Delete + "';\r\n");
	Response.Write("var err_The_Copy_of = '" + UploadDownload_err_The_Copy_of + "';\r\n");
	Response.Write("var err_Failed = '" + UploadDownload_err_Failed + "';");
	Response.Write("var err_Exceeded_Max_Size = '" + UploadDownload_err_Exceeded_Max_Size + "';\r\n");
	Response.Write("var err_MB_No_More_Files_Uploaded = '" + UploadDownload_err_MB_No_More_Files_Uploaded + "';\r\n");
	Response.Write("var err_Select_Location = '" + UploadDownload_err_Select_Location + "';\r\n");
	Response.Write("var err_Opening_Project = '" + UploadDownload_err_Opening_Project + "';\r\n");
	Response.Write("var err_Upload_Failed = '" + UploadDownload_err_Upload_Failed + "';\r\n");
	Response.Write("var err_code_hiding_failed = '" + UploadDownload_err_code_hiding_failed + "';\r\n");
	Response.Write("var err_Addin_Not_Loaded = '" + UploadDownload_err_Addin_Not_Loaded + "';\r\n");
	Response.Write("var err_ProjType_Not_Supported = '" + UploadDownload_err_ProjType_Not_Supported + "';\r\n");
	Response.Write("var msg_File_Copy_Complete = '" + UploadDownload_msg_File_Copy_Complete + "';\r\n");
	Response.Write("var msg_Files_Were_Uploaded = '" + UploadDownload_msg_Files_Were_Uploaded + "';\r\n");
	Response.Write("var dir_Code_Stipping_TempDir = '" + UploadDownload_dir_Code_Stipping_TempDir + "';\r\n");
	Response.Write("var btn_Add_Text = '" + UploadDownload_btn_Add_Text + "';\r\n");
	Response.Write("var btn_UploadProject_Text = '" + UploadDownload_btn_UploadProject_Text + "';\r\n");
	Response.Write("var UploadDownload_SelectProject = '" + UploadDownload_SelectProject + "';\r\n");
	Response.Write("var UploadDownload_StatusBarUploadingText = '" + UploadDownload_StatusBarUploadingText + "';\r\n");
	Response.Write("var UploadDownload_CloseCurrentSol = '" + UploadDownload_CloseCurrentSol + "';\r\n");
	Response.Write("var UploadDownload_PromptToSave = '" + UploadDownload_PromptToSave + "';\r\n");
	Response.Write("var UploadDownload_DownloadPrompt = '" + UploadDownload_DownloadPrompt + "';\r\n");
	Response.Write("var UploadDownload_NoSolutionOrProject = '" + UploadDownload_NoSolutionOrProject + "';\r\n");
	Response.Write("var UploadDownload_DownloadRedirectUrl = '" + UploadDownload_DownloadRedirectUrl + "';\r\n");
	Response.Write("var UploadDownload_ProjectAlreadyOpenInSolution = '" + UploadDownload_ProjectAlreadyOpenInSolution + "';\r\n");

	%>
		function CancelClick(){
			var ar = self.document.URL.split("?");
	
			//***Trim the first param to only include the querystring and not the URL
			window.navigate("Assignments.aspx?" + ar[1]);
		}

	</script>
	<script language="jscript" src="../scripts/Miscellaneous.js"></script>
	<script language="jscript" src="../scripts/Download.js"></script>
	<script language="jscript" src="../scripts/Upload.js"></script>
	<AM:NAV id="Nav1" runat="server" name="Nav1"></AM:NAV>
	<form id="frm" method="post" runat="server">
		<div class="mainBody" id="mainBody" style="LEFT: 175px; WIDTH: 600px; POSITION: absolute; TOP: 220px">
			<table style="WIDTH: 80%" cellSpacing="1" border="0">
				<tr>
					<td class="infoTextTitle" style="WIDTH: 50%" align="center">&nbsp;
					</td>
					<td><AM:GOBACK id="GoBack1" runat="server" name="GoBack1"></AM:GOBACK></td>
				</tr>
			</table>
			<div class="invisible" id="divDownload">
				<table style="WIDTH: 80%" cellSpacing="1" border="0">
					<tr>
						<td><asp:label class="infoTextTitle" id="lblDownloadStudentTitle" runat="server" name="lblDownloadStudentTitle"></asp:label></td>
						<td></td>
					</tr>
					<tr>
						<td>&nbsp; <!--spacer--></td>
						<td></td>
					</tr>
					<tr>
						<td><asp:label class="infoText" id="lblDownloadLocationForFiles" runat="server" name="lblDownloadLocationForFiles"></asp:label></td>
						<td></td>
					</tr>
					<tr>
						<td></td>
					</tr>
					<tr>
						<td noWrap align="left" colSpan="2"><input class="infoTextHeaderStyle" id="txtDownloadLocation" style="WIDTH: 400px" type="text">
							<input class=webButton id=btnGetDIR onclick=getDownloadDirectory() type=button value="<%Response.Write(UploadDownload_BrowseButtonText);%>" name=btnGetDIR>
						</td>
					</tr>
					<tr>
						<td>&nbsp; <!--spacer--></td>
						<td></td>
					</tr>
					<tr>
						<td><input class="webButton" id="btnDownload" style="LEFT: 405px; POSITION: relative" onclick="beginDownloadofFiles()"
								type="button" runat="server" width="70px">
						</td>
					</tr>
				</table>
			</div>
			<div class="invisible" id="divProjects">
				<table>
					<tr>
						<td><asp:label class="infoTextTitle" id="lblUploadSubTitle" runat="server" name="lblUploadSubTitle"></asp:label></td>
					</tr>
					<tr>
						<td width="350"><asp:label class="infoText" id="lblUploadDescription" runat="server" name="lblUploadDescription"></asp:label></td>
					</tr>
					<tr>
						<td>&nbsp;
						</td>
					</tr>
					<tr>
						<td><asp:label class="infoText" id="lblAssignmentName" runat="server" name="lblAssignmentName"
								Width="350"></asp:label></td>
					</tr>
					<tr>
						<td><asp:textbox class="infoTextHeaderStyle" id="txtAssignmentName" runat="server" name="txtAssignmentName"
								Width="350"></asp:textbox></td>
					</tr>
					<tr>
						<td><asp:label class="infoText" id="lblSelectProject" runat="server" name="lblSelectProject"></asp:label></td>
					</tr>
					<tr>
						<td><select id="cboProject" style="WIDTH: 350px" name="cboProject"></select>
						</td>
					</tr>
					<tr>
						<td><input class=webButton id=btnSendFilesToServer2 style="LEFT: 85px; WIDTH: 130px; POSITION: relative" onclick="return UploadProject(cboProject, true, false);" type=submit value="<%Response.Write(UploadDownload_btn_UploadProject_Text);%>">
							<input class=webButton id=btnCancel style="LEFT: 85px; WIDTH: 130px; POSITION: relative" onclick="CancelClick()" type=reset value="<%Response.Write(UploadDownload_btnCancel_Text);%>">
						</td>
					</tr>
				</table>
			</div>
			<input id="txtNewGUID" style="VISIBILITY: hidden" runat="server"> <input id="txtUploadLocation" style="VISIBILITY: hidden" runat="server">
			<input id="txtDownloadFolderLocation" style="VISIBILITY: hidden" runat="server">
			<input id="txtFilesUploadedXML" style="VISIBILITY: hidden" runat="server"> <input id="txtDownloadFilesXML" style="VISIBILITY: hidden" runat="server">
			<input id="txtSolutionName" style="VISIBILITY: hidden" runat="server"> <input id="txtMaxUploadSize" style="VISIBILITY: hidden" runat="server">
			<input class="invisible" id="chkRemoveStudentCode" type="checkbox"> <input id="txtCancel" style="VISIBILITY: hidden" name="txtCancel" runat="server">
			<input class="invisible" id="txtExistingStarterProject" name="txtExistingStarterProject"
				runat="server"> <input id="txtDirSize" style="VISIBILITY: hidden" runat="server" NAME="txtDirSize">
		</div>
	</form>
	<script language="javascript">
		InitializePage();
	</script>
</HTML>
