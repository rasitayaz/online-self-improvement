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
    public partial class Meeting : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connection = Connect();
            if (connection == null)
            {
                return;
            }

            string ID = Request.QueryString["ID"].ToString();
            Instructor_Name.InnerText = ID;
            DataSet ds = new DataSet();
            string sqlstr = "SELECT * FROM MeetingInfo WHERE ID=" + ID;

            SqlDataAdapter da = new SqlDataAdapter(sqlstr, connection);
            da.Fill(ds);

            DataRow stdrow = ds.Tables[0].Rows[0];

            string StudentName = stdrow["StudentName"].ToString();
            Label StudentNameLabel = FindControlRecursive(Page, "StudentName") as Label;
            StudentNameLabel.Text = StudentName;

            string InstructorName = stdrow["InstructorName"].ToString();
            Label InstructorNameLabel = FindControlRecursive(Page, "InstructorName") as Label;
            InstructorNameLabel.Text = InstructorName;

            string CourseName = stdrow["CourseName"].ToString();
            Label CourseNameLabel = FindControlRecursive(Page, "CourseName") as Label;
            CourseNameLabel.Text = CourseName;

            string Date = stdrow["Date"].ToString();
            Label DateLabel = FindControlRecursive(Page, "Date") as Label;
            DateLabel.Text = Date;

            string Duration = stdrow["DurationInMins"].ToString();
            Label DurationLabel = FindControlRecursive(Page, "Duration") as Label;
            DurationLabel.Text = Duration;


        }
        protected void Delete_Click(object sender, EventArgs e)
        {
            string ID = Request.QueryString["ID"].ToString();
            SqlConnection connection = Connect();

            SqlCommand exec = new SqlCommand("EXEC DeleteMeeting " + ID, connection);
            try
            {
                exec.ExecuteNonQuery();
                Response.Redirect("Meetings.aspx");

            }
            catch (Exception)
            {
                throw;
            }
            connection.Close();

        }
    }
}