<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="newnote.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content4" ContentPlaceHolderID="ErrorContentPlaceHolder" Runat="Server">
    <asp:Label ID="LabelError" runat="server" Text="Error, for eg. subject not filled. Make visible then." Visible="False" ForeColor="Red" ToolTip="Tells where the data might be incomplete."></asp:Label>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TextContentPlaceHolder" Runat="Server">
    <br /><asp:Label ID="LabelToD" runat="server" Text="To: (Department)"></asp:Label>                    
        <br />
          <asp:Label ID="LabelToE" runat="server" Text="To: (Employee)"></asp:Label>                  
        <br />
          <asp:Label ID="LabelSubject" runat="server" Text="Subject:"></asp:Label>                  
        <br />                   
        <br />    
        <br />               
        <asp:Label ID="LabelAttach" runat="server" Text="Attach files:"></asp:Label>                  
        <br /><br />
        <asp:Label ID="LabelNote" runat="server" Text="Enter Note Sheet here"></asp:Label>                  

        

        <br />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="InputContentPlaceHolder" Runat="Server">
    <br />
    <asp:DropDownList ID="DropDownList_DeptName" runat="server" AutoPostBack="True" ToolTip="Select the department to send note sheet to." Width="500px" OnSelectedIndexChanged="DropDownList_DeptName_SelectedIndexChanged">
            <asp:ListItem Enabled="True" Selected="True">Select Department</asp:ListItem>
              <asp:ListItem Enabled="True">C&IT Department</asp:ListItem>
        </asp:DropDownList>
         <br />
         <asp:DropDownList ID="DropDownList_EmpName" runat="server" AutoPostBack="False" ToolTip="Select the employee to send note sheet to (Requires department selection)." Width="500px" Enabled="False" ForeColor="Silver"> 
            <asp:ListItem Enabled="True" Selected="True">Select Employee</asp:ListItem>
              <asp:ListItem Enabled="True">Mr Gautam</asp:ListItem>
        </asp:DropDownList>
    <br />
    <asp:TextBox ID="TextBoxSubject" runat="server" MaxLength="1000" ToolTip="Enter the subject of the note sheet here." Width="500px" TextMode="MultiLine"></asp:TextBox>
    <br />
    <asp:FileUpload ID="FileUploadAttachment" runat="server" Width="500px" ToolTip="Attach files (optional). If multiple files, make sure that they are in the same folder before attaching." />
          </asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="NoteContentPlaceHolder" Runat="Server">
    <asp:TextBox ID="TextBoxNoteSheet" runat="server" Height="500px" TextMode="MultiLine" ToolTip="Enter the detailed Note Sheet here." Width="870px"></asp:TextBox>
<br />
    <asp:Button ID="NoteSheetSubmitButton" runat="server" Text="Send" OnClick="NoteSheetSubmitButton_Click"/>    <br />
</asp:Content>
