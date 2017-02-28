<%@ page language="C#" autoeventwireup="true" inherits="Landing, App_Web_q20qplq5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Social Image-anator</title>
    
    
    <link rel="stylesheet" href="css/social-image-anator.css" media="all" />
  
</head>
<body>
    <div class="ux_todo" style="border: 1px solid #000000; background-color: yellow; padding: 0.5em;">
        <p>** DEBUG MODE ENABLED: Don't deploy to production ***</p>
    </div>

    <h1>Social Image-anator</h1>
    <p>
        A quick and easy way to process your social network images. This tool quickly resizes images to a set of standard widths and strips out all of the associated metadata.
    </p>
    <ul>
        <li>Which widths?</li>
        <li>64 px</li>
        <li>128 px</li>
        <li>256 px</li>
        <li>512 px</li>
        <li>1024 px</li>
        <li>2048 px</li>
    </ul>

    <div class="ux_todo" style="border: 1px solid #000000; background-color: yellow; padding: 0.5em;">
        <p>Are we ok with this copy? Does it explain metadata clearly enough?</p>
    </div>

    <ul>
        <li>What metadata?</li>
        <li>Information about the camera that took the image</li>
        <li>The location the image was taken</li>
        <li>Data about the programs used to process the iamge</li>
        <li>...and more</li>
    </ul>

    </p>
    <form id="form1" runat="server">
        <p class="status"><asp:Label ID="Status" runat="server"></asp:Label></p>

        <fieldset id="upload">
            <div class="col">
                <p>
                    <asp:RadioButton ID="FileOrUrlUrl" runat="server" GroupName="FileOrUrl" /><label for="UrlToProcess">Use a URL...</label>
                </p>
                <asp:TextBox ID="UrlToProcess" name="UrlToProcess" runat="server" Height="16px" Width="100%"></asp:TextBox>
                <p class="ux_note">Any URL pointing to an image or .zip of images is ok.</p>
            </div>
            <div class="wedge">or</div>
            <div class="col">
                <p>
                    <asp:RadioButton ID="FileOrUrlFile" runat="server" Checked="True" GroupName="FileOrUrl" /><label for="SelectFileToUpload">Upload a file...</label>
                </p>
                <asp:FileUpload ID="SelectFileToUpload" name="SelectFileToUpload" runat="server" />        
                <p class="ux_note">Any image or .zip of images is ok.</p>

                <div class="ux_todo" style="border: 1px solid #000000; background-color: yellow; padding: 0.5em;">
                    <p>Can we style this control? It really stands out right now...in a bad way</p>
                </div>
            </div>
        </fieldset>

        <fieldset id="options">
            <p><asp:CheckBox ID="CreateGrayscale" runat="server" Text="Create grayscale images" /></p>
            <p class="ux_note">Requesting grayscale images will increase processing time 10x.</p>

            <div class="ux_todo" style="border: 1px solid #000000; background-color: yellow; padding: 0.5em;">
                <p>The 10x processing image is putting the process queue completion times through the roof. Either we fix it or remove this feature</p>
            </div>

            <p>
                <label for="Comments">Comments</label><br />
                <asp:TextBox ID="Comments" runat="server" name="Comments" Height="180px" Width="532px" TextMode="MultiLine"></asp:TextBox>
            <p class="ux_note">Comments here will appear on the results page. You can use this to help remind you about the image or where you thought you might use it.</p>
            </p>
            
        </fieldset>
        
        
        <asp:Button ID="UploadSelectedFile" runat="server" Text="Upload" OnClick="UploadSelectedFile_Click" />
    </form>
</body>

</html>
