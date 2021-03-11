<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="OnlineSelfImprovement.Student" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PagePlaceHolder" runat="server">
    <h2 id="Student_Name" runat="server" />

    <div><b>E-posta Adresi:</b>&nbsp;<asp:Label ID="email" runat="server" /></div>
    <div><b>Telefon Numarası:</b>&nbsp;<asp:Label ID="phone" runat="server" /></div>
    <div><b>Adres:</b>&nbsp;<asp:Label ID="district" runat="server" />,&nbsp;<asp:Label ID="city" runat="server" />,&nbsp;<asp:Label ID="zip" runat="server" /></div>
    <div><b>Kayıt Tarihi:</b>&nbsp;<asp:Label ID="registrationDate" runat="server" /></div>
    <div><b>Doğum Günü:</b>&nbsp;<asp:Label ID="birthdate" runat="server" />&nbsp;(<asp:Label ID="age" runat="server" />)</div>
    <div><b>Cinsiyet:</b>&nbsp;<asp:Label ID="gender" runat="server" /></div>
    <div><b>Borç:</b>&nbsp;<asp:Label ID="payment" runat="server" /></div>
    <div><b>Alınan Kurs Sayısı:</b>&nbsp;<asp:Label ID="numOfCourses" runat="server" /></div>
    <br /><br />
    <h2>Veli</h2>
    <div><b>İsim:</b>&nbsp;<asp:Label ID="ParentName" runat="server" /></div>
    <div><b>Telefon Numarası:</b>&nbsp;<asp:Label ID="ParentPhone" runat="server" /></div>
    <div><b>Meslek:</b>&nbsp;<asp:Label ID="occupation" runat="server" /></div>

    <p>
        E-Posta Adresi&nbsp;&nbsp;<asp:TextBox ID="MailTextBox" runat="server"></asp:TextBox>
    </p>
    <p>
        Telefon Numarası&nbsp;&nbsp;<asp:TextBox ID="PhoneTextBox" runat="server"></asp:TextBox>
    </p>
    <p>
        <asp:Button ID="ButtonUpdate" runat="server" OnClick="Update_Click" Text="Güncelle" />
        &nbsp;&nbsp;<asp:Label ID="UpdateMessage" runat="server" />
    </p>  
    <p>
        <asp:Button ID="ButtonDelete" runat="server" OnClick="Delete_Click" Text="Öğrenciyi Sil" />
    </p>

</asp:Content>
