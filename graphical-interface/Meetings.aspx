<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Meetings.aspx.cs" Inherits="OnlineSelfImprovement.Meetings" EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PagePlaceHolder" runat="server">
    <h2>Program</h2>
    
    <p>
        <asp:Button ID="ButtonInsert" runat="server" OnClick="Insert_Click" Text="Yeni Ders" />
    </p>
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowDataBound="GridView1_RowDataBound"
            BackColor="Transparent" BorderColor="#333333" BorderStyle="None" BorderWidth="1px" CellPadding="4"
            ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" HorizontalAlign="Left"/>
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
            <Columns>
                <asp:BoundField DataField="ID" HeaderText="Ders No" />
                <asp:BoundField DataField="StudentName" HeaderText="Öğrenci Adı" />
                <asp:BoundField DataField="InstructorName" HeaderText="Eğitmen Adı" />
                <asp:BoundField DataField="CourseName" HeaderText="Kurs Adı" />
                <asp:BoundField DataField="Date" HeaderText="Tarih" />

            </Columns>
        </asp:GridView>

    </div>

</asp:Content>
