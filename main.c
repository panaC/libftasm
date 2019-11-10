
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
	_assert(ft_strlen(STR1) == strlen(STR1));
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

	printf("strcpy_test_01\n");
	strcpy(strR, STR1);
	strcpy(strL, STR1);
	/*ptrR = strcat(strR, STR1);
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
*/
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

int		all_tests(void)
{
	_verify(bzero_test_01);
	_verify(strcpy_test_01);
	_verify(strlen_test_01);
	_verify(strcat_test_01);
	_verify(strcpy_test_01);
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
