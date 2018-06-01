using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;

namespace LMS.pages
{
    public partial class Emp_Registration : System.Web.UI.Page
    {
        string message;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillCapctha();

            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            if (Session["captcha"].ToString() != txtCaptcha.Text)
                lblErrorMsg.Text = "Invalid Captcha Code";
            else
            {

                if (txtpwd.Text == txtcnmpwd.Text)
                {
                    string UserName = txtuser.Text;
                    string Password = txtpwd.Text;
                    string ConfirmPassword = txtcnmpwd.Text;
                    string FirstName = txtfname.Text;
                    string LastName = txtlname.Text;
                    string Email = txtEmail.Text;
                    string Phoneno = txtphone.Text;
                    string Location = txtlocation.Text;
                    string Created_By = txtuser.Text;
                    SqlConnection con = new SqlConnection(@"Data Source=.\sqlexpress;Initial Catalog=LMS;Integrated Security=True");
                    con.Open();
                    SqlCommand cmd = new SqlCommand("sp_EmpInformation", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@UserName", UserName);
                    cmd.Parameters.AddWithValue("@Password", Password);
                    cmd.Parameters.AddWithValue("@FirstName", FirstName);
                    cmd.Parameters.AddWithValue("@LastName", LastName);
                    cmd.Parameters.AddWithValue("@Email", Email);
                    cmd.Parameters.AddWithValue("@PhoneNo", Phoneno);
                    cmd.Parameters.AddWithValue("@Location", Location);
                    cmd.Parameters.AddWithValue("@Created_By", Created_By);
                    cmd.Parameters.Add("@ERROR", SqlDbType.Char, 500);
                    cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                    cmd.ExecuteNonQuery();
                    if (!string.IsNullOrEmpty(cmd.Parameters["@ERROR"].Value.ToString()))
                    {
                        message = (string)cmd.Parameters["@ERROR"].Value;
                    }
                    con.Close();
                }

                else
                {
                    Page.RegisterStartupScript("UserMsg", "<Script language='javascript'>alert('" + "Password mismatch" + "');</script>");
                }
                lblErrorMsg.Text = message;
                ClearControls();
            }
          
            
        }
        void FillCapctha()
        {
            try
            {
                Random random = new Random();
                string combination = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
                StringBuilder captcha = new StringBuilder();
                for (int i = 0; i < 6; i++)
                    captcha.Append(combination[random.Next(combination.Length)]);
                Session["captcha"] = captcha.ToString();
                imgCaptcha.ImageUrl = "GenerateCaptcha.aspx?" + DateTime.Now.Ticks.ToString();
            }
            catch
            {


                throw;
            }
        }

        private void ClearControls()
        {
            txtuser.Text = string.Empty;
            txtpwd.Text = string.Empty;
            txtcnmpwd.Text = string.Empty;
            txtfname.Text = string.Empty;
            txtlname.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtphone.Text = string.Empty;
            txtlocation.Text = string.Empty;
            txtuser.Text = string.Empty;
        }

        protected void btnRefresh_Click(object sender, EventArgs e)
        {
            FillCapctha();

        }
    }
}