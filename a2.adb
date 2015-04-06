with ada.Text_IO; use Ada.Text_IO;
with ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with ada.strings.unbounded; use ada.strings.unbounded;
with ada.strings.unbounded.Text_IO; use ada.strings.unbounded.Text_IO;
with ada.Numerics.Discrete_Random;



procedure a2 is

    procedure draw (stage : in integer) is
        begin
            if stage = 0 then
                put_line("-----------------|");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
            end if;
            if stage = 1 then
                put_line("-----------------|");
                put_line("|               ___");
                put_line("|              (   )");
                put_line("|             ( 0.0 )");
                put_line("|              ( ^ )");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
            end if;
            
            if stage = 2 then
                put_line("-----------------|");
                put_line("|               ___");
                put_line("|              (   )");
                put_line("|             ( 0.0 )");
                put_line("|              ( ^ )");
                put_line("|             8888888");
                put_line("|              88888");
                put_line("|               888");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
            end if;
            
            if stage = 3 then
                put_line("-----------------|");
                put_line("|               ___");
                put_line("|              (   )");
                put_line("|             ( 0.0 )");
                put_line("|              ( ^ )");
                put_line("|            /8888888");
                put_line("|           /  88888");
                put_line("|               888");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
            end if;
            
            if stage = 4 then
                put_line("-----------------|");
                put_line("|               ___");
                put_line("|              (   )");
                put_line("|             ( 0.0 )");
                put_line("|              ( ^ )");
                put_line("|            /8888888\");
                put_line("|           /  88888  \");
                put_line("|               888     ");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
                put_line("|");
            end if;
            
            if stage = 5 then
                put_line("-----------------|");
                put_line("|               ___");
                put_line("|              (   )");
                put_line("|             ( 0.0 )");
                put_line("|              ( ^ )");
                put_line("|            /8888888\");
                put_line("|           /  88888  \");
                put_line("|               888     ");
                put_line("|              /");
                put_line("|             /");
                put_line("|            /");
                put_line("|");
                put_line("|");
                put_line("|");
            end if;
            
            if stage = 6 then
                put_line("-----------------|");
                put_line("|               ___");
                put_line("|              (   )");
                put_line("|             ( 0.0 )");
                put_line("|              ( ^ )");
                put_line("|            /8888888\");
                put_line("|           /  88888  \");
                put_line("|               888    ");
                put_line("|              /   \");
                put_line("|             /     \");
                put_line("|            /       \");
                put_line("|");
                put_line("|");
                put_line("|");
            end if;
            
            if stage = 7 then
                put_line("-----------------|");
                put_line("|               ___");
                put_line("|              (   )");
                put_line("|             ( 0.0 )");
                put_line("|              ( ^ )");
                put_line("|            /8888888\");
                put_line("|           /  88888  \");
                put_line("|          M    888    \");
                put_line("|              /   \");
                put_line("|             /     \");
                put_line("|            /       \");
                put_line("|");
                put_line("|");
                put_line("|");
            end if;
            
            if stage = 8 then
                put_line("-----------------|");
                put_line("|               ___");
                put_line("|              (   )");
                put_line("|             ( 0.0 )");
                put_line("|              ( ^ )");
                put_line("|            /8888888\");
                put_line("|           /  88888  \");
                put_line("|          M    888    M");
                put_line("|              /   \");
                put_line("|             /     \");
                put_line("|            /       \");
                put_line("|");
                put_line("|");
                put_line("|");
            end if;
            
            if stage = 9 then
                put_line("-----------------|");
                put_line("|               ___");
                put_line("|              (   )");
                put_line("|             ( 0.0 )");
                put_line("|              ( ^ )");
                put_line("|            /8888888\");
                put_line("|           /  88888  \");
                put_line("|          M    888    M");
                put_line("|              /   \");
                put_line("|             /     \");
                put_line("|           <|       \");
                put_line("|");
                put_line("|");
                put_line("|");
            end if;
            
            if stage = 10 then
                put_line("-----------------|");
                put_line("|               ___");
                put_line("|              (   )");
                put_line("|             ( 0.0 )");
                put_line("|              ( ^ )");
                put_line("|            /8888888\");
                put_line("|           /  88888  \");
                put_line("|          M    888    M");
                put_line("|              /   \");
                put_line("|             /     \");
                put_line("|           <|       |>");
                put_line("|");
                put_line("|");
                put_line("|");
            end if;
    end draw;


    type Dict is array(1..200) of unbounded_string;
    data : Dict;
    infp : file_type;
    usedWords, wordFromFile, theWord, playerStr : unbounded_string;
    lettersLeft, i, randomWordIndex, wordLength, wrongCount : integer;
    endGame, WrongFlag : Boolean;
    input, playAgain: character;    
    subtype Die is Integer range 1 .. 200;
    package Random_Die is new Ada.Numerics.Discrete_Random (Die);
    use Random_Die;
    G : Generator;
    
    
        
    begin
        
        i:=1;
        playAgain :='y';
        
        
        open(infp,in_file,"a2dict.txt"); -- populate array with words from the file
        loop
            exit when end_of_file(infp);
            get_line(infp,wordFromFile); 
            data(i) := (wordFromFile);
            i:=i+1; 
        end loop;
        close(infp);
        
            
       
        while playAgain = 'y' or playAgain ='Y' loop
            
            reset(G);
            wrongCount:=0;
            wrongFlag := true;
            usedWords := To_Unbounded_String("          ");
            endGame := false;
            
            
            randomWordIndex:=Random(G); -- random number 
            theWord := data(randomWordIndex); -- the word picked at random from the array of strings
            wordLength := length(theWord); -- length of word to be guessed
            lettersLeft := wordLength; -- number of letters left to guess
            playerStr := theWord; --string that the characters are going to be placed in
            
        
        for j in 1..wordLength loop -- replace letters in the string with blanks
            Replace_Element(playerStr,j,'-');
        end loop;
            
        
            while endGame = false and wrongCount<10 loop -- while all correct letters have not been guessed
                                                         -- and while less than 10 wrong guesses have been made the game continues
                endGame := true;
                put_line("please enter a guess");
                put_line(" ");
                put_line(playerStr);
                get (input);
                
                
                
                for k in 1..wordLength loop -- go through the string and replace the character if it exists
                    if Element(theWord,k) = input then
                        wrongFlag := false;
                        Replace_Element(playerStr,k,input);
                        lettersLeft:= lettersLeft-1;
                    end if;
                end loop;
                
                
                
                if wrongFlag = true then --if the character did not exist increment number of wrong guesses and print message
                    draw(wrongCount);
                    wrongCount := wrongCount +1;
                    Replace_Element(usedWords,wrongCount,input);
                    put_line("that was an incorrect guess."); 
                    put("Your incorrect guesses are: ");
                    put_line(usedWords);
                    
                end if;
                
                
                wrongFlag := true; --set game end flag to true until existence of blank spaces are confirmed
                
                
                for x in 1..wordLength loop -- check if game has finished by looking for blank spaces in the string
                    if Element(playerStr,x) = '-' then
                        endGame := false;
                    end if;
                end loop;
                
                if endGame = true then -- message upon successful completion
                    put_line(playerStr);
                    put_line("Congratulations!");
                end if;
                
                if wrongCount = 10 then -- message upon 10 unsuccessful guesses
                    put("You Lost. The word was: ");
                    put_line(theWord);
                end if;
                put_line(" ");
                
            end loop;
            
            put_line("would you like play again? (y/n)");
            get(playAgain);
        end loop;
        
    end a2;

