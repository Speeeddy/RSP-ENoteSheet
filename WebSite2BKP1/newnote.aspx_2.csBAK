using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Page_LoadComplete(object sender, EventArgs e)
    {   
        
        if (!IsPostBack)
            //This required so that the element is not added again whenever DDL_DeptName postbacks
        {
            DropDownList_DeptName.Items.Insert(0, new ListItem("Select Department", "NULL"));
            DropDownList_EmpName.Items.Insert(0, new ListItem("Select Employee", "NULL"));
            //DropDownList_DeptName.SelectedValue = "Select Department";
            //DropDownList_EmpName.SelectedValue = "Select Employee";
            //By default, the first index is selected.
            //To get output on page for debugging, use Response.Write("text");
        }
        else if(DropDownList_DeptName.AppendDataBoundItems == true)
        {
            //On disabling, the choice gets reset to the first index. So, choice saved and sent back.
            int x = DropDownList_DeptName.SelectedIndex;
            DropDownList_DeptName.AppendDataBoundItems = false;
            DropDownList_EmpName.AppendDataBoundItems = false;
            DropDownList_DeptName.SelectedIndex = x-1;
            //x-1 because after the removal of Select Dept, indices reduce by one
            
        }
    }

    protected void DropDownList_DeptName_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList_EmpName.Enabled = true;
        DropDownList_EmpName.ForeColor = System.Drawing.Color.Black;
        DropDownList_EmpName.Items.Remove("Select Employee");
        DropDownList_EmpName.Items.Remove("Select Department");
    }


    protected void NoteSheetSubmitButton_Click(object sender, EventArgs e)
    {
        if (TextBoxSubject.Text == "")
            LabelError.Visible = true;
    }

}