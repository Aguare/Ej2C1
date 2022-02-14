/* SECTION 1: user code */
package Back;
import java.util.ArrayList;


/* SECTION 2: config */

%%

%class Analizer
%unicode
%line
%column
%int
%public

Words = [a-zA-Z]+
Numbers = [0-9]+

%{
    private int oneVowel = 0;
    private int twoVowel = 0;
    private int threeVowel = 0;
    private int fourVowel = 0;
    private int fiveVowel = 0;
    private int noVowell = 0;
    private ArrayList<Token> tokenList = new ArrayList<>();

    private void countWords(String lexema) {
        switch(lexema.length() - lexema.replaceAll("[aeiouAEIOU]", "").length()) {
            case 1:
                oneVowel++;
                break;
            case 2:
                twoVowel++;
                break;
            case 3:
                threeVowel++;
                break;
            case 4:
                fourVowel++;
                break;
            case 5:
                fiveVowel++;
                break;
            default:
                noVowell++;
                break;
        }
    }

    private void addTokenList(int line, int column, String value) {
        this.tokenList.add(new Token((line+1), (column+1), value));
    }

    // GETTERS AND SETTERS
    public int[] getCounts() {
        return new int[] {oneVowel,twoVowel,threeVowel,fourVowel,fiveVowel,noVowell};
    }

    public ArrayList<Token> getTokens() {
        return this.tokenList;
    }
%}

%%

/* SECTION 3: lexical rules */
{Numbers}     {addTokenList(yyline,yycolumn,yytext());}
{Words}+    {countWords(yytext());}
[^]     {}