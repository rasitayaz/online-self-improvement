<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="InsertStudent.aspx.cs" Inherits="OnlineSelfImprovement.InsertStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PagePlaceHolder" runat="server">

    <p>
        İsim (*)&nbsp;&nbsp;<asp:TextBox ID="FirstName" runat="server"></asp:TextBox>
    </p>
    <p>
        Soyisim (*)&nbsp;&nbsp;<asp:TextBox ID="LastName" runat="server"></asp:TextBox>
    </p>
    <p>
        E-Posta Adresi (*)&nbsp;&nbsp;<asp:TextBox ID="MailAddress" runat="server"></asp:TextBox>
    </p>
    <p>
        Telefon Numarası (*)&nbsp;&nbsp;<asp:TextBox ID="PhoneNumber" runat="server"></asp:TextBox>
    </p>
    <p>
        Doğum Tarihi (*)&nbsp;&nbsp;<asp:TextBox ID="BirthDate" runat="server"></asp:TextBox>
    </p>
    <p>
        Cinsiyet&nbsp;&nbsp;
        <asp:DropDownList ID="DdlGender" runat="server">
            <asp:ListItem Enabled="true" Text="Cinsiyet Seçin" Value="NULL"></asp:ListItem>
            <asp:ListItem Text="Erkek" Value="M"></asp:ListItem>
            <asp:ListItem Text="Kadın" Value="F"></asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        Posta Kodu&nbsp;&nbsp;<asp:TextBox ID="ZIP" runat="server"></asp:TextBox>
    </p>
    <p>
        İlçe&nbsp;&nbsp;<asp:TextBox ID="District" runat="server"></asp:TextBox>

    </p>
    <p>
        İl&nbsp;&nbsp;<asp:TextBox ID="City" runat="server"></asp:TextBox>
    </p>
    
    <p>
        Kayıt Tarihi&nbsp;&nbsp;<asp:TextBox ID="RegistrationDate" runat="server"></asp:TextBox>
    </p>
    <p>
        Borç&nbsp;&nbsp;<asp:TextBox ID="Payment" runat="server"></asp:TextBox>
    </p>

    <p>
        <asp:Button ID="ButtonInsert" runat="server" OnClick="Insert_Click" Text="Kaydet" />
        &nbsp;&nbsp;<asp:Label ID="InsertMessage" runat="server" />
    </p> 
</asp:Content>




