//  Jeffrey Lupia 
//  Caesar Cipher
//  Theory Of Programming languages
//  Programming in the past
///////////////////////////////////////         PASCAL         //////////////////////////////////





program CaesarCipher;
uses crt;

var
S, S1: string;
shiftFactor: Integer;
maxShiftValue: Integer;

/////////////////////////////////////////////

function encrypt(S: string; shiftFactor: Integer): string; //returns STRING-encrypt

var 
index: Integer;
begin
encrypt:= S;
for index:=1 to length(encrypt) do
	case encrypt[index] of
	
	'A'..'Z':encrypt[index] := chr(ord('A') + (ord(encrypt[index]) - ord('A')+ shiftFactor)mod 26);
	'a'..'z':encrypt[index] := chr(ord('a') + (ord(encrypt[index]) - ord('a')+ shiftFactor)mod 26);
	end;
end;

////////////////////////////////////////////

function decrypt(S1: string; shiftFactor: Integer): string; //returns STRING-decrypt
var 
index: Integer;
begin
decrypt:= S1;
for index:=1 to length(decrypt) do
	case decrypt[index] of
	
	'A'..'Z':decrypt[index] := chr(ord('A')+ (ord(decrypt[index]) - ord('A')- shiftFactor + 26)mod 26);
	'a'..'z':decrypt[index] := chr(ord('a')+ (ord(decrypt[index]) - ord('a')- shiftFactor + 26)mod 26);
	end;
end;

////////////////////////////////////////////////

procedure solve(S: string; maxShiftValue: Integer);

var 
index: Integer;
solved: string;
begin
solved := S;
	writeln('Caesar ', maxShiftValue, ': ', solved);
	for index := 1 to maxShiftValue do
		begin
		    solved := encrypt(solved, 1);
			writeln('Caesar ', (maxShiftValue - index), ': ', solved);
		end;
end;

/////////////////////////////////////////

begin
    maxShiftValue:=26;
    
   
     //Were this compiler able to accept prompts from the command line, the syntax
    //would be:
    //writeln('Tell me about yourself....:');
	//readln(S);
	//writeln('And your favorite number???');
   //readln(shiftFactor);
   //prompting the user for input, then using that string to go through each function
   shiftFactor:=4;
   S:='Suck My Peen, Alan';
   S1:= encrypt(S, shiftFactor);

   
    writeln(S);
	writeln(S1);
	writeln(decrypt(S1, shiftFactor));
	solve(S, maxShiftValue);
	 
end. { the, end of main program block }
