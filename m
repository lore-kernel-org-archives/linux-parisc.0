From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] SMP and CONFIG_SLAB_DEBUG
Date: Fri, 11 Feb 2005 18:13:10 -0800
Message-ID: <20050212021309.GI2277@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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

Has anybody been able to boot a 2.6.11-rc3-pa* kernel SMP with slab
debugging enabled? when i tried, i triggered a BUG_ON():

kernel BUG at mm/slab.c:1493!
Backtrace:
 [<10130b34>] printk+0x20/0x2c
 [<10163d94>] check_irq_off+0x40/0x50
 [<10165eec>] do_ccupdate_local+0x10/0x5c
 [<10114ec4>] ipi_interrupt+0x198/0x250
 [<10155ae0>] handle_IRQ_event+0x50/0xa4
 [<10155bcc>] __do_IRQ+0x98/0x1e4

the BUG_ON() is checking that irqs are disabled when calling
do_ccupdate_local(), which is called as a smp function using IPI.

are interrupts supposed to be disabled when ipi_interrupt() is called?
did this behaviour change with the recent irq handling changes?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
