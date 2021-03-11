using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineSelfImprovement
{
    public partial class InsertMeeting : Page
    {
        public object DdlGender { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Insert_Click(object sender, EventArgs e)
        {
            SqlConnection connection = Connect();
            
            string Durationvalue = Duration.Text;
            if (Durationvalue.Equals(""))
            {
                Durationvalue = "0";
            }
            SqlCommand exec = new SqlCommand("EXEC AddMeeting '" +
                Date.Text + "' , " + Durationvalue + " , '" + StudentID.Text + "' , '" +
                InstructorID.Text + "' , '"  + CourseID.Text+"'", connection);

            Label InsertMessageLabel = FindControlRecursive(Page, "InsertMessage") as Label;
            try
            {
                exec.ExecuteNonQuery();
                Response.Redirect("Meetings.aspx");

            }
            catch (Exception)
            {
                InsertMessageLabel.Text = "Ders Kaydedilemedi";
            }
            connection.Close();

        }
    }
}