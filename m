Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (unknown [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7FD63482B
	for <parisc-linux@parisc-linux.org>; Wed, 15 May 2002 07:44:54 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id ohjknaaa for parisc-linux@parisc-linux.org; Wed, 15 May 2002 06:43:18 -0700
Date: Wed, 15 May 2002 06:47:03 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20020515134703.GY30370@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] irq.c patch to fix lockups on recent kernels
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

We have been seeing fairly frequent lockups while doing heavy I/O on 
recent kernels. Paul Bame isolated this to the 2.4.18-pa16->pa17 patch
to irq.c that was put in place to fix a xtime_lock deadlock.

Here is a patch that partially reverts that patch but still fixes the
xtime_lock problem, as well as avoiding the I/O hangs. After talking to
Grant about this, I'm not convinced this is the right fix. It seems like
do_cpu_irq_mask is already called with eiem masked, so I'm not sure why
masking it again might make a difference.... we might just be masking 
(no pun intended) another bug....

I've run a kernel with this patch on a SMP a500 overnight while doing
lots of I/O ... seems to be ok. The previous -pa2[1234] kernels will 
lock up in <10 minutes...

Can someone more familiar with this part of the kernel please take a
look?

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/


===================================================================
RCS file: /var/cvs/linux/arch/parisc/kernel/irq.c,v
retrieving revision 1.53
diff -u -p -r1.53 irq.c
--- irq.c       2002/04/13 22:12:27     1.53
+++ irq.c       2002/05/15 13:35:06
@@ -382,6 +382,7 @@ void do_irq(struct irqaction *action, in
 void do_cpu_irq_mask(unsigned long mask, struct irq_region *region, struct pt_regs *regs)
 {
        unsigned long bit;
+       unsigned long orig_eiem;
        int irq;

 #ifdef DEBUG_IRQ
@@ -401,6 +402,9 @@ void do_cpu_irq_mask(unsigned long mask,
         * Keeping PSW_I disabled avoids this.
         */

+       orig_eiem = get_eiem();
+       set_eiem(orig_eiem & ~mask);
+
        for (bit = (1L<<MAX_CPU_IRQ), irq = 0; mask && bit; bit>>=1, irq++) {
                int irq_num;
                if (!(bit&mask))
@@ -410,9 +414,10 @@ void do_cpu_irq_mask(unsigned long mask,
                irq_num = region->data.irqbase + irq;
                do_irq(&region->action[irq], irq_num, regs);
        }
+       set_eiem(orig_eiem);

        /* Leave with PSW_I bit set */
-       local_irq_enable();
+       local_irq_enable();
 }
