
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

int		all_tests(void)
{
	_verify(bzero_test_01);
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
