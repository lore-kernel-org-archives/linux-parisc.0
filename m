Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 15CB2482A
	for <parisc-linux@parisc-linux.org>; Sat,  2 Feb 2002 09:44:09 -0700 (MST)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id fscglaaa for parisc-linux@parisc-linux.org; Sat, 2 Feb 2002 09:44:06 -0700
Date: Sat, 2 Feb 2002 08:44:06 -0800
From: Randolph Chung <randolph@tausq.org>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Proposed change to arch/parisc/Makefile and generation of offset.h
Message-ID: <20020202164406.GB604@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020202063408.GA604@tausq.org> <20020202140740.GD2884@sleepie.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020202140740.GD2884@sleepie.demon.co.uk>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> Sounds like a reasonable compromise to me.  Only snag is that if you
> build a 32 bit kernel, make clean, change config for a 64 bit kernel,
> then make again, you will build a 64 bit kernel with the wrong offset.h.
> 
> Would be nice if 'make' could verify that the offset.h ifile was correct,
> without changing it (and so triggering dependencies).  If it could do
> that, it could regenerate it only if it was wrong.

I think it's reasonable to expect people to manually do a full 'make
dep' when switching. I'm not sure offset.h is the only thing that'll
break if they don't. 

With that said, sanity checking offset.h is never a bad thing. How about
if I also add this so that the build will complain loudly if you used
the wrong one?

Index: arch/parisc/tools/offset.c
===================================================================
RCS file: /var/cvs/linux/arch/parisc/tools/offset.c,v
retrieving revision 1.16
diff -u -p -r1.16 offset.c
--- arch/parisc/tools/offset.c	2001/10/04 11:05:47	1.16
+++ arch/parisc/tools/offset.c	2002/02/02 16:43:01
@@ -39,6 +39,15 @@ linefeed;
 text("#ifndef _PARISC_OFFSET_H");
 text("#define _PARISC_OFFSET_H");
 linefeed;
+#ifdef __LP64__
+text("#ifndef __LP64__");
+text("#error offset.h was generated for 64-bit build; did you do 'make dep'?");
+#else
+text("#ifdef __LP64__");
+text("#error offset.h was generated for 32-bit build; did you do 'make dep'?");
+#endif
+text("#endif");
+linefeed;
 
 void output_task_ptreg_defines(void)
 {



randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
