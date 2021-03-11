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
    public partial class Instructor : Page
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
            string sqlstr = "SELECT * FROM InstructorInfo WHERE ID=" + ID;

            SqlDataAdapter da = new SqlDataAdapter(sqlstr, connection);
            da.Fill(ds);

            DataRow stdrow = ds.Tables[0].Rows[0];

            string FullName = stdrow["FirstName"].ToString() + " " + stdrow["LastName"].ToString();
            Instructor_Name.InnerText = FullName;

            string email = stdrow["MailAddress"].ToString();
            Label emailLabel = FindControlRecursive(Page, "email") as Label;
            emailLabel.Text = email;

            string phone = stdrow["PhoneNumber"].ToString();
            Label phoneLabel = FindControlRecursive(Page, "phone") as Label;
            phoneLabel.Text = phone;

            string district = stdrow["District"].ToString();
            Label districtLabel = FindControlRecursive(Page, "district") as Label;
            districtLabel.Text = district;

            string city = stdrow["City"].ToString();
            Label cityLabel = FindControlRecursive(Page, "city") as Label;
            cityLabel.Text = city;

            string zip = stdrow["ZIP"].ToString();
            Label zipLabel = FindControlRecursive(Page, "zip") as Label;
            zipLabel.Text = zip;

            string gender = stdrow["Gender"].ToString();
            Label genderLabel = FindControlRecursive(Page, "gender") as Label;
            if (gender.Equals("M"))
            {
                genderLabel.Text = "Erkek";
            }
            else if (gender.Equals("F"))
            {
                genderLabel.Text = "Kadın";
            }
            else
            {
                genderLabel.Text = "Belirtilmedi";
            }

            string salary = stdrow["Salary"].ToString();
            Label ParentNameLabel = FindControlRecursive(Page, "salary") as Label;
            ParentNameLabel.Text = salary;

            string totalMinsInLastWeek = stdrow["TotalMinsInLastWeek"].ToString();
            Label totalMinsInLastWeekLabel = FindControlRecursive(Page, "totalMinsInLastWeek") as Label;
            totalMinsInLastWeekLabel.Text = totalMinsInLastWeek;

            connection.Close();


        }
        protected void Delete_Click(object sender, EventArgs e)
        {
            string ID = Request.QueryString["ID"].ToString();
            SqlConnection connection = Connect();
            DataSet ds = new DataSet();
            string sqlstr1 = "SELECT ID FROM Meeting Where InstructorID=" + ID;
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

            SqlCommand exec = new SqlCommand("EXEC DeletePerson " + ID, connection);
            try
            {
                exec.ExecuteNonQuery();
                Response.Redirect("Instructors.aspx");

            }
            catch (Exception)
            {
                throw;
            }
            connection.Close();

        }
        protected void Update_Click(object sender, EventArgs e)
        {
            string mail = MailTextBox.Text;
            if (mail == "")
            {
                mail = "null";
            }
            else
            {
                mail = "'" + mail + "'";
            }
            string phone = PhoneTextBox.Text;
            if (phone == "")
            {
                phone = "null";
            }
            else
            {
                phone = "'" + phone + "'";
            }
            string sqlstr = "EXEC UpdatePerson " + Request.QueryString["ID"].ToString() + ", " +
                mail + " , " + phone;
            SqlConnection connection = Connect();
            SqlCommand exec = new SqlCommand(sqlstr, connection);

            Label UpdateMessageLabel = FindControlRecursive(Page, "UpdateMessage") as Label;

            try
            {
                exec.ExecuteNonQuery();
                UpdateMessageLabel.Text = "Güncelleme Başarılı";
                Response.Redirect(Request.RawUrl);

            }
            catch (Exception)
            {
                UpdateMessageLabel.Text = "Güncelleme Başarısız";
            }
            connection.Close();


        }
    }
}