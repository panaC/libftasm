
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "tddc.h"
#include "libftasm.h"

#define HELLO	"hello world"
#define HELLO_N 12

int tests_run = 0;

int		bzero_test_01(void)
{
	printf("bzero_test_01\n");
	char* str = malloc(12);

	strcpy(str, "hello world");
	printf("before : %12s|%p\n", str, str);

	ft_bzero(str, 12);

	for (int i = 0; i < 12; i++)
	{
		_assert(str[i] == 0);
	}
	
	printf("after  : %12s|%p\n", str, str);
	return 0;
}

int		strcpy_test_01(void)
{
	printf("strcpy_test_01\n");
	char* strNew = malloc(HELLO_N);
	char* strCpy = HELLO;

	char *str = ft_strcpy(strNew, strCpy);

	for (int i = 0; i < HELLO_N; i++)
	{
		printf("%c|%c", str[i], strCpy[i]);
		_assert(str[i] == strCpy[i]);
	}
	printf("END\n");
	return 0;
}

#define STR1	""
#define STR2	"hello world"
#define STR3	"TESTtestTESTtestTEST"

int		strlen_test_01(void)
{
	printf("strlen_test_01\n");
	printf("%ld|%ld\n", ft_strlen(STR1), strlen(STR1));
	_assert(ft_strlen(STR1) ==
			strlen(STR1));
	printf("%ld|%ld\n", ft_strlen(STR2), strlen(STR2));
	_assert(ft_strlen(STR2) == strlen(STR2));
	printf("%ld|%ld\n", ft_strlen(STR3), strlen(STR3));
	_assert(ft_strlen(STR3) == strlen(STR3));
	printf("END\n");
	return 0;
}

int		strcat_test_01(void)
{
	char* strR = malloc(100);
	char* strL = malloc(100);
	char* ptrR;
	char* ptrL;

	printf("strcat_test_01\n");
	strcpy(strR, STR1);
	strcpy(strL, STR1);
	ptrR = strcat(strR, STR1);
	ptrL = ft_strcat(strL, STR1);
	printf(">%s|%s<\n", ptrR, ptrL);
	_assert(strcmp(ptrR, ptrL) == 0);
	ptrR = strcat(strR, STR2);
	ptrL = ft_strcat(strL, STR2);
	printf(">%s|%s<\n", ptrR, ptrL);
	_assert(strcmp(ptrR, ptrL) == 0);
	ptrR = strcat(strR, STR3);
	ptrL = ft_strcat(strL, STR3);
	printf(">%s|%s<\n", ptrR, ptrL);
	_assert(strcmp(ptrR, ptrL) == 0);
	strcpy(strR, STR3);
	strcpy(strL, STR3);
	ptrR = strcat(strR, STR3);
	ptrL = ft_strcat(strL, STR3);
	printf(">%s|%s<\n", ptrR, ptrL);
	_assert(strcmp(ptrR, ptrL) == 0);
	ptrR = strcat(strR, STR1);
	ptrL = ft_strcat(strL, STR1);
	printf(">%s|%s<\n", ptrR, ptrL);
	_assert(strcmp(ptrR, ptrL) == 0);
	ptrR = strcat(strR, STR2);
	ptrL = ft_strcat(strL, STR2);
	printf(">%s|%s<\n", ptrR, ptrL);
	_assert(strcmp(ptrR, ptrL) == 0);
	printf("END\n");
	return 0;
}

int		toupper_test_01(void)
{
	printf("toupper_test_01\n");
	_assert(ft_toupper('a') == 'A');
	_assert(ft_toupper('z') == 'Z');
	_assert(ft_toupper(-12344353) == -12344353);
	_assert(ft_toupper(12344353) == 12344353);
	_assert(ft_toupper(97) == 65);
	_assert(ft_toupper(122) == 90);
	_assert(ft_toupper(96) == 96);
	_assert(ft_toupper(123) == 123);
	printf("end\n");
	return 0;
}

int		tolower_test_01(void)
{
	printf("tolower_test_01\n");
	_assert(ft_tolower('A') == 'a');
	_assert(ft_tolower('Z') == 'z');
	_assert(ft_tolower(-12344353) == -12344353);
	_assert(ft_tolower(12344353) == 12344353);
	_assert(ft_tolower(65) == 97);
	_assert(ft_tolower(90) == 122);
	_assert(ft_tolower(64) == 64);
	_assert(ft_tolower(91) == 91);
	printf("end\n");
	return 0;
}

int		isalnum_test_01(void)
{
	printf("isalnum_test_01\n");
	_assert(ft_isalnum('a') == 1);
	_assert(ft_isalnum('Z') == 1);
	_assert(ft_isalnum(-12344353) == 0);
	_assert(ft_isalnum(12344353) == 0);
	_assert(ft_isalnum(65) == 1);
	_assert(ft_isalnum(90) == 1);
	_assert(ft_isalnum(64) == 0);
	_assert(ft_isalnum(91) == 0);
	_assert(ft_isalnum('0') == 1);
	_assert(ft_isalnum('9') == 1);
	printf("end\n");
	return 0;
}

int		isalpha_test_01(void)
{
	printf("isalpha_test_01\n");
	_assert(ft_isalpha('a') == 1);
	_assert(ft_isalpha('Z') == 1);
	_assert(ft_isalpha(-12344353) == 0);
	_assert(ft_isalpha(12344353) == 0);
	_assert(ft_isalpha(65) == 1);
	_assert(ft_isalpha(90) == 1);
	_assert(ft_isalpha('0') == 0);
	_assert(ft_isalpha('9') == 0);
	printf("end\n");
	return 0;
}

int		isascii_test_01(void)
{
	printf("isascii_test_01\n");
	_assert(ft_isascii('a') == 1);
	_assert(ft_isascii('Z') == 1);
	_assert(ft_isascii(-12344353) == 0);
	_assert(ft_isascii(12344353) == 0);
	_assert(ft_isascii(65) == 1);
	_assert(ft_isascii(90) == 1);
	_assert(ft_isascii('0') == 1);
	_assert(ft_isascii('9') == 1);
	printf("end\n");
	return 0;
}

int		isdigit_test_01(void)
{
	printf("isdigit_test_01\n");
	_assert(ft_isdigit('a') == 0);
	_assert(ft_isdigit('Z') == 0);
	_assert(ft_isdigit(-12344353) == 0);
	_assert(ft_isdigit(12344353) == 0);
	_assert(ft_isdigit(47) == 0);
	_assert(ft_isdigit(58) == 0);
	_assert(ft_isdigit('0') == 1);
	_assert(ft_isdigit('9') == 1);
	printf("end\n");
	return 0;
}

int		islower_test_01(void)
{
	printf("islower_test_01\n");
	_assert(ft_islower('a') == 1);
	_assert(ft_islower('Z') == 0);
	_assert(ft_islower(-12344353) == 0);
	_assert(ft_islower(12344353) == 0);
	_assert(ft_islower(96) == 0);
	_assert(ft_islower(123) == 0);
	_assert(ft_islower('0') == 0);
	_assert(ft_islower('9') == 0);
	printf("end\n");
	return 0;
}

int		isprint_test_01(void)
{
	printf("isprint_test_01\n");
	_assert(ft_isprint('a') == 1);
	_assert(ft_isprint('Z') == 1);
	_assert(ft_isprint(-12344353) == 0);
	_assert(ft_isprint(12344353) == 0);
	_assert(ft_isprint(31) == 0);
	_assert(ft_isprint(127) == 0);
	printf("end\n");
	return 0;
}

int		isupper_test_01(void)
{
	printf("isupper_test_01\n");
	_assert(ft_isupper('a') == 0);
	_assert(ft_isupper('Z') == 1);
	_assert(ft_isupper(-12344353) == 0);
	_assert(ft_isupper(12344353) == 0);
	_assert(ft_isupper(64) == 0);
	_assert(ft_isupper(91) == 0);
	_assert(ft_isupper('0') == 0);
	_assert(ft_isupper('9') == 0);
	printf("end\n");
	return 0;
}

int		puts_test_01(void)
{
	printf("puts_test_01\n");
	int retL;
	int retR;

	retL = puts(HELLO);
	retR = ft_puts(HELLO);
	printf("%d|%d\n", retL,retR);
	_assert(retL == retR);

	retL = puts("");
	retR = ft_puts("");
	printf("%d|%d\n", retL,retR);
	_assert(retL == retR);

	/*
	// segv on puts
	retL = puts(NULL);
	retR = ft_puts(NULL);
	printf("%d|%d\n", retL,retR);
	_assert(retL == retR);
	*/
	printf("end\n");
	return 0;
}

int		all_tests(void)
{
	_verify(bzero_test_01);
	_verify(strcpy_test_01);
	_verify(strlen_test_01);
	_verify(strcpy_test_01);
	_verify(strcat_test_01);
	_verify(toupper_test_01);
	_verify(tolower_test_01);
	_verify(isalnum_test_01);
	_verify(isalpha_test_01);
	_verify(isascii_test_01);
	_verify(isdigit_test_01);
	_verify(islower_test_01);
	_verify(isprint_test_01);
	_verify(isupper_test_01);
	_verify(puts_test_01);
	return 0;
}

int		main(void)
{
	int result = all_tests();
	if (result == 0)
		printf("\nRESULT : PASSED\n");
	printf("Tests run: %d\n", tests_run);

	return result != 0;
}
