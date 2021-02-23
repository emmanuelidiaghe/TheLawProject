using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.IO;
//using Microsoft.SqlServer.Management.Sdk;
//using Microsoft.SqlServer.Management.Smo;
//using Microsoft.SqlServer.Management.Common;


public partial class Login : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader reader;
    //SqlDataAdapter adapter;
    //DataSet ds;
    //DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        string connString = @"Server = EMANCIPATOR; Database = law_firm; Trusted_Connection = True;";
        con = new SqlConnection(connString);


        //string script = File.ReadAllText(@"C:\Users\Emancipator\Desktop\WEB DEV\PROJECTS\C#\WebSite2\law_firm_query.sql");
        //Server server = new Server(new ServerConnection(con));
        //server.ConnectionContext.ExecuteNonQuery(script);
    }

    public void ShowAlert(String header, String message)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), header, "alert('" + message + "');", true);
    }

    public void ClearFeilds()
    {
        email_login.Text = "";
        password_login.Text = "";
    }

    protected void login_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid)
            {
                cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[get_User]";
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@email", email_login.Text.ToString());
                cmd.Parameters.AddWithValue("@passcode", password_login.Text.ToString());
                con.Open();
                reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    ShowAlert("Success", "You are logged in...");
                    content.Style.Add("display", "none");
                    details.Style.Add("display", "block");
                    logout.Style.Add("color", "red");
                    firstN.InnerText = reader[1].ToString();
                    lastN.InnerText = reader[2].ToString();
                    email_span.InnerText = reader[3].ToString();
                    gender_span.InnerText = reader[5].ToString();
                    country_span.InnerText = reader[6].ToString();
                }
                else
                {
                    ShowAlert("Error", "Incorrect username or password!");
                }

                cmd.Dispose();
                con.Close();
                ClearFeilds();
            }
            else
            {
                ShowAlert("Error", "Please enter all fields");
            }
        }
        catch (Exception ex)
        {
            ShowAlert("Error", ex.Message);
        }
    }
}