<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>


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
    <div class="content">
        <div class="left-div">
            <h2 class="phone-numbers">The Law Chambers...</h2><br />
            <p>Having issues with the page? Reach us:</p>
            <p>customercare@support.com</p>
        </div>
        <div class="right-div">
            <form id="register_form" runat="server">
                <asp:ScriptManager ID="ScriptManagerReg" runat="server" />
                <fieldset>
                    <legend>REGISTRATION</legend>
                    <div class="input">
                        <asp:Label ID="fNameL" runat="server">First Name:</asp:Label>
                        <asp:TextBox ID="fName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fName" 
                            ErrorMessage="This field is compulsory"
                            ForeColor="Red"
                            ValidateRequestMode="Enabled"
                        />
                    </div>
                    <div class="input">
                        <asp:Label ID="lNameL" runat="server">Last Name:</asp:Label>
                        <asp:TextBox ID="lName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lName" 
                            ErrorMessage="This field is compulsory"
                            ForeColor="Red"
                            ValidateRequestMode="Enabled"
                        />
                    </div>
                    <div class="input">
                        <asp:Label ID="emailL" runat="server">Email:</asp:Label>
                        <asp:TextBox ID="email" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="email" 
                            ErrorMessage="Enter email address"
                            ForeColor="Red"
                            ValidateRequestMode="Enabled"
                        />
                    </div>
                    <div class="input">
                        <asp:Label ID="passcode1L" runat="server">Password:</asp:Label>
                        <asp:TextBox ID="passcode1" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="passcode1" 
                            ErrorMessage="You must enter password"
                            ForeColor="Red"
                            ValidateRequestMode="Enabled"
                        />
                    </div>
                    <div class="input">
                        <asp:Label ID="passcode2L" runat="server">Confirm Password:</asp:Label>
                        <asp:TextBox ID="passcode2" TextMode="Password" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="passcode1" 
                            ErrorMessage="Please confirm password"
                            ForeColor="Red"
                            ValidateRequestMode="Enabled"
                        />
                    </div>
                    <div>
                        <asp:CompareValidator ID="comparePasswords"
                            runat="server"
                            ControlToCompare="passcode1"
                            ControlToValidate="passcode2"
                            ErrorMessage="Passwords do not match up."
                            ForeColor="Red"
                         />
                    </div>
                    <div>
                        <asp:Label ID="genderL" runat="server">Gender:</asp:Label>
                            <asp:RadioButtonList ID="gender" runat="server">  
                                <asp:ListItem> Male</asp:ListItem>
                                <asp:ListItem> Female</asp:ListItem>
                                <asp:ListItem> Prefer Not to Say</asp:ListItem>
                            </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="gender" 
                            ErrorMessage="Select your gender"
                            ForeColor="Red"
                            ValidateRequestMode="Enabled"
                        />
                    </div>
                    <div>
                        <asp:Label ID="countryL" runat="server">Country:</asp:Label>
                        <asp:DropDownList ID="country" runat="server">  
                                       <asp:ListItem Text="Select Country" Value="" ></asp:ListItem> 
                                        <asp:ListItem Text="Ausralia" Value="Ausralia"></asp:ListItem>  
                                        <asp:ListItem Text="Austria" Value="Austria"></asp:ListItem>  
                                        <asp:ListItem Text="Angola" Value="Angola"></asp:ListItem>  
                                        <asp:ListItem Text="Brazil" Value="Brazil"></asp:ListItem>  
                                        <asp:ListItem Text="Canada" Value="Canada"></asp:ListItem>  
                                        <asp:ListItem Text="Denmark" Value="Denmark"></asp:ListItem>  
                                        <asp:ListItem Text="France" Value="France"></asp:ListItem>  
                                        <asp:ListItem Text="Ghana" Value="Ghana"></asp:ListItem>  
                                        <asp:ListItem Text="Nigeria" Value="Nigeria"></asp:ListItem>  
                                        <asp:ListItem Text="Norway" Value="Norway"></asp:ListItem>  
                                        <asp:ListItem Text="Zimbabwe" Value="Zimbabwe"></asp:ListItem>  
                        </asp:DropDownList><br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="country" 
                            ErrorMessage="Please select country"
                            ForeColor="Red"
                            ValidateRequestMode="Enabled"
                        />
                    </div><br />
                    <asp:Button ID="reg" OnClick="Register_Click" class="submit-btn" runat="server" Text="REGISTER" />    
                </fieldset>
        </form> 
      </div>
    </div>
    <footer>
        <div class="copyright">
            <p>&copy; 2021 The Law</p>
            <p>All Rights Reserved</p>
        </div>
    </footer>
</body>  
</html>