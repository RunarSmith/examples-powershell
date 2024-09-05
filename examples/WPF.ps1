Add-Type -AssemblyName PresentationFramework
 
[xml]$XAMLForm = @"
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" Title="XAML Form" Height="150" Width="320">
     <Canvas>
          <Label Content="Simple XAML Form. Click button to exit." HorizontalAlignment="Left" Height="30" Margin="10,10,0,0" VerticalAlignment="Top" Width="275" FontWeight="Bold" FontSize="14"/>
          <Button Name="btnClose" Content="Close Window" HorizontalAlignment="Center" Height="30" Margin="10,50,0,0" VerticalAlignment="Center" Width="128" ClickMode="Press"/>     
     </Canvas>
</Window>
"@
 
$NodeReader = (New-Object System.Xml.XmlNodeReader $XAMLForm)
$Window = [Windows.Markup.XamlReader]::Load($NodeReader)
 
$CloseButton = $Window.FindName("btnClose")
$CloseButton.Add_Click({$Window.Close()})
 
$Window.ShowDialog()
