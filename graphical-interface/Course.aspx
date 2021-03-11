<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="OnlineSelfImprovement.Course" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PagePlaceHolder" runat="server">
    <h2 id="Course_Name" runat="server" />

  
    <p>
        <asp:Button ID="ButtonDelete" runat="server" OnClick="Delete_Click" Text="Kursu Sil" />
    </p>

</asp:Content>
