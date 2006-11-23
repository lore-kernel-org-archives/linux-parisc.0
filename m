From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] [PATCH] hppa-linux-gas binutils patch
Date: Thu, 23 Nov 2006 22:41:56 +0100
Message-ID: <200611232241.56731.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

hppa-linux-gnu-gas only allows one type of ".equ" pseudo-op syntax:
symbol:		.equ value

The following patch allows hppa-gas to understand
			.equ symbol,value
as well, which seems to be pretty standard for other gas-targets as well.

I didn't found any problems yet with this patch, and it allows even the 
src/binutils/testsuite/binutils-all/localize-hidden-1.s
gas test  to compile.

Comments ?
If OK, would somebody with write-access to binutils submit it upstream ?

Helge

Index: gas/config/tc-hppa.c
===================================================================
RCS file: /cvs/src/src/gas/config/tc-hppa.c,v
retrieving revision 1.133
diff -u -r1.133 tc-hppa.c
--- gas/config/tc-hppa.c	30 Oct 2006 01:09:18 -0000	1.133
+++ gas/config/tc-hppa.c	23 Nov 2006 21:32:49 -0000
@@ -3262,7 +3262,7 @@
       return;
     }
 
-  /* Look up the opcode in the has table.  */
+  /* Look up the opcode in the hash table.  */
   if ((insn = (struct pa_opcode *) hash_find (op_hash, str)) == NULL)
     {
       as_bad ("Unknown opcode: `%s'", str);
@@ -6397,8 +6397,11 @@
     {
       if (reg)
 	as_bad (_(".REG must use a label"));
-      else
-	as_bad (_(".EQU must use a label"));
+      else {
+	/* Try gas' standard ".equ X,Y" pseudo opcode.  */
+      	s_set(0);
+	return;
+      }
     }
 
   pa_undefine_label ();


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
