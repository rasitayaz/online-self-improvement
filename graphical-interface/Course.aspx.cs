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
    public partial class Course : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connection = Connect();
            if (connection == null)
            {
                return;
            }
            string ID = Request.QueryString["ID"].ToString();
            Course_Name.InnerText = ID;
            DataSet ds = new DataSet();
            string sqlstr = "SELECT * FROM Course WHERE ID=" + ID;

            SqlDataAdapter da = new SqlDataAdapter(sqlstr, connection);
            da.Fill(ds);

            DataRow stdrow = ds.Tables[0].Rows[0];

            string CourseName = stdrow["Name"].ToString();

            string CourseID = stdrow["ID"].ToString();
            Course_Name.InnerText = CourseName + "("+ID+")";


            connection.Close();
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            string ID = Request.QueryString["ID"].ToString();
            SqlConnection connection = Connect();
            DataSet ds = new DataSet();
            string sqlstr1 = "SELECT ID FROM Meeting Where CourseID=" + ID;
            SqlDataAdapter da = new SqlDataAdapter(sqlstr1, connection);
            da.Fill(ds);
            foreach (DataTable table in ds.Tables)
            {
                foreach (DataRow row in table.Rows)
                {
                    foreach (object item in row.ItemArray)
                    {
                        string meetingID = item.ToString();
                        SqlCommand execDeleteMeeting = new SqlCommand("EXEC DeleteMeeting " + meetingID, connection);
                        try
                        {
                            execDeleteMeeting.ExecuteNonQuery();
                        }
                        catch (Exception)
                        {
                            throw;
                        }
                    }
                }
            }

            SqlCommand exec = new SqlCommand("EXEC DeleteCourse " + Course_Name.InnerText, connection);
            try
            {
                exec.ExecuteNonQuery();
                Response.Redirect("Courses.aspx");

            }
            catch (Exception)
            {
                throw;
            }
            connection.Close();

        }

    }
}