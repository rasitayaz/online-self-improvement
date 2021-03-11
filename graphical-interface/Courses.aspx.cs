using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineSelfImprovement
{
    public partial class Courses : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connection = Connect();
            if (connection == null)
            {
                return;
            }
            DataSet ds = new DataSet();
            string sqlstr = "SELECT ID , Name FROM Course order by Name";

            SqlDataAdapter da = new SqlDataAdapter(sqlstr, connection);
            da.Fill(ds);

            GridView1.DataSource = ds;
            GridView1.DataBind();
            connection.Close();
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["style"] = "cursor:pointer";

            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ID = GridView1.SelectedRow.Cells[0].Text;
            Response.Redirect(url: "Course.aspx?ID=" + ID);
        }
        protected void Insert_Click(object sender, EventArgs e)
        {
            SqlConnection connection = Connect();
            
            SqlCommand exec = new SqlCommand("EXEC AddCourse N'" +CourseName.Text+"'", connection);

            Label InsertMessageLabel = FindControlRecursive(Page, "InsertMessage") as Label;
            try
            {
                exec.ExecuteNonQuery();
                Response.Redirect("Courses.aspx");

            }
            catch (Exception)
            {
                InsertMessageLabel.Text = "Kurs Kaydedilemedi";
            }
            connection.Close();

        }

    }
}