From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: gcc-4.5 -fdelayed-branch strikes back
Date: Sun, 27 Jun 2010 18:20:45 -0400
Message-ID: <20100627222044.GA14627@hiauly1.hia.nrc.ca>
References: <20100604181712.43456ddb@borg.bxl.tuxicoman.be> <20100604193229.473BB515D@hiauly1.hia.nrc.ca> <20100605115808.0ff33504@borg.bxl.tuxicoman.be> <20100607232907.GA10176@hiauly1.hia.nrc.ca> <20100611194516.496c2ddf@zombie> <20100613192447.GA14692@hiauly1.hia.nrc.ca> <20100627154804.1de3b212@borg.bxl.tuxicoman.be>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100627154804.1de3b212@borg.bxl.tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Guy,

I have not been able to reproduce your problem.  Originally, there
was a problem bootstrapping with

make -j2 LDFLAGS="-Wl,-O1" STAGE1_CFLAGS="-g3 -O2" BOOT_CFLAGS="-g -O2 -pipe -march=2.0" bootstrap-lean &&

but even that went away.  I have built gcc-4.6 (head) and gcc-4.5 (branch)
from svn sources numerous times without problems.  My current bootstrap
compiler is: gcc version 4.4.4 (Debian 4.4.4-5).

In general, delayed branch issues are not target specific as the
majority of the implementation is in reorg.  However, parisc is very
sensitive to reorg bugs.

There have been a few changes to the parisc port in the last month.
The most likely change to have an effect on parisc-linux is the change
to kill -freorder-blocks-and-partition.  I think it unlikely that this
affects bootstrap.  It's possible a change to the common code has
changed things.

More information is needed regarding the nature of the fault, where
it is, and how to reproduce (e.g., can it be reproduced with x86 cross).
If it really is a delayed branch issue, this needs to be a gcc PR.

Dave

On Sun, 27 Jun 2010, Guy Martin wrote:

> 
> Hi Dave,
> 
> What commit/version were you using exactly for your tests ?
> 
> I've setup a debian chroot on both my c3600 and c8000 and I'm able to
> reproduce with the latest experimental gcc :
> gcc version 4.5.1 20100527 (prerelease) (Debian 4.5.0-4) 
> 
> On my gentoo systems, the compiler used to build gcc didn't seem to
> make a difference, I've tried 4.2.4, 4.3.3 and 4.4.3, every gcc-4.5
> compiled with those failed the same way.
> 
> I've reattached the test case since I removed the dependency to
> libiberty.h.
> 
> Regards,
>   Guy
> 
> On Sun, 13 Jun 2010 15:24:47 -0400
> John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> 
> > On Fri, 11 Jun 2010, Guy Martin wrote:
> > 
> > Hi Guy,
> > 
> > > The test case should make things pretty easy to repro. But if you
> > > need some more details let me know.
> > 
> > I wasn't able to get your testcase to fail with my last build of
> > 4.5.1. It used 4.3.3 for the bootstrap compiler.  I'm fairly certain
> > 4.5 is being miscompliled in stage1 when 4.4 is used as the bootstap
> > compiler.
> > 
> > Dave
> 

> /* Generate code to allocate RTL structures.
>    Copyright (C) 1997, 1998, 1999, 2000, 2002, 2003, 2004, 2007
>    Free Software Foundation, Inc.
> 
> This file is part of GCC.
> 
> GCC is free software; you can redistribute it and/or modify it under
> the terms of the GNU General Public License as published by the Free
> Software Foundation; either version 3, or (at your option) any later
> version.
> 
> GCC is distributed in the hope that it will be useful, but WITHOUT ANY
> WARRANTY; without even the implied warranty of MERCHANTABILITY or
> FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
> for more details.
> 
> You should have received a copy of the GNU General Public License
> along with GCC; see the file COPYING3.  If not see
> <http://www.gnu.org/licenses/>.  */
> 
> 
> #include <string.h>
> #include <stdio.h>
> #define gcc_unreachable() __builtin_unreachable()
> 
> struct rtx_definition
> {
>   const char *const enumname, *const name, *const format;
> };
> 
> /* rtl.def needs CONST_DOUBLE_FORMAT, but we don't care what
>    CONST_DOUBLE_FORMAT is because we're not going to be generating
>    anything for CONST_DOUBLE anyway.  */
> #define CONST_DOUBLE_FORMAT ""
> 
> #define DEF_RTL_EXPR(ENUM, NAME, FORMAT, CLASS) { #ENUM, NAME, FORMAT },
> 
>  const struct rtx_definition defs[] =
> {
> DEF_RTL_EXPR(UNKNOWN, "UnKnown", "*", RTX_EXTRA)
> DEF_RTL_EXPR(VALUE, "value", "0", RTX_OBJ)
> DEF_RTL_EXPR(DEBUG_EXPR, "debug_expr", "0", RTX_OBJ)
> DEF_RTL_EXPR(EXPR_LIST, "expr_list", "ee", RTX_EXTRA)
> DEF_RTL_EXPR(INSN_LIST, "insn_list", "ue", RTX_EXTRA)
> DEF_RTL_EXPR(SEQUENCE, "sequence", "E", RTX_EXTRA)
> DEF_RTL_EXPR(ADDRESS, "address", "e", RTX_MATCH)
> DEF_RTL_EXPR(DEBUG_INSN, "debug_insn", "iuuBieie", RTX_INSN)
> DEF_RTL_EXPR(INSN, "insn", "iuuBieie", RTX_INSN)
> DEF_RTL_EXPR(JUMP_INSN, "jump_insn", "iuuBieie0", RTX_INSN)
> DEF_RTL_EXPR(CALL_INSN, "call_insn", "iuuBieiee", RTX_INSN)
> DEF_RTL_EXPR(BARRIER, "barrier", "iuu00000", RTX_EXTRA)
> DEF_RTL_EXPR(CODE_LABEL, "code_label", "iuuB00is", RTX_EXTRA)
> DEF_RTL_EXPR(NOTE, "note", "iuuB0ni", RTX_EXTRA)
> DEF_RTL_EXPR(COND_EXEC, "cond_exec", "ee", RTX_EXTRA)
> DEF_RTL_EXPR(PARALLEL, "parallel", "E", RTX_EXTRA)
> DEF_RTL_EXPR(ASM_INPUT, "asm_input", "si", RTX_EXTRA)
> DEF_RTL_EXPR(ASM_OPERANDS, "asm_operands", "ssiEEEi", RTX_EXTRA)
> DEF_RTL_EXPR(UNSPEC, "unspec", "Ei", RTX_EXTRA)
> DEF_RTL_EXPR(UNSPEC_VOLATILE, "unspec_volatile", "Ei", RTX_EXTRA)
> DEF_RTL_EXPR(ADDR_VEC, "addr_vec", "E", RTX_EXTRA)
> DEF_RTL_EXPR(ADDR_DIFF_VEC, "addr_diff_vec", "eEee0", RTX_EXTRA)
> DEF_RTL_EXPR(PREFETCH, "prefetch", "eee", RTX_EXTRA)
> DEF_RTL_EXPR(SET, "set", "ee", RTX_EXTRA)
> DEF_RTL_EXPR(USE, "use", "e", RTX_EXTRA)
> DEF_RTL_EXPR(CLOBBER, "clobber", "e", RTX_EXTRA)
> DEF_RTL_EXPR(CALL, "call", "ee", RTX_EXTRA)
> DEF_RTL_EXPR(RETURN, "return", "", RTX_EXTRA)
> DEF_RTL_EXPR(EH_RETURN, "eh_return", "", RTX_EXTRA)
> DEF_RTL_EXPR(TRAP_IF, "trap_if", "ee", RTX_EXTRA)
> DEF_RTL_EXPR(CONST_INT, "const_int", "w", RTX_CONST_OBJ)
> DEF_RTL_EXPR(CONST_FIXED, "const_fixed", "www", RTX_CONST_OBJ)
> DEF_RTL_EXPR(CONST_DOUBLE, "const_double", CONST_DOUBLE_FORMAT, RTX_CONST_OBJ)
> DEF_RTL_EXPR(CONST_VECTOR, "const_vector", "E", RTX_CONST_OBJ)
> DEF_RTL_EXPR(CONST_STRING, "const_string", "s", RTX_OBJ)
> DEF_RTL_EXPR(CONST, "const", "e", RTX_CONST_OBJ)
> DEF_RTL_EXPR(PC, "pc", "", RTX_OBJ)
> DEF_RTL_EXPR(REG, "reg", "i00", RTX_OBJ)
> DEF_RTL_EXPR(SCRATCH, "scratch", "0", RTX_OBJ)
> DEF_RTL_EXPR(SUBREG, "subreg", "ei", RTX_EXTRA)
> DEF_RTL_EXPR(STRICT_LOW_PART, "strict_low_part", "e", RTX_EXTRA)
> DEF_RTL_EXPR(CONCAT, "concat", "ee", RTX_OBJ)
> DEF_RTL_EXPR(CONCATN, "concatn", "E", RTX_OBJ)
> DEF_RTL_EXPR(MEM, "mem", "e0", RTX_OBJ)
> DEF_RTL_EXPR(LABEL_REF, "label_ref", "u", RTX_CONST_OBJ)
> DEF_RTL_EXPR(SYMBOL_REF, "symbol_ref", "s00", RTX_CONST_OBJ)
> DEF_RTL_EXPR(CC0, "cc0", "", RTX_OBJ)
> DEF_RTL_EXPR(IF_THEN_ELSE, "if_then_else", "eee", RTX_TERNARY)
> DEF_RTL_EXPR(COMPARE, "compare", "ee", RTX_BIN_ARITH)
> DEF_RTL_EXPR(PLUS, "plus", "ee", RTX_COMM_ARITH)
> DEF_RTL_EXPR(MINUS, "minus", "ee", RTX_BIN_ARITH)
> DEF_RTL_EXPR(NEG, "neg", "e", RTX_UNARY)
> DEF_RTL_EXPR(MULT, "mult", "ee", RTX_COMM_ARITH)
> DEF_RTL_EXPR(SS_MULT, "ss_mult", "ee", RTX_COMM_ARITH)
> DEF_RTL_EXPR(US_MULT, "us_mult", "ee", RTX_COMM_ARITH)
> DEF_RTL_EXPR(DIV, "div", "ee", RTX_BIN_ARITH)
> DEF_RTL_EXPR(SS_DIV, "ss_div", "ee", RTX_BIN_ARITH)
> DEF_RTL_EXPR(US_DIV, "us_div", "ee", RTX_BIN_ARITH)
> DEF_RTL_EXPR(MOD, "mod", "ee", RTX_BIN_ARITH)
> DEF_RTL_EXPR(UDIV, "udiv", "ee", RTX_BIN_ARITH)
> DEF_RTL_EXPR(UMOD, "umod", "ee", RTX_BIN_ARITH)
> DEF_RTL_EXPR(AND, "and", "ee", RTX_COMM_ARITH)
> DEF_RTL_EXPR(IOR, "ior", "ee", RTX_COMM_ARITH)
> DEF_RTL_EXPR(XOR, "xor", "ee", RTX_COMM_ARITH)
> DEF_RTL_EXPR(NOT, "not", "e", RTX_UNARY)
> DEF_RTL_EXPR(ASHIFT, "ashift", "ee", RTX_BIN_ARITH) /* shift left */
> DEF_RTL_EXPR(ROTATE, "rotate", "ee", RTX_BIN_ARITH) /* rotate left */
> DEF_RTL_EXPR(ASHIFTRT, "ashiftrt", "ee", RTX_BIN_ARITH) /* arithmetic shift right */
> DEF_RTL_EXPR(LSHIFTRT, "lshiftrt", "ee", RTX_BIN_ARITH) /* logical shift right */
> DEF_RTL_EXPR(ROTATERT, "rotatert", "ee", RTX_BIN_ARITH) /* rotate right */
> DEF_RTL_EXPR(SMIN, "smin", "ee", RTX_COMM_ARITH)
> DEF_RTL_EXPR(SMAX, "smax", "ee", RTX_COMM_ARITH)
> DEF_RTL_EXPR(UMIN, "umin", "ee", RTX_COMM_ARITH)
> DEF_RTL_EXPR(UMAX, "umax", "ee", RTX_COMM_ARITH)
> DEF_RTL_EXPR(PRE_DEC, "pre_dec", "e", RTX_AUTOINC)
> DEF_RTL_EXPR(PRE_INC, "pre_inc", "e", RTX_AUTOINC)
> DEF_RTL_EXPR(POST_DEC, "post_dec", "e", RTX_AUTOINC)
> DEF_RTL_EXPR(POST_INC, "post_inc", "e", RTX_AUTOINC)
> DEF_RTL_EXPR(PRE_MODIFY, "pre_modify", "ee", RTX_AUTOINC)
> DEF_RTL_EXPR(POST_MODIFY, "post_modify", "ee", RTX_AUTOINC)
> DEF_RTL_EXPR(NE, "ne", "ee", RTX_COMM_COMPARE)
> DEF_RTL_EXPR(EQ, "eq", "ee", RTX_COMM_COMPARE)
> DEF_RTL_EXPR(GE, "ge", "ee", RTX_COMPARE)
> DEF_RTL_EXPR(GT, "gt", "ee", RTX_COMPARE)
> DEF_RTL_EXPR(LE, "le", "ee", RTX_COMPARE)
> DEF_RTL_EXPR(LT, "lt", "ee", RTX_COMPARE)
> DEF_RTL_EXPR(GEU, "geu", "ee", RTX_COMPARE)
> DEF_RTL_EXPR(GTU, "gtu", "ee", RTX_COMPARE)
> DEF_RTL_EXPR(LEU, "leu", "ee", RTX_COMPARE)
> DEF_RTL_EXPR(LTU, "ltu", "ee", RTX_COMPARE)
> DEF_RTL_EXPR(UNORDERED, "unordered", "ee", RTX_COMM_COMPARE)
> DEF_RTL_EXPR(ORDERED, "ordered", "ee", RTX_COMM_COMPARE)
> DEF_RTL_EXPR(UNEQ, "uneq", "ee", RTX_COMM_COMPARE)
> DEF_RTL_EXPR(UNGE, "unge", "ee", RTX_COMPARE)
> DEF_RTL_EXPR(UNGT, "ungt", "ee", RTX_COMPARE)
> DEF_RTL_EXPR(UNLE, "unle", "ee", RTX_COMPARE)
> DEF_RTL_EXPR(UNLT, "unlt", "ee", RTX_COMPARE)
> DEF_RTL_EXPR(LTGT, "ltgt", "ee", RTX_COMM_COMPARE)
> DEF_RTL_EXPR(SIGN_EXTEND, "sign_extend", "e", RTX_UNARY)
> DEF_RTL_EXPR(ZERO_EXTEND, "zero_extend", "e", RTX_UNARY)
> DEF_RTL_EXPR(TRUNCATE, "truncate", "e", RTX_UNARY)
> DEF_RTL_EXPR(FLOAT_EXTEND, "float_extend", "e", RTX_UNARY)
> DEF_RTL_EXPR(FLOAT_TRUNCATE, "float_truncate", "e", RTX_UNARY)
> DEF_RTL_EXPR(FLOAT, "float", "e", RTX_UNARY)
> DEF_RTL_EXPR(FIX, "fix", "e", RTX_UNARY)
> DEF_RTL_EXPR(UNSIGNED_FLOAT, "unsigned_float", "e", RTX_UNARY)
> DEF_RTL_EXPR(UNSIGNED_FIX, "unsigned_fix", "e", RTX_UNARY)
> DEF_RTL_EXPR(FRACT_CONVERT, "fract_convert", "e", RTX_UNARY)
> DEF_RTL_EXPR(UNSIGNED_FRACT_CONVERT, "unsigned_fract_convert", "e", RTX_UNARY)
> DEF_RTL_EXPR(SAT_FRACT, "sat_fract", "e", RTX_UNARY)
> DEF_RTL_EXPR(UNSIGNED_SAT_FRACT, "unsigned_sat_fract", "e", RTX_UNARY)
> DEF_RTL_EXPR(ABS, "abs", "e", RTX_UNARY)
> DEF_RTL_EXPR(SQRT, "sqrt", "e", RTX_UNARY)
> DEF_RTL_EXPR(BSWAP, "bswap", "e", RTX_UNARY)
> DEF_RTL_EXPR(FFS, "ffs", "e", RTX_UNARY)
> DEF_RTL_EXPR(CLZ, "clz", "e", RTX_UNARY)
> DEF_RTL_EXPR(CTZ, "ctz", "e", RTX_UNARY)
> DEF_RTL_EXPR(POPCOUNT, "popcount", "e", RTX_UNARY)
> DEF_RTL_EXPR(PARITY, "parity", "e", RTX_UNARY)
> DEF_RTL_EXPR(SIGN_EXTRACT, "sign_extract", "eee", RTX_BITFIELD_OPS)
> DEF_RTL_EXPR(ZERO_EXTRACT, "zero_extract", "eee", RTX_BITFIELD_OPS)
> DEF_RTL_EXPR(HIGH, "high", "e", RTX_CONST_OBJ)
> DEF_RTL_EXPR(LO_SUM, "lo_sum", "ee", RTX_OBJ)
> DEF_RTL_EXPR(VEC_MERGE, "vec_merge", "eee", RTX_TERNARY)
> DEF_RTL_EXPR(VEC_SELECT, "vec_select", "ee", RTX_BIN_ARITH)
> DEF_RTL_EXPR(VEC_CONCAT, "vec_concat", "ee", RTX_BIN_ARITH)
> DEF_RTL_EXPR(VEC_DUPLICATE, "vec_duplicate", "e", RTX_UNARY)
> DEF_RTL_EXPR(SS_PLUS, "ss_plus", "ee", RTX_COMM_ARITH)
> DEF_RTL_EXPR(US_PLUS, "us_plus", "ee", RTX_COMM_ARITH)
> DEF_RTL_EXPR(SS_MINUS, "ss_minus", "ee", RTX_BIN_ARITH)
> DEF_RTL_EXPR(SS_NEG, "ss_neg", "e", RTX_UNARY)
> DEF_RTL_EXPR(US_NEG, "us_neg", "e", RTX_UNARY)
> DEF_RTL_EXPR(SS_ABS, "ss_abs", "e", RTX_UNARY)
> DEF_RTL_EXPR(SS_ASHIFT, "ss_ashift", "ee", RTX_BIN_ARITH)
> DEF_RTL_EXPR(US_ASHIFT, "us_ashift", "ee", RTX_BIN_ARITH)
> DEF_RTL_EXPR(US_MINUS, "us_minus", "ee", RTX_BIN_ARITH)
> DEF_RTL_EXPR(SS_TRUNCATE, "ss_truncate", "e", RTX_UNARY)
> DEF_RTL_EXPR(US_TRUNCATE, "us_truncate", "e", RTX_UNARY)
> DEF_RTL_EXPR(VAR_LOCATION, "var_location", "tei", RTX_EXTRA)
> };
> #define ARRAY_SIZE(a) (sizeof (a) / sizeof ((a)[0]))
> #define NUM_RTX_CODE ARRAY_SIZE(defs)
> 
>  const char *formats[NUM_RTX_CODE];
> 
>  const char *type_from_format	(int);
>  const char *accessor_from_format	(int);
>  int special_format		(const char *);
>  void find_formats		(void);
>  void gendecl			(const char *);
> 
> 
>  const char *
> type_from_format (int c)
> {
>   switch (c)
>     {
>     case 'i':
>       return "int ";
> 
>     case 'w':
>       return "HOST_WIDE_INT ";
> 
>     case 's':
>       return "const char *";
> 
>     case 'e':  case 'u':
>       return "rtx ";
> 
>     case 'E':
>       return "rtvec ";
>     case 'b':
>       return "struct bitmap_head_def *";  /* bitmap - typedef not available */
>     case 't':
>       return "union tree_node *";  /* tree - typedef not available */
>     case 'B':
>       return "struct basic_block_def *";  /* basic block - typedef not available */
>     default:
>       gcc_unreachable ();
>     }
> }
> 
> /* Decode a format letter into the proper accessor function.  */
> 
>  const char *
> accessor_from_format (int c)
> {
>   switch (c)
>     {
>     case 'i':
>       return "XINT";
> 
>     case 'w':
>       return "XWINT";
> 
>     case 's':
>       return "XSTR";
> 
>     case 'e':  case 'u':
>       return "XEXP";
> 
>     case 'E':
>       return "XVEC";
> 
>     case 'b':
>       return "XBITMAP";
> 
>     case 't':
>       return "XTREE";
> 
>     case 'B':
>       return "XBBDEF";
> 
>     default:
>       gcc_unreachable ();
>     }
> }
> 
> 
> /* Place a list of all format specifiers we use into the array FORMAT.  */
> 
>  void
> find_formats (void)
> {
>   unsigned int i;
> 
>   for (i = 0; i < NUM_RTX_CODE; i++)
>     {
>       const char **f;
> 
>      if (strchr (defs[i].format, '*') != 0 || strchr (defs[i].format, 'V') != 0 || strchr (defs[i].format, 'S') != 0 || strchr (defs[i].format, 'n') != 0)
>        continue;
> 
>       for (f = formats; *f; f++)
> 	if (! strcmp (*f, defs[i].format))
> 	  break;
> 
>       if (*f == 0)
> 	*f = defs[i].format;
>     }
> }
> 
> /* Write the declarations for the routine to allocate RTL with FORMAT.  */
> 
>  void
> gendecl (const char *format)
> {
>   const char *p;
>   int i, pos;
> 
>   printf ("extern rtx gen_rtx_fmt_%s_stat\t (RTX_CODE, ", format);
>   printf ("enum machine_mode mode");
> 
>   /* Write each parameter that is needed and start a new line when the line
>      would overflow.  */
>   for (p = format, i = 0, pos = 75; *p != 0; p++)
>     if (*p != '0')
>       {
> 	int ourlen = strlen (type_from_format (*p)) + 6 + (i > 9);
> 
> 	printf (",");
> 	if (pos + ourlen > 76)
> 	  printf ("\n\t\t\t\t      "), pos = 39;
> 
> 	printf (" %sarg%d", type_from_format (*p), i++);
> 	pos += ourlen;
>       }
> }
> 
> 
> 
> /* This is the main program.  We accept only one argument, "-h", which
>    says we are writing the genrtl.h file.  Otherwise we are writing the
>    genrtl.c file.  */
> 
> int
> main (int argc, char **argv)
> {
>   find_formats ();
> 
>   const char **fmt;
> 
> 
>   for (fmt = formats; *fmt; ++fmt)
>     gendecl (*fmt);
> 
>   return 0;
> }


-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
