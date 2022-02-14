package Back;

/**
 *
 * @author Henry
 */
public class Token {

    private int line;
    private int column;
    private String lex;

    public Token(int line, int column, String lex) {
        this.line = line;
        this.column = column;
        this.lex = lex;
    }

    public int getLine() {
        return line;
    }

    public void setLine(int line) {
        this.line = line;
    }

    public int getColumn() {
        return column;
    }

    public void setColumn(int column) {
        this.column = column;
    }

    public String getLex() {
        return lex;
    }

    public void setLex(String lex) {
        this.lex = lex;
    }
    
    
}
