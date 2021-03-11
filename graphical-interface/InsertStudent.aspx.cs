using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace OnlineSelfImprovement
{
    public partial class InsertStudent : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Insert_Click(object sender, EventArgs e)
        {
            SqlConnection connection = Connect();
            string GenderValue = DdlGender.SelectedValue;
            if (!GenderValue.Equals("NULL"))
            {
                GenderValue = "'" + GenderValue + "'";
            }
            string ZIPvalue = ZIP.Text ;
            if (ZIPvalue.Equals(""))
            {
                ZIPvalue = "default";
            }else
            {
                ZIPvalue = "'" + ZIPvalue + "'";
            }
            string Districtvalue = District.Text;
            if (Districtvalue.Equals(""))
            {
                Districtvalue = "default";
            }
            else
            {
                Districtvalue = "N'" + Districtvalue + "'";
            }
            string Cityvalue = City.Text;
            if (Cityvalue.Equals(""))
            {
                Cityvalue = "default";
            }
            else
            {
                Cityvalue = "N'" + Cityvalue + "'";
            }
            string RegistrationDatevalue = RegistrationDate.Text;
            if (RegistrationDatevalue.Equals(""))
            {
                RegistrationDatevalue = "default";
            }
            else
            {
                RegistrationDatevalue = "'" + RegistrationDatevalue + "'";
            }
            string Paymentvalue = Payment.Text;
            if (Paymentvalue.Equals(""))
            {
                Paymentvalue = "0";
            }
            SqlCommand exec = new SqlCommand("EXEC AddStudent N'" + 
                FirstName.Text +"' , N'" + LastName.Text+ "' , '"+ MailAddress.Text + "' , '"+
                PhoneNumber.Text+ "' , "+GenderValue+" , "+ ZIPvalue + " , " +Districtvalue + " , " +
                Cityvalue + " , '" +BirthDate.Text+"' , "+RegistrationDatevalue+","+Paymentvalue , connection);

            Label InsertMessageLabel = FindControlRecursive(Page, "InsertMessage") as Label;
            try
            {
                exec.ExecuteNonQuery();
                Response.Redirect("Students.aspx");

            }
            catch (Exception)
            {
                InsertMessageLabel.Text = "Öğrenci Kaydedilemedi";
            }
            connection.Close();

        }
    }
}
 