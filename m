Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA07426
	for <parisc-linux@puffin.external.hp.com>; Mon, 21 Jun 1999 13:39:49 -0600
Message-Id: <199906211938.PAA18558@hiauly1.hia.nrc.ca>
Subject: Re: Hack to head.S
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Mon, 21 Jun 1999 15:38:50 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Matthew.Wilcox@genedata.com, parisc-linux@thepuffingroup.com
In-Reply-To: <no.id> from "John David Anglin" at Jun 21, 99 01:03:15 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> It looks like the symbol __text_start can be used by main.c to
> determine the start of text when using the HP linker.

Here are two patches which appear to resolve this issue.  I have
tested linking with hpux 9.01.  Somebody needs to check whether
the symbol __text_start is available under 10.X and 11.

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

*** init/main.c.orig	Tue Feb 16 16:02:22 1999
--- init/main.c	Mon Jun 21 15:27:00 1999
***************
*** 56,62 ****
  #error sorry, your GCC is too old. It builds incorrect kernels.
  #endif
  
! extern char _stext, _etext;
  extern char *linux_banner;
  
  extern int console_loglevel;
--- 56,63 ----
  #error sorry, your GCC is too old. It builds incorrect kernels.
  #endif
  
! extern char __text_start;
! extern char _etext;
  extern char *linux_banner;
  
  extern int console_loglevel;
***************
*** 1132,1138 ****
  	if (prof_shift) {
  		prof_buffer = (unsigned int *) memory_start;
  		/* only text is profiled */
! 		prof_len = (unsigned long) &_etext - (unsigned long) &_stext;
  		prof_len >>= prof_shift;
  		memory_start += prof_len * sizeof(unsigned int);
  		memset(prof_buffer, 0, prof_len * sizeof(unsigned int));
--- 1133,1139 ----
  	if (prof_shift) {
  		prof_buffer = (unsigned int *) memory_start;
  		/* only text is profiled */
! 		prof_len = (unsigned long) &_etext-(unsigned long)&__text_start;
  		prof_len >>= prof_shift;
  		memory_start += prof_len * sizeof(unsigned int);
  		memset(prof_buffer, 0, prof_len * sizeof(unsigned int));
*** arch/parisc/kernel/head.S.orig	Mon Jun 21 10:38:05 1999
--- arch/parisc/kernel/head.S	Mon Jun 21 13:06:43 1999
***************
*** 32,39 ****
  
  ;	.section .text
  
! 	.space $DATA$
! 	.subspa $FLUFFY$,QUAD=1,ALIGN=8,ACCESS=0x2C,SORT=56
  
  	.EXPORT stext,ENTRY,PRIV_LEV=3,RTNVAL=GR
  	.EXPORT _stext,DATA,PRIV_LEV=3,RTNVAL=GR
--- 32,39 ----
  
  ;	.section .text
  
! ;	.space $DATA$
! ;	.subspa $FLUFFY$,QUAD=1,ALIGN=8,ACCESS=0x2C,SORT=56
  
  	.EXPORT stext,ENTRY,PRIV_LEV=3,RTNVAL=GR
  	.EXPORT _stext,DATA,PRIV_LEV=3,RTNVAL=GR
