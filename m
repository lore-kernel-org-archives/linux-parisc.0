Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 69FE04840
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  4 Feb 2004 23:48:17 -0700 (MST)
Date: Thu, 5 Feb 2004 01:20:28 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040205092028.GM959@tausq.org>
References: <20040204182455.1CC11494191@palinux.hppa>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040204182455.1CC11494191@palinux.hppa>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> Modified files:
> 	arch/parisc/kernel: vmlinux.lds.S 
> 	include/asm-parisc: uaccess.h 
> 
> Log message:
> Make the exception table writeable (so it can actually be sorted)
> and discard the interpreter section

jejb, this doesn't work for me..... in arch/parisc/mm/init.c we mark
everything from _stext to data_start as read-only, so i think we need
something like this:

Index: arch/parisc/kernel/vmlinux.lds.S
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/kernel/vmlinux.lds.S,v
retrieving revision 1.6
diff -u -p -r1.6 vmlinux.lds.S
--- arch/parisc/kernel/vmlinux.lds.S    4 Feb 2004 18:24:55 -0000       1.6
+++ arch/parisc/kernel/vmlinux.lds.S    5 Feb 2004 06:47:22 -0000
@@ -58,16 +58,17 @@ SECTIONS

   _etext = .;                  /* End of text section */

+  RODATA
+
+  /* writeable */
+  data_start = .;
+
   . = ALIGN(16);               /* Exception table */
   __start___ex_table = .;
   __ex_table : { *(__ex_table) }
   __stop___ex_table = .;

-  RODATA
-
-  /* writeable */
   .data : {                    /* Data */
-       data_start = .;
        *(.data)
        CONSTRUCTORS
        }

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
