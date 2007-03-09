From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] Problem with atomicity of TIF for parisc ?
Date: Fri, 9 Mar 2007 20:07:32 +0100
Message-ID: <200703092007.32746.deller__32317.9801962853$1416624324$gmane$org@gmx.de>
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

While reading LKML I saw the patches by Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca> titled
"Fix atomicity of TIF update in flush_thread() for XXX"
e.g. http://permalink.gmane.org/gmane.linux.kernel/502597

Now I'm wondering if our thread-problems may be due the fact that we do not disable interrupts while testing the TIF_XX values in arch/parisc/kernel/entry.S, e.g.:

intr_return:
        /* NOTE: Need to enable interrupts incase we schedule. */
        ssm     PSW_SM_I, %r0
<....>
intr_check_resched:
        /* check for reschedule */
        mfctl   %cr30,%r1
        LDREG   TI_FLAGS(%r1),%r19      /* sched.h: TIF_NEED_RESCHED */
        bb,<,n  %r19,31-TIF_NEED_RESCHED,intr_do_resched /* forward */

Is the coding correct, or do we need to disable interrupts when checking TIF_NEED_RESCHED ?
(There are more TIF_XXX places in entry.S as well which might need checking then...)

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
