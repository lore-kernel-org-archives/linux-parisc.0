Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 245324829
	for <parisc-linux@parisc-linux.org>; Sun, 12 Jan 2003 01:40:13 -0700 (MST)
Date: Sun, 12 Jan 2003 00:37:33 -0800
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: jim.hull@hp.com, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: floating point exception error
Message-ID: <20030112083733.GE1177@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20030111061638.GH31470@tausq.org> <200301111831.h0BIVwZS006398@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200301111831.h0BIVwZS006398@hiauly1.hia.nrc.ca>
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

> I think that you probably should always use a 3-bit extract.  If the
> value is greater than 3 on a PA 1.1 FPU, then the operation is undefined.
> 4 is also undefined for PA 2.0.

I guess that'll work, altho there are also some paths that are pcx-s and
pcx-t specific, so we probably still need to determine what processor we
are running on

> The above assumes that the kernel doesn't provide PA 2.0 emulation
> on PA 1.1 machines.

yup, that should be a reasonable assumption.

anyway, here's what i'm considering to commit to our kernel tree. it 
has been tested to work with the fcnv code posted earlier. haven't 
tested the other cases yet. it's very much a hack. comments?

Index: arch/parisc/math-emu/driver.c
===================================================================
RCS file: /var/cvs/linux-2.5/arch/parisc/math-emu/driver.c,v
retrieving revision 1.1
diff -u -p -r1.1 driver.c
--- arch/parisc/math-emu/driver.c	20 Jul 2002 16:32:35 -0000	1.1
+++ arch/parisc/math-emu/driver.c	12 Jan 2003 08:39:10 -0000
@@ -86,8 +86,12 @@ handle_fpe(struct pt_regs *regs)
 	int signalcode;
 	/* need an intermediate copy of float regs because FPU emulation
 	 * code expects an artificial last entry which contains zero
+	 *
+	 * also, the passed in fr registers contain one word that defines
+	 * the fpu type. the fpu type information is constructed 
+	 * inside the emulation code
 	 */
-	__u64 frcopy[33];
+	__u64 frcopy[36];
 
 	memcpy(frcopy, regs->fr, sizeof regs->fr);
 	frcopy[32] = 0;
Index: arch/parisc/math-emu/fpudispatch.c
===================================================================
RCS file: /var/cvs/linux-2.5/arch/parisc/math-emu/fpudispatch.c,v
retrieving revision 1.1
diff -u -p -r1.1 fpudispatch.c
--- arch/parisc/math-emu/fpudispatch.c	20 Jul 2002 16:32:35 -0000	1.1
+++ arch/parisc/math-emu/fpudispatch.c	12 Jan 2003 08:39:10 -0000
@@ -51,6 +51,7 @@
 
 #include "float.h"
 #include "types.h"
+#include <asm/processor.h>
 /* #include <sys/debug.h> */
 /* #include <machine/sys/mdep_private.h> */
 
@@ -166,6 +167,20 @@ static void update_status_cbit();
 
 #define VASSERT(x)
 
+static void parisc_linux_get_fpu_type(u_int fpregs[])
+{
+	/* on pa-linux the fpu type is not filled in by the
+	 * caller; it is constructed here  
+	 */ 
+	if (boot_cpu_data.cpu_type == pcxs)
+		fpregs[FPU_TYPE_FLAG_POS] = TIMEX_EXTEN_FLAG;
+	else if (boot_cpu_data.cpu_type == pcxt ||
+	         boot_cpu_data.cpu_type == pcxt_)
+		fpregs[FPU_TYPE_FLAG_POS] = ROLEX_EXTEN_FLAG;
+	else if (boot_cpu_data.cpu_type >= pcxu)
+		fpregs[FPU_TYPE_FLAG_POS] = PA2_0_FPU_FLAG;
+}
+
 /*
  * this routine will decode the excepting floating point instruction and
  * call the approiate emulation routine.
@@ -183,6 +198,8 @@ fpudispatch(u_int ir, u_int excp_code, u
 
 	/* All FP emulation code assumes that ints are 4-bytes in length */
 	VASSERT(sizeof(int) == 4);
+
+	parisc_linux_get_fpu_type(fpregs);
 
 	fpu_type_flags=fpregs[FPU_TYPE_FLAG_POS];  /* get fpu type flags */
 
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
