Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 524084A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Mar 2001 20:53:48 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id OAA15047;
	Fri, 16 Mar 2001 14:42:04 +1100
Date: Fri, 16 Mar 2001 14:42:04 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: taggart@carmen.fc.hp.com
Cc: randolph@tausq.org, bdale@gag.com, alan_c_meyer@am.exch.hp.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: new debs built, c++ is broken
In-Reply-To: <Pine.LNX.4.21.0103161235420.4658-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0103161421060.4658-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Fri, 16 Mar 2001, Alan Modra wrote:
> On Fri, 16 Mar 2001, Alan Modra wrote:
> > Unfortunately, c++ progs still crash due to the unwind frame info list
> > head being trashed.
> 
> Merging with current gcc_3.0 didn't cure the problem either.

Lots of stepi's and strategically placed breakpoints under gdb revealed
that libgcc2:init_reg_size_table was the culprit trashing memory.  From
there it's plain sailing...

I reckon this patch will cure the problem, which I'm testing right
now.  New gcc debs again, I'm afraid.  Anybody like to voice an opinion
for/against moving to the merge I've just done with sourceware
gcc_3.0?  Looks good so far.

Index: gcc/config/pa/pa32-regs.h
===================================================================
RCS file: /home/cvs/parisc/gcc/gcc/config/pa/pa32-regs.h,v
retrieving revision 1.2
diff -u -p -r1.2 pa32-regs.h
--- pa32-regs.h	2001/02/19 13:54:41	1.2
+++ pa32-regs.h	2001/03/16 03:21:41
@@ -188,6 +188,11 @@
   ((REGNO) <= 31 ? (REGNO) :						\
    ((REGNO) <= 87 ? (REGNO) + 40 : 32))
 
+/* We must not use the DBX register numbers for the DWARF 2 CFA column
+   numbers because that maps to numbers beyond FIRST_PSEUDO_REGISTER.
+   Instead use the identity mapping.  */
+#define DWARF_FRAME_REGNUM(REG) REG
+
 /* Define the classes of registers for register constraints in the
    machine description.  Also define ranges of constants.
 
Index: gcc/config/pa/pa64-regs.h
===================================================================
RCS file: /home/cvs/parisc/gcc/gcc/config/pa/pa64-regs.h,v
retrieving revision 1.2
diff -u -p -r1.2 pa64-regs.h
--- pa64-regs.h	2001/02/19 13:54:42	1.2
+++ pa64-regs.h	2001/03/16 03:21:41
@@ -176,6 +176,11 @@ Boston, MA 02111-1307, USA.  */
   ((REGNO) <= 31 ? (REGNO) :						\
    ((REGNO) > 31 && (REGNO) <= 60 ? (REGNO - 32) * 2 + 72 : 32))
 
+/* We must not use the DBX register numbers for the DWARF 2 CFA column
+   numbers because that maps to numbers beyond FIRST_PSEUDO_REGISTER.
+   Instead use the identity mapping.  */
+#define DWARF_FRAME_REGNUM(REG) REG
+
 /* Define the classes of registers for register constraints in the
    machine description.  Also define ranges of constants.
 
Alan
-- 
Linuxcare
