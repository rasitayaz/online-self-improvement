<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="InsertMeeting.aspx.cs" Inherits="OnlineSelfImprovement.InsertMeeting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PagePlaceHolder" runat="server">
    <p>
        Öğrenci NO (*)&nbsp;&nbsp;<asp:TextBox ID="StudentID" runat="server"></asp:TextBox>
    </p>
    <p>
        Eğitmen NO (*)&nbsp;&nbsp;<asp:TextBox ID="InstructorID" runat="server"></asp:TextBox>
    </p>
    <p>
        Kurs NO (*)&nbsp;&nbsp;<asp:TextBox ID="CourseID" runat="server"></asp:TextBox>
    </p>
    <p>
        Tarih (*)&nbsp;&nbsp;<asp:TextBox ID="Date" runat="server"></asp:TextBox>
    </p>
    <p>
        Süre&nbsp;&nbsp;<asp:TextBox ID="Duration" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="ButtonInsert" runat="server" OnClick="Insert_Click" Text="Kaydet" />
        &nbsp;&nbsp;<asp:Label ID="InsertMessage" runat="server" />
    </p> 
</asp:Content>
