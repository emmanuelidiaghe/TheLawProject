<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Login" %>


<!DOCTYPE html>  
  
<html xmlns="http://www.w3.org/1999/xhtml">  
<head id="Head1" runat="server">  
    <link rel="stylesheet" href="styles.css"/>
    <title>Registration Form</title>
</head>
<body>
    <header>
        <nav>
            <ul class="nav-list">
                <li><a href="Default.aspx">Home</a></li>
                <li><a href="Registration.aspx">Register</a></li>
                <li><a href="Login.aspx">Login</a></li>
            </ul>
        </nav>
    </header>
    <div class="content" ID="content" runat="server">
        <div class="left-div">
            <h2 class="phone-numbers">The Law Chambers...</h2><br />
            <p>Having issues with the page? Reach us:</p>
            <p>customercare@support.com</p>
        </div>
        <div class="right-div">
            <form id="login_form" runat="server">
                <asp:ScriptManager ID="ScriptManagerLogin" runat="server" />
                <fieldset class="login_field">
                    <legend>LOGIN</legend>
                    <div class="input">
                        <asp:Label ID="email_loginL" runat="server">Email Address:</asp:Label>
                        <asp:TextBox ID="email_login" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="email_login" 
                            ErrorMessage="This field is compulsory"
                            ForeColor="Red"
                            ValidateRequestMode="Enabled"
                        />
                    </div>
                    <div class="input">
                        <asp:Label ID="password_loginL" runat="server">Password:</asp:Label>
                        <asp:TextBox ID="password_login" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="password_login" 
                            ErrorMessage="This field is compulsory"
                            ForeColor="Red"
                            ValidateRequestMode="Enabled"
                        />
                    </div><br />
                    <asp:Button ID="login" OnClick="login_Click"  class="submit-btn" runat="server" Text="LOGIN" />    
                </fieldset>
        </form> 
      </div>
    </div>
    <div id="details" class="user_details" runat="server">
        <h2>Please find your details below:</h2><br />
        <p>First Name: <span id="firstN" runat="server"></span></p>
        <p>Last Name: <span id="lastN" runat="server"></span></p>
        <p>Email: <span id="email_span" runat="server"></span></p>
        <p>Gender: <span id="gender_span" runat="server"></span></p>
        <p>Country: <span id="country_span" runat="server"></span></p>
    </div>
    <footer>
        <div class="copyright">
            <p>&copy; 2021 The Law</p>
            <p>All Rights Reserved</p>
        </div>
    </footer>
</body>  
</html>
