Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA24221
	for <parisc-linux@puffin.external.hp.com>; Sat, 10 Jul 1999 00:58:51 -0600
Received: from mgw-i2.ntc.nokia.com (mgw-i2.ntc.nokia.com [131.228.118.61])
	by mgw-x2.nokia.com (8.9.3/8.9.3) with ESMTP id JAA03726
	for <parisc-linux@thepuffingroup.com>; Sat, 10 Jul 1999 09:59:13 +0300 (EETDST)
Received: from stybba.ntc.nokia.com (stybba.ntc.nokia.com [131.228.178.21])
	by mgw-i2.ntc.nokia.com (8.9.3/8.9.3) with ESMTP id JAA10905
	for <parisc-linux@thepuffingroup.com>; Sat, 10 Jul 1999 09:59:12 +0300 (EETDST)
Received: from gamgee.ntc.nokia.com (martikka@gamgee [131.228.178.130])
	by stybba.ntc.nokia.com (8.9.1a/8.9.1/Goodi) with ESMTP id JAA20638
	for <parisc-linux@thepuffingroup.com>; Sat, 10 Jul 1999 09:59:12 +0300 (EET DST)
Date: Sat, 10 Jul 1999 09:59:11 +0300 (EETDST)
From: Hannu Martikka <martikka@stybba.ntc.nokia.com>
To: parisc-linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] OS_ID and include/asm-parics/pdc.h
In-Reply-To: <Pine.HPX.4.05.9907100900570.11988-200000@gamgee.ntc.nokia.com>
Message-ID: <Pine.HPX.4.05.9907100957010.11988-100000@gamgee.ntc.nokia.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; CHARSET=ISO-8859-1
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 10 Jul 1999, Hannu Martikka wrote:


> On asm-parisc/pdc.h (from OSF) we have following:
> #define OS_ID_NONE      0
> #define OS_ID_HPUX      1
> #define OS_ID_MPE_XL    2
> 
> On pdc.h we have more of these:
> 0x0003 	OSF dependent data
> 0x0004	HP-RT dependent data
> 0x0005	Novell Netware dependent data
> 
> 0x0006	Linux dependent data
Something went wrong with that patch... Anyway what I meant was to add
like this:

*** pdc.h.oli   Sat Jul 10 09:43:22 1999
--- pdc.h       Sat Jul 10 09:43:05 1999
***************
*** 263,268 ****
--- 263,272 ----
  #define OS_ID_NONE    0
  #define OS_ID_HPUX    1
  #define OS_ID_MPE_XL  2
+ #define OS_ID_OSF     3
+ #define OS_ID_HP_RT   4
+ #define OS_ID_NETWARE 5
+ #define OS_ID_LINUX   6 /* This needs to be reserved from HP! */
  struct pdc_sys_model {  /* PDC_MODEL/PDC_MODEL_SYS_MODEL */
        unsigned int   mod_len;
        int     filler[31];



- Goodi 
"The linuX Files -- The Source is Out There."
ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°
