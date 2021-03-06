grammar Halstead;

@header {
	import java.util.*;
	import java.lang.Math;

}
@parser::members {
	Map<String, Integer> operators = new HashMap<String, Integer>();
	List<String> operatorsList = new ArrayList();

	Map<String, Integer> operands = new HashMap<String, Integer>();
	List<String> operandsList = new ArrayList();

	static void println(String str) {
		System.out.println(str);
	}

	static void print(String str) {
		System.out.print(str);
	}

	static double log2(double n) {
		return Math.log(n) / Math.log(2);
	}
}

metric : token* {
			int n1 = operators.keySet().size();
			print("n1 = "+n1+" ");
			println(Arrays.toString(operators.keySet().toArray()));

			int N1 = operatorsList.size();
			print("N1 = "+N1+" ");
			println(Arrays.toString(operatorsList.toArray()));

			int n2 = operands.keySet().size();
			print("n2 = "+n2+" ");
			println(Arrays.toString(operands.keySet().toArray()));

			int N2 = operandsList.size();
			print("N2 = "+N2+" ");
			println(Arrays.toString(operandsList.toArray()));

			int N = N1 + N2;
			int n = n1 + n2;
			println("N = "+N);
			println("n = "+n);

			double V = N*log2(n);
			double D = (n1/2.0)*(N2/(double)n2);
			double L = 1.0/D;
			double E = V*D;

			println("V = "+V);
			println("L = "+L);
			println("D = "+D);
			println("E = "+E);
			println("T = "+(E/18.0));



	  };

e : token* {
			int n1 = operators.keySet().size();

			int N1 = operatorsList.size();

			int n2 = operands.keySet().size();

			int N2 = operandsList.size();

			int N = N1 + N2;
			int n = n1 + n2;

			double V = N*log2(n);
			double D = (n1/2.0)*(N2/(double)n2);
			double L = 1.0/D;

operator :
// 'input' | 'print' |  // <- para el ejemplo del blog
'if'| 'then'| 'else'| 'unless'| 'while'| 'loop'| 'for'| 'foreach'| 'each'| 'do'| 'in'| 'between'
| 'when'| 'case'| 'switch'| 'repeat'| 'until'| 'try'| 'catch'| 'except'| 'on'| 'select'| 'from'| 'where'| 'class'| 'struct'| 'begin'| 'end'| 'program'| 'interface'| 'implementation'| 'uses'| 'import'| 'package'| 'module'| 'super'| 'this'| 'me'| 'self'| 'break'| 'go'| 'to'| 'goto'| 'downto'| 'default'| 'ensure'| 'rescue'| 'require'
| '<'| '>'| '<>'| '<='| '>='| '<=>'| '='| '=='| '=/='| '=~' | '/'| '/='| '*'| '*=' | '+'| '+='| '-'| '-='| '~'| '~='| '^'| '^='| '&'| '&='| '&&'| '|' | '||'| '|='| 'and'| 'or'| 'not'| '!'| '!='| '!!'| '@'| '#'| '$'| '%'| '?' | 'mod'| 'div' ;

operand
	: TOK
	| STRING
	;


TOK : [_a-zA-Z0-9]+ 
	  | ESC_SEQ
	  ;


STRING
    :  '"' ( ESC_SEQ |  ~('\\'|'"') )* '"'
    |  '\'' ( ESC_SEQ | ~('\\'|'\'') )* '\''
    ;

fragment
ESC_SEQ
    :   '\\' ( '\"'  | '\''  | '\\' | '|' | [a-zA-Z0-9]+ | '(' | ')' | '{' | '}' | '[' | ']' 
    | '+' | '*' | '-' | '/' | '^' | '%' | '$' | '&' | '<' | '>' | '=' | '~' | '!'
    | '@' | '#' | '.' | ',' | ';' | ':' | '?' | '\n' | '\r') ;


WS : ([ \r\n\t] | '(' | ')' | '[' | ']' | '{' | '}' | '.' | ';' | ':' | ',')+ -> skip;
