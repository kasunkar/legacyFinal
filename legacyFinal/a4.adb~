with ada.Text_IO; use Ada.Text_IO;
with ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with ada.strings.unbounded; use ada.strings.unbounded;
with ada.strings.unbounded.Text_IO; use ada.strings.unbounded.Text_IO;
with Ada.Characters.Handling; use Ada.Characters.Handling;
procedure a4 is
   Filename   : String := "test.txt";
   File       : Ada.Text_IO.File_Type;
   Line_Count : Natural := 0;
   wordLen ,syllabels, words , sentences  : Natural := 0;
   
begin
   Ada.Text_IO.Open (File => File,
                     Mode => Ada.Text_IO.In_File,
                     Name => Filename);
    while not Ada.Text_IO.End_Of_File (File) loop
        declare
            sLine, Line :  unbounded_string := Get_Line (File);
            
        begin
            Line := to_unbounded_string(To_Lower(to_string(Line)));
            sLine := Line;
            
            for k in 1..length(Line) loop--goes through both Line and sLine
                --incrementing sentences
                if element(Line,k) = '.' or element(Line,k) = '!' or element(Line,k) = '?' or element(Line,k) = ':' or element(Line,k) = ';' then
                    sentences := sentences + 1;
                end if;
                
                 -- counting words
                if element(Line,k) /= ' ' then
                    if k = length(Line) then
                        words := words+1;
                    elsif element(Line,k+1) = ' ' then
                        words := words+1;
                    end if;
                end if;
                
                
                --counting syllabels
                if element(sLine,k) /= ' ' then --calculates word length
                    wordLen := wordLen +1;
                else
                    if wordLen < 4 then
                        syllabels := syllabels +1;
                        wordLen :=0;
                    else
                            
                        for i in (k-wordLen)..(k+wordLen) loop
                                
                                
                            if element(sLine,i)='a'or element(sLine,i)='e'or element(sLine,i)='i'or 
                               element(sLine,i)='o'or element(sLine,i)='u'or element(sLine,i)='y' then
                                if element(sLine,i+1)/='a'or 
                                   element(sLine,i+1)/='e'or 
                                   element(sLine,i+1)/='i'or 
                                   element(sLine,i+1)/='o'or 
                                   element(sLine,i+1)/='u'or
                                   element(sLine,i+1)/='y'then
                                                                           
                                    syllabels := syllabels +1; -- increment count upon finding vowel
                                    
                                end if;
                                    
                                --if element(sLine,i)='e' then -- decrement false increments for ED, ES and E
                                --   if i = wordLen and element(sLine,i-1) /='l' then
                                --       syllabels := syllabels-1;
                                --     elsif element(sLine,i+1)='d' or element(sLine,i+1)='s' then
                                --           syllabels := syllabels-1;
                                --     end if;
                                --end if;
                            end if;                           
                        end loop;
                        wordLen := 0; 
                    end if;
                end if;
            end loop;
        end;
    end loop;
    put(sentences);
    put(words);
    Ada.Text_IO.Close (File);
end a4;
