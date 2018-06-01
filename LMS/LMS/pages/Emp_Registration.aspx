<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Emp_Registration.aspx.cs"
    Inherits="LMS.pages.Emp_Registration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="SM1" runat="server">
        </asp:ScriptManager>
        <table align="center">
            <tr>
                <td align="center" colspan="2">
                    <h2>
                        Registration Form</h2>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbluser" runat="server" Text="Username"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtuser" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblpwd" runat="server" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtpwd" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblcnfmpwd" runat="server" Text="Confirm Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtcnmpwd" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblfname" runat="server" Text="FirstName"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtfname" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbllname" runat="server" Text="LastName"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtlname" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblemail" runat="server" Text="Email"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCnt" runat="server" Text="Phone No"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtphone" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbladd" runat="server" Text="Location"></asp:Label>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtlocation" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td valign="middle">
                    <asp:UpdatePanel ID="UP1" runat="server">
                        <ContentTemplate>
                            <table>
                                <tr>
                                    <td style="height: 50px; width: 100px;">
                                        <asp:Image ID="imgCaptcha" runat="server" />
                                    </td>
                                    <td valign="middle">
                                        <asp:Button ID="btnRefresh" runat="server" Text="Refresh" OnClick="btnRefresh_Click" />
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>
                    Enter above captcha code :
                </td>
                <td>
                    <asp:TextBox ID="txtCaptcha" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" colspan="2">
                    <asp:Button ID="btnsubmit" runat="server" Text="Save" OnClick="btnsubmit_Click" />
                    &nbsp;&nbsp;<asp:Button ID="btnReset" Text="Reset" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <span style="color: Red; font-weight: bold">
                        <asp:Label ID="lblErrorMsg" runat="server"></asp:Label></span>
                </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
