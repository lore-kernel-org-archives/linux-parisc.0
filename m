Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pogo.mtv1.steeleye.com (host194.steeleye.com [66.206.164.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id C57C84829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Dec 2002 15:12:58 -0700 (MST)
Received: (from root@localhost)
	by pogo.mtv1.steeleye.com (8.9.3/8.9.3) id OAA12459
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Dec 2002 14:12:43 -0800
Received: from mulgrave (jejb@localhost)
	by localhost.localdomain (8.11.6/linuxconf) with ESMTP id gBKMCbv08741;
	Fri, 20 Dec 2002 16:12:38 -0600
Message-Id: <200212202212.gBKMCbv08741@localhost.localdomain>
To: Randolph Chung <randolph@tausq.org>
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.5 randomly kills applications with page faults 
In-Reply-To: Message from Randolph Chung <randolph@tausq.org>
   of "Wed, 18 Dec 2002 09:02:55 PST." <20021218170254.GM19331@tausq.org>
Mime-Version: 1.0
Content-Type: multipart/mixed ;
	boundary="==_Exmh_15075616400"
Date: Fri, 20 Dec 2002 16:12:37 -0600
From: James Bottomley <James.Bottomley@steeleye.com>
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

This is a multipart MIME message.

--==_Exmh_15075616400
Content-Type: text/plain; charset=us-ascii

randolph@tausq.org said:
> that's what i thought too, so i went through entry.S as well to see
> what i can find. haven't found anything yet :( 

OK, I think I found the cause of this and the solution.

The cause is in syscall.S in linux_gateway_entry.  Some person (herinafter 
referred to as "the guilty party") added a patch to store the user stack on 
the kernel stack temporarily before stashing it correctly in the user pt_regs:

	STREG	%r1,0(%r30)			/* Stick r1 (usp) here for now */

The problem is that they forgot to increment the stack pointer.  Thus, if we 
take an interruption between this instruction and the corresponding retrieval, 
the value can be trashed.

The fix is simple: increment the stack pointer.  I chose 16 to preserve every 
alignment I can think of is that also safe for 64 bit?

With this fix, my system seems fairly solid.  It survives my bitkeeper and 
stress tests so far (about 30 min) previously it always collapsed within a few 
minutes.

James

P.S. After this little debug frenzy, I don't personally care if I ever see 
another line of parisc assembly again, so if another obscure register trashing 
problem turns up, my good deed is done...


James


--==_Exmh_15075616400
Content-Type: text/plain ; name="tmp.diff"; charset=us-ascii
Content-Description: tmp.diff
Content-Disposition: attachment; filename="tmp.diff"

===== arch/parisc/kernel/syscall.S 1.5 vs edited =====
--- 1.5/arch/parisc/kernel/syscall.S	Fri Nov 29 04:31:54 2002
+++ edited/arch/parisc/kernel/syscall.S	Fri Dec 20 15:46:40 2002
@@ -94,6 +94,7 @@
 
 	mtsp	%r0,%sr7			/* get kernel space into sr7 */
 	STREG	%r1,0(%r30)			/* Stick r1 (usp) here for now */
+	ldo	16(%r30),%r30
 	mfctl	%cr30,%r1			/*  get task ptr in %r1 */
 	LDREG	TI_TASK(%r1),%r1
 
@@ -104,7 +105,8 @@
 	   PSW value is stored.  This is needed for gdb and sys_ptrace. */
 	STREG	%r0,  TASK_PT_PSW(%r1)
 	STREG	%r2,  TASK_PT_GR2(%r1)		/* preserve rp */
-	LDREG	0(%r30), %r2			/* get users sp back */
+	LDREG	-16(%r30), %r2			/* get users sp back */
+	ldo	-16(%r30), %r30
 	STREG	%r2,  TASK_PT_GR30(%r1)		/* ... and save it */
 	STREG	%r19, TASK_PT_GR19(%r1)
 	STREG	%r20, TASK_PT_GR20(%r1)

--==_Exmh_15075616400--
