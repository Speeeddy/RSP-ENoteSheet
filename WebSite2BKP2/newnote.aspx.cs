using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

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
        else if (DropDownList_DeptName.AppendDataBoundItems == true)
        {
            //On disabling, the choice gets reset to the first index. So, choice saved and sent back.
            int x = DropDownList_DeptName.SelectedIndex;
            DropDownList_DeptName.AppendDataBoundItems = false;
            DropDownList_EmpName.AppendDataBoundItems = false;
            DropDownList_DeptName.SelectedIndex = x - 1;
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

        if (DropDownList_DeptName.SelectedValue == "Select Department")
        {
            LabelError.Text = "Please select the department of the recepient.";
            LabelError.Visible = true;
            return;
        }
        else if (DropDownList_EmpName.SelectedValue == "Select Employee")
        {
            LabelError.Text = "Please select the name of the recepient.";
            LabelError.Visible = true;
            return;
        }
        else if (TextBoxSubject.Text == "")
        {
            LabelError.Text = "Please enter the subject.";
            LabelError.Visible = true;
            return;
        }
        else if (TextBoxNoteSheet.Text.Trim() == "")
        {
            LabelError.Text = "Please enter some text in the note.";
            LabelError.Visible = true;
            return;
        }
        else
        {
            LabelError.Visible = false;
            string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            SqlConnection conn = null;
            conn = new SqlConnection(connString);
            conn.Open();

            try
            {
                
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandType = CommandType.Text;
                    string sub = TextBoxSubject.Text;
                    string plno = DDLPlNo.SelectedValue;
                    string dept_cd = DropDownList_DeptName.SelectedValue;
                    //this is plno of receiver. plno (CurrentP) of originator to be given by login id.
                    //originator is a required field but being set null-able and default 0 for now
                    cmd.CommandText = "INSERT INTO MainNoteSheetTable (SubjectNS, CurrentP, Dept_Cd) values (@sub,@plno,@dept_cd)";
                    cmd.Parameters.AddWithValue("@sub", sub);
                    cmd.Parameters.AddWithValue("@plno", plno);
                    cmd.Parameters.AddWithValue("@dept_cd", dept_cd);


                    int rowsAffected = cmd.ExecuteNonQuery();
                    Response.Write(rowsAffected.ToString());
 /*                   if (rowsAffected == 1)
                    {
                        Response.Write(rowsAffected.ToString())
                        //Success notification
                    }
                    else
                    {
                        //Error notification
                    }
   */           }
                LabelError.Text = "Success!";
                LabelError.ForeColor = System.Drawing.Color.Green;
                LabelError.Visible = true;
            }
            catch (Exception ex)
            {
                Response.Write("Exception occurred." + ex.Message);
                LabelError.Text = "Error";
                LabelError.Visible = true;
                //log error 
                //display friendly error to user
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                    //cleanup connection i.e close 
                }
            }


    
        }

    }
    
}