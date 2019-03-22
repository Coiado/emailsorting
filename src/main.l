%{

#include <stdio.h>
#include <string.h>

int dominio = 0;
int dominioUnicamp = 0;
int dominioFee = 0;

%}

LETRA   [a-zA-Z]
DIGITO  [0-9]


FEE     		fee.unicamp.br
UNICAMP 		unicamp.br
PRIMEIRAPARTE 	[A-Za-z0-9.]+
SEGUNDAPARTE 	[A-Za-z0-9.]*

DOMINIOFEE      ({PRIMEIRAPARTE}@{SEGUNDAPARTE}{FEE})
DOMINIOUNICAMP  ({PRIMEIRAPARTE}@{SEGUNDAPARTE}{UNICAMP})
DOMINIO         ({PRIMEIRAPARTE}@{PRIMEIRAPARTE})



%%

{DOMINIOFEE} {dominioUnicamp++;dominioFee++;dominio++;}
{DOMINIOUNICAMP} {dominioUnicamp++;dominio++;}
{DOMINIO} {dominio++; }

[[:space:]]+ ;
[[:^space:]]+ ;

[.\n]* ;

%%

int main() {
  yylex();
  printf("%d %d %d\n", dominio, dominioUnicamp, dominioFee);
  return 0;
}
