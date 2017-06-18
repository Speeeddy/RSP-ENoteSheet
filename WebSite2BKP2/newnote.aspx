<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="newnote.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content4" ContentPlaceHolderID="ErrorContentPlaceHolder" runat="Server">
    <asp:Label ID="LabelError" runat="server" Text="Error, for eg. subject not filled. Make visible then." Visible="False" ForeColor="Red" ToolTip="Tells where the data might be incomplete."></asp:Label>
    <!--Error message placed on top, can change text in code behind-->
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="TextContentPlaceHolder" runat="Server">
    <br />
    <asp:Label ID="LabelToD" runat="server" Text="To: (Department)"></asp:Label>
    <br />
    <asp:Label ID="LabelToE" runat="server" Text="To: (Employee)"></asp:Label>
    <br />
    <asp:Label ID="LabelSubject" runat="server" Text="Subject:"></asp:Label>
    <br />
    <br />
    <br />
    <asp:Label ID="LabelAttach" runat="server" Text="Attach files:"></asp:Label>
    <br />
    <br />
    <asp:Label ID="LabelNote" runat="server" Text="Enter Note Sheet here"></asp:Label>
    <!--Labels on the left place holder-->


    <br />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="InputContentPlaceHolder" runat="Server">
    <br />
    <asp:DropDownList ID="DropDownList_DeptName" AppendDataBoundItems="true" runat="server" AutoPostBack="True" ToolTip="Select the department to send note sheet to." Width="500px" OnSelectedIndexChanged="DropDownList_DeptName_SelectedIndexChanged" DataSourceID="SqlDataSource3" DataValueField="Dept_Code">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT([Dept_Code]) FROM [EmployeeNoteSheet]"></asp:SqlDataSource>

    <br />
    <asp:DropDownList ID="DropDownList_EmpName" AppendDataBoundItems="true" runat="server" ToolTip="Select the employee to send note sheet to (Requires department selection)." Width="500px" Enabled="False" ForeColor="Silver" DataSourceID="SqlDataSource2" DataValueField="EmpName">
    </asp:DropDownList>
    <!--AppendDataBoundItem allows new element to be added (Select Dept, select Employee). It is disabled in codebehind.-->
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [EmpName] FROM [EmployeeNoteSheet] WHERE ([Dept_Code] = @Dept_Code)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList_DeptName" DefaultValue="NULL" Name="Dept_Code" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:DropDownList ID="DDLPlNo" runat="server" visible="False" DataSourceID="SqlDataSource1"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [PlNo] FROM [EmployeeNoteSheet] WHERE (([Dept_Code] = @Dept_Code) AND ([EmpName] = @EmpName))">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList_DeptName" Name="Dept_Code" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DropDownList_EmpName" Name="EmpName" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <!--This is just to get PlNo more easily.-->
    <asp:TextBox ID="TextBoxSubject" runat="server" MaxLength="1000" ToolTip="Enter the subject of the note sheet here." Width="500px" TextMode="MultiLine"></asp:TextBox>
    <br />
    <asp:FileUpload ID="FileUploadAttachment" runat="server" Width="500px" ToolTip="Attach files (optional). If multiple files, make sure that they are in the same folder before attaching." />
        <!--Input boxes on the right-->

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="NoteContentPlaceHolder" runat="Server">
    <asp:TextBox ID="TextBoxNoteSheet" runat="server" Height="500px" TextMode="MultiLine" ToolTip="Enter the detailed Note Sheet here." Width="870px"></asp:TextBox>
    <br />
    <asp:Button ID="NoteSheetSubmitButton" runat="server" Text="Send" OnClick="NoteSheetSubmitButton_Click" />
    <br />
    
            <!--Text box for note in the middle, thats why needed two master pages, for two styles of place holders-->
</asp:Content>
