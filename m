Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id C99EB482B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 31 May 2002 11:43:11 -0600 (MDT)
Date: Fri, 31 May 2002 18:20:02 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, submit@bugs.debian.org
Message-ID: <20020531172002.GI3471@sleepie.demon.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] hppa gdb fix for printing function returns
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

package: gdb
version: 5.2.cvs20020401-6

The attached patch fixes gdb on hppa so that it will print function
returns (e.g. "print foo(6)"), where previously it would crash the
inferior with protection faults.

There are still some problems, for example, print strlen("foo") will
fail.  To evaluate that, gdb has first got to get the inferior to call
malloc so there is somewhere to store the string.  For a dynamically
linked program, gdb is finding a symbol 'malloc' in ld-2.2.5.so and
trying to call that, with a bogus dp value.  If you link the program
statically, gdb finds the right 'malloc' to call and it works.

Richard



diff -ur gdb-5.2.cvs20020401.ori/gdb/pa-linux-tdep.c gdb-5.2.cvs20020401/gdb/pa-linux-tdep.c
--- gdb-5.2.cvs20020401.ori/gdb/pa-linux-tdep.c	Fri May 31 17:57:21 2002
+++ gdb-5.2.cvs20020401/gdb/pa-linux-tdep.c	Fri May 31 18:25:22 2002
@@ -38,8 +38,8 @@
 static void
 pa_write_pc (CORE_ADDR pc, ptid_t ptid)
 {
-  write_register_pid (PA_PCOQ_HEAD_REGNUM, pc, ptid);
-  write_register_pid (PA_PCOQ_TAIL_REGNUM, pc + 4, ptid);
+  write_register_pid (PA_PCOQ_HEAD_REGNUM, pc | 3, ptid);
+  write_register_pid (PA_PCOQ_TAIL_REGNUM, (pc + 4) | 3, ptid);
 }
 
 static CORE_ADDR
@@ -426,8 +426,8 @@
   /* We can not modify the instruction address queues directly, so we start
      up the inferior and execute a couple of instructions to set them so
      that they point to the call dummy in the stack.  */
-  pcoqh = read_register (PA_PCOQ_HEAD_REGNUM);
-  pcoqt = read_register (PA_PCOQ_TAIL_REGNUM);
+  pcoqh = read_register (PA_PCOQ_HEAD_REGNUM) & ~3;
+  pcoqt = read_register (PA_PCOQ_TAIL_REGNUM) & ~3;
 
   if (target_read_memory (pcoqh, buf, 4) != 0)
     error ("Couldn't modify instruction address queue\n");
@@ -547,8 +547,8 @@
   /* We can not modify the instruction address queues directly, so we start
      up the inferior and execute a couple of instructions to set them so
      that they point to the call dummy in the stack.  */
-  pcoqh = read_register (PA_PCOQ_HEAD_REGNUM);
-  pcoqt = read_register (PA_PCOQ_TAIL_REGNUM);
+  pcoqh = read_register (PA_PCOQ_HEAD_REGNUM) & ~3;
+  pcoqt = read_register (PA_PCOQ_TAIL_REGNUM) & ~3;
 
   if (target_read_memory (pcoqh, buf, 4) != 0)
     error ("Couldn't modify instruction address queue\n");
diff -ur gdb-5.2.cvs20020401.ori/gdb/pa-tdep.c gdb-5.2.cvs20020401/gdb/pa-tdep.c
--- gdb-5.2.cvs20020401.ori/gdb/pa-tdep.c	Fri May 31 17:57:21 2002
+++ gdb-5.2.cvs20020401/gdb/pa-tdep.c	Fri May 31 01:01:42 2002
@@ -2098,6 +2098,7 @@
   int reg_size = REGISTER_SIZE;
 
   fp = FRAME_FP (frame);
+  FRAME_INIT_SAVED_REGS(frame);
   fsr = frame->saved_regs;
 
 #ifndef NO_PC_SPACE_QUEUE_RESTORE
