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

    protected void DropDownList_DeptName_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList_EmpName.Enabled = true;
        DropDownList_EmpName.ForeColor = System.Drawing.Color.Black;
    }


    protected void NoteSheetSubmitButton_Click(object sender, EventArgs e)
    {
        if (TextBoxSubject.Text == "")
            LabelError.Visible = true;
    }
}