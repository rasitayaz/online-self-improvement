using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineSelfImprovement
{
    public partial class Student : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            SqlConnection connection = Connect();
            if (connection == null)
            {
                return;
            }

            string ID = Request.QueryString["ID"].ToString();
            Student_Name.InnerText = ID;
            DataSet ds = new DataSet();
            string sqlstr = "SELECT * FROM StudentInfo WHERE ID=" + ID;

            SqlDataAdapter da = new SqlDataAdapter(sqlstr, connection);
            da.Fill(ds);

            DataRow stdrow = ds.Tables[0].Rows[0];

            string FullName = stdrow["FirstName"].ToString() + " " + stdrow["LastName"].ToString();
            Student_Name.InnerText = FullName;

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

            string registrationDate = stdrow["RegistrationDate"].ToString();
            Label registrationDateLabel = FindControlRecursive(Page, "registrationDate") as Label;
            registrationDateLabel.Text = registrationDate;

            string birthdate = stdrow["BirthDate"].ToString();
            Label birthdateLabel = FindControlRecursive(Page, "birthdate") as Label;
            birthdateLabel.Text = birthdate;

            string age = stdrow["Age"].ToString();
            Label ageLabel = FindControlRecursive(Page, "age") as Label;
            ageLabel.Text = age;
            
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
            
           

            string payment = stdrow["Payment"].ToString();
            Label paymentLabel = FindControlRecursive(Page, "payment") as Label;
            paymentLabel.Text = payment;

            string numOfCourses = stdrow["NumOfCourses"].ToString();
            Label numOfCoursesLabel = FindControlRecursive(Page, "numOfCourses") as Label;
            numOfCoursesLabel.Text = numOfCourses;

            string ParentName = stdrow["ParentName"].ToString();
            Label ParentNameLabel = FindControlRecursive(Page, "ParentName") as Label;
            ParentNameLabel.Text = ParentName;

            string ParentPhone = stdrow["ParentPhoneNumber"].ToString();
            Label ParentPhoneLabel = FindControlRecursive(Page, "ParentPhone") as Label;
            ParentPhoneLabel.Text = ParentPhone;

            string occupation = stdrow["ParentOccupation"].ToString();
            Label occupationLabel = FindControlRecursive(Page, "occupation") as Label;
            occupationLabel.Text = occupation;



            connection.Close();
        }
        protected void Delete_Click(object sender, EventArgs e)
        {
            string ID = Request.QueryString["ID"].ToString();
            SqlConnection connection = Connect();
            DataSet ds = new DataSet();
            string sqlstr1 = "SELECT ID FROM Meeting Where StudentID="+ID;
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
                Response.Redirect("Students.aspx");

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