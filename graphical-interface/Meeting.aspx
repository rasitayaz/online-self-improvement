<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Meeting.aspx.cs" Inherits="OnlineSelfImprovement.Meeting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PagePlaceHolder" runat="server">
    <h2 id="Instructor_Name" runat="server" />

    <div><b>Öğrenci Adı :</b>&nbsp;<asp:Label ID="StudentName" runat="server" /></div>
    <div><b>Eğitmen Adı :</b>&nbsp;<asp:Label ID="InstructorName" runat="server" /></div>
    <div><b>Kurs Adı :</b>&nbsp;<asp:Label ID="CourseName" runat="server" /></div>
    <div><b>Tarih :</b>&nbsp;<asp:Label ID="Date" runat="server" /></div>
    <div><b>Süre :</b>&nbsp;<asp:Label ID="Duration" runat="server" /></div>
    <p>
        <asp:Button ID="ButtonDelete" runat="server" OnClick="Delete_Click" Text="Dersi Sil" />
    </p>
</asp:Content>
