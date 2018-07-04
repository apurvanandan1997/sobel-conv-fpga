/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/apurvan/Projects/sobel-conv-master/file_reading_and_writing/file_reading_and_writing.vhd";
extern char *STD_TEXTIO;
extern char *IEEE_P_3564397177;

void ieee_p_3564397177_sub_2250825304603680424_91900896(char *, char *, char *, char *, char *, unsigned char , int );
void ieee_p_3564397177_sub_3261611579494183203_91900896(char *, char *, char *, char *, char *, char *);


static void work_a_1361698332_0831356973_p_0(char *t0)
{
    char t5[16];
    char t21[8];
    char t22[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned char t10;
    unsigned char t11;
    char *t12;
    unsigned char t13;
    char *t14;
    char *t15;
    int64 t16;
    unsigned char t17;
    unsigned char t18;
    unsigned char t19;
    unsigned char t20;

LAB0:    t1 = (t0 + 3256U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 2256U);
    t3 = (t0 + 6604);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 1;
    t7 = (t6 + 4U);
    *((int *)t7) = 5;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (5 - 1);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    std_textio_file_open1(t2, t3, t5, (unsigned char)0);
    xsi_set_current_line(61, ng0);
    t2 = (t0 + 2360U);
    t3 = (t0 + 6609);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 1;
    t7 = (t6 + 4U);
    *((int *)t7) = 5;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (5 - 1);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    std_textio_file_open1(t2, t3, t5, (unsigned char)1);
    xsi_set_current_line(63, ng0);

LAB4:    t2 = (t0 + 2256U);
    t10 = std_textio_endfile(t2);
    t11 = (!(t10));
    if (t11 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(93, ng0);
    t2 = (t0 + 2256U);
    std_textio_file_close(t2);
    xsi_set_current_line(94, ng0);
    t2 = (t0 + 2360U);
    std_textio_file_close(t2);
    xsi_set_current_line(96, ng0);

LAB38:    *((char **)t1) = &&LAB39;

LAB1:    return;
LAB5:    xsi_set_current_line(64, ng0);
    t3 = (t0 + 3640);
    t4 = (t3 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t12 = *((char **)t7);
    *((unsigned char *)t12) = (unsigned char)2;
    xsi_driver_first_trans_fast(t3);
    xsi_set_current_line(65, ng0);
    t2 = (t0 + 3064);
    t3 = (t0 + 2256U);
    t4 = (t0 + 2536U);
    std_textio_readline(STD_TEXTIO, t2, t3, t4);
    xsi_set_current_line(67, ng0);

LAB8:    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t11 = *((unsigned char *)t3);
    if (t11 == 1)
        goto LAB12;

LAB13:    t10 = (unsigned char)0;

LAB14:    if (t10 != 0)
        goto LAB9;

LAB11:    goto LAB4;

LAB6:;
LAB9:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 3064);
    t6 = (t0 + 2536U);
    t7 = (t0 + 1448U);
    t12 = *((char **)t7);
    t7 = (t0 + 6416U);
    t14 = (t0 + 1688U);
    t15 = *((char **)t14);
    t14 = (t15 + 0);
    ieee_p_3564397177_sub_3261611579494183203_91900896(IEEE_P_3564397177, t2, t6, t12, t7, t14);
    xsi_set_current_line(69, ng0);
    t2 = (t0 + 3064);
    t3 = (t0 + 2536U);
    t4 = (t0 + 1568U);
    t6 = *((char **)t4);
    t4 = (t6 + 0);
    t7 = (t0 + 1808U);
    t12 = *((char **)t7);
    t7 = (t12 + 0);
    std_textio_read7(STD_TEXTIO, t2, t3, t4, t7);
    xsi_set_current_line(71, ng0);
    t16 = (1 * 1000LL);
    t2 = (t0 + 3064);
    xsi_process_wait(t2, t16);

LAB17:    *((char **)t1) = &&LAB18;
    goto LAB1;

LAB10:;
LAB12:    t2 = (t0 + 1808U);
    t4 = *((char **)t2);
    t13 = *((unsigned char *)t4);
    t10 = t13;
    goto LAB14;

LAB15:    xsi_set_current_line(72, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t13 = *((unsigned char *)t3);
    if (t13 == 1)
        goto LAB25;

LAB26:    t11 = (unsigned char)0;

LAB27:    if (t11 == 1)
        goto LAB22;

LAB23:    t10 = (unsigned char)0;

LAB24:    if (t10 != 0)
        goto LAB19;

LAB21:    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t13 = *((unsigned char *)t3);
    if (t13 == 1)
        goto LAB33;

LAB34:    t11 = (unsigned char)0;

LAB35:    if (t11 == 1)
        goto LAB30;

LAB31:    t10 = (unsigned char)0;

LAB32:    if (t10 != 0)
        goto LAB28;

LAB29:
LAB20:    goto LAB8;

LAB16:    goto LAB15;

LAB18:    goto LAB16;

LAB19:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 3640);
    t7 = (t2 + 56U);
    t12 = *((char **)t7);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = (unsigned char)2;
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(76, ng0);
    t2 = (t0 + 3064);
    t3 = (t0 + 2608U);
    t4 = (t0 + 1448U);
    t6 = *((char **)t4);
    memcpy(t21, t6, 8U);
    t4 = (t0 + 6416U);
    ieee_p_3564397177_sub_2250825304603680424_91900896(IEEE_P_3564397177, t2, t3, t21, t4, (unsigned char)0, 0);
    xsi_set_current_line(77, ng0);
    t2 = (t0 + 3064);
    t3 = (t0 + 2608U);
    t4 = (t0 + 1568U);
    t6 = *((char **)t4);
    t10 = *((unsigned char *)t6);
    std_textio_write4(STD_TEXTIO, t2, t3, t10, (unsigned char)0, 0);
    goto LAB20;

LAB22:    t2 = (t0 + 1568U);
    t6 = *((char **)t2);
    t18 = *((unsigned char *)t6);
    t19 = (t18 == (unsigned char)13);
    t20 = (!(t19));
    t10 = t20;
    goto LAB24;

LAB25:    t2 = (t0 + 1808U);
    t4 = *((char **)t2);
    t17 = *((unsigned char *)t4);
    t11 = t17;
    goto LAB27;

LAB28:    xsi_set_current_line(80, ng0);
    t2 = (t0 + 3064);
    t7 = (t0 + 2608U);
    t12 = (t0 + 1448U);
    t14 = *((char **)t12);
    memcpy(t22, t14, 8U);
    t12 = (t0 + 6416U);
    ieee_p_3564397177_sub_2250825304603680424_91900896(IEEE_P_3564397177, t2, t7, t22, t12, (unsigned char)0, 0);
    xsi_set_current_line(81, ng0);
    t2 = (t0 + 3064);
    t3 = (t0 + 2608U);
    std_textio_write4(STD_TEXTIO, t2, t3, (unsigned char)13, (unsigned char)0, 0);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 3064);
    t3 = (t0 + 2360U);
    t4 = (t0 + 2608U);
    std_textio_writeline(STD_TEXTIO, t2, t3, t4);
    goto LAB20;

LAB30:    t2 = (t0 + 1568U);
    t6 = *((char **)t2);
    t18 = *((unsigned char *)t6);
    t19 = (t18 == (unsigned char)13);
    t10 = t19;
    goto LAB32;

LAB33:    t2 = (t0 + 1808U);
    t4 = *((char **)t2);
    t17 = *((unsigned char *)t4);
    t11 = t17;
    goto LAB35;

LAB36:    goto LAB2;

LAB37:    goto LAB36;

LAB39:    goto LAB37;

}


extern void work_a_1361698332_0831356973_init()
{
	static char *pe[] = {(void *)work_a_1361698332_0831356973_p_0};
	xsi_register_didat("work_a_1361698332_0831356973", "isim/example_file_io_tb_isim_beh.exe.sim/work/a_1361698332_0831356973.didat");
	xsi_register_executes(pe);
}
