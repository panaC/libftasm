/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   tddc.h                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: pierre <pleroux@student.42.fr>             +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2018/01/27 11:08:13 by pierre            #+#    #+#             */
/*   Updated: 2018/01/27 13:31:05 by pierre           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */


#ifndef __TDDC_H_
# define __TDDC_H_
# include <stdio.h>

extern int tests_run;

#define FAIL() printf("\nfailure in %s() line %d\n", __func__, __LINE__)
#define _assert(test) do { if (!(test)) { FAIL(); return 1; } } while(0)
#define _verify(test) do { int r=test(); tests_run++; if(r) return r; } while(0)

#endif
