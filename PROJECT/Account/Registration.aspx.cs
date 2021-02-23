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

public partial class Registration : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    //SqlDataAdapter adapter;
    //SqlDataReader reader;
    //DataSet ds;
    //DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string connString = @"Server = EMANCIPATOR; Database = law_firm; Trusted_Connection = True;";
            con = new SqlConnection(connString);

            //string script = File.ReadAllText(@"C:\Users\Emancipator\Desktop\WEB DEV\PROJECTS\C#\WebSite2\law_firm_query.sql");
            //Server server = new Server(new ServerConnection(con));
            //server.ConnectionContext.ExecuteNonQuery(script);
        }
        catch (Exception ex)
        {
            ShowAlert("Error", ex.Message);
        }

    }

    public void ShowAlert(String header, String message)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), header, "alert('" + message + "');", true);
    }

    public void ClearFeilds()
    {
        fName.Text = "";
        lName.Text = "";
        email.Text = "";
        passcode1.Text = "";
        gender.Text = "";
        country.Text = "";
    }

    protected void Register_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid)
            {
                cmd = new SqlCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "[sp_AddUsers]";
                cmd.Connection = con;
                cmd.Parameters.AddWithValue("@first_name", fName.Text.ToString());
                cmd.Parameters.AddWithValue("@last_name", lName.Text.ToString());
                cmd.Parameters.AddWithValue("@email", email.Text.ToString());
                cmd.Parameters.AddWithValue("@passcode", passcode1.Text.ToString());
                cmd.Parameters.AddWithValue("@gender", gender.SelectedValue.ToString());
                cmd.Parameters.AddWithValue("@country", country.SelectedValue.ToString());
                con.Open();
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                con.Close();
                ClearFeilds();
                ShowAlert("Success", "Saved Successfully");
                Response.Redirect("Login.aspx");
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