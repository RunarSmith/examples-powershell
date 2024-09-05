
# Code C#
$code = @"
using System;
namespace HelloWorld
{
	public class Program
	{
		public static void Main(){
			Console.WriteLine("Hello world!");
		}
	}
}
"@
 
# déclaration (et compilation) du code de type C#
Add-Type -TypeDefinition $code -Language CSharp	

# execution de la fonction Main() du programme C#
iex "[HelloWorld.Program]::Main()"
