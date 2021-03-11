<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Instructor.aspx.cs" Inherits="OnlineSelfImprovement.Instructor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PagePlaceHolder" runat="server">
    <h2 id="Instructor_Name" runat="server" />

    <div><b>E-posta Adresi:</b>&nbsp;<asp:Label ID="email" runat="server" /></div>
    <div><b>Telefon Numarası:</b>&nbsp;<asp:Label ID="phone" runat="server" /></div>
    <div><b>Adres:</b>&nbsp;<asp:Label ID="district" runat="server" />,&nbsp;<asp:Label ID="city" runat="server" />,&nbsp;<asp:Label ID="zip" runat="server" /></div>
    <div><b>Cinsiyet:</b>&nbsp;<asp:Label ID="gender" runat="server" /></div>
    <div><b>Maaş:</b>&nbsp;<asp:Label ID="salary" runat="server" /></div>
    <div><b>Son Haftadaki Toplam Çalışma Süresi (dk):</b>&nbsp;<asp:Label ID="totalMinsInLastWeek" runat="server" /></div>

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
        <asp:Button ID="ButtonDelete" runat="server" OnClick="Delete_Click" Text="Eğitmeni Sil" />
    </p>
</asp:Content>
