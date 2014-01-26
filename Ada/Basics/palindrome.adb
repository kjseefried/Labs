With Ada.Text_IO; use Ada.Text_IO;
With Ada.Integer_Text_IO; Use Ada.Integer_Text_IO;
Procedure Ex6 is

function IsPalindrome (str : string) return Boolean is
begin
	put_line(str);
	for i in 0..str'Length / 2 - 1 loop
		if str(1+i) /= str(str'last - i) then
		return False;
	end if;
	end loop;
		return True;
end IsPalindrome;

function trim(str: String; chars: String) return String is
	Keep: array (Character) of Boolean := (others => True);
	Result: String(str'Range);
	Last: Natural := Result'First-1;
begin

		for I in chars'Range loop
			Keep(chars(I)) := False;
		end loop;

		for J in str'Range loop
			if Keep(str(J)) then
				Last := Last+1;
				Result(Last) := str(J);
			end if;
		end loop;

	return Result(Result'First .. Last);
end trim;

input:string(1..100);
length:natural;

begin
   	Put_Line("Exercise 6");
	loop
		Put_Line("Input a string: ");
		get_line(input,length);
		if IsPalindrome(trim(input(1..length)," ")) then
			put_line("Palindrome = TRUE");
		else
			Put_Line("Palindrome = FALSE");
		end if;
	end loop;
end Ex6;
