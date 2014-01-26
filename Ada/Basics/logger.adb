With Ada.Text_IO;			use Ada.Text_IO;
With Ada.Integer_Text_IO; 	use Ada.Integer_Text_IO;


Procedure Logger is

		
	Procedure log(logText : in String) is 
		MyFile 		: FILE_TYPE;
		FileName 	: String:= "logger.txt";
		
		Procedure CreateFile is 
		begin 
			CREATE (MyFile, OUT_FILE, FileName); 
			Open(MyFile, IN_FILE, FileName);
			
		end CreateFile;
		
	begin
		Open(MyFile, OUT_FILE, FileName);
		Set_Output(MyFile);
		Put(logText);
		New_Line;
		Close(MyFile);
		Set_Output(Standard_Output);
		
		
		exception 
			when NAME_ERROR => Put_Line("File not found or wrong file name. Trying to create a new one."); Close(MyFile); CreateFile;
			when MODE_ERROR => Put_Line("Mode error occured");
			when Others => Put_Line("Unknown error occurred.");
			
	end log; 
	
begin
	Put_Line("Hello user");
	log("Program started");
end Logger; 

