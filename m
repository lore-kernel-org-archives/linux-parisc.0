From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: 2.6.10-rc1-pa15 boot fine on n4k but still
	annoying bactrace
Date: Thu, 18 Nov 2004 23:09:40 -0700
Message-ID: <20041119060940.GB2394@colo.lackof.org>
References: <20041117221742.1429C494040@palinux.hppa>
	<418A80030000538E@mail-1-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <418A80030000538E@mail-1-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Nov 18, 2004 at 01:54:28PM +0100, Joel Soete wrote:
> Nice now the N4k boot well (in the previous attempt it was panic) :)

cool - thanks for testing.

> But there are still many (a beat annoying) backtrace msg:
> Releasing cpu 1 now, hpa=fffffffffed2d000
> FP[1] enabled: Rev 1 Model 16
> CPU(s): 2 x PA8600 (PCX-W+) at 550.000000 MHz
> Setting cache flush threshold to 231280 (2 CPUs online)
> SBA found Ike rev 2 at 0xfffffffffed00000
> Badness in lba_set_iregs at drivers/parisc/lba_pci.c:1659
> Backtrace:
>  [<0000000010196bac>] __alloc_pages+0x124/0x460
>  [<0000000010119fd0>] dump_stack+0x20/0x38
>  [<00000000102cf75c>] lba_set_iregs+0x84/0x180
>  [<00000000102cb254>] setup_ibase_imask+0x9c/0xa8
>  [<000000001010d18c>] __udivdi3+0x1c/0x30
>  [<00000000102cbc44>] sba_ioc_init+0x38c/0x578

Yeah, I think this is just a brainfart in the conversion to "WARN_ON".
Can you test the following patch?

And for grins, add a printk so we can see what ibase/imask
values are getting written.

But in review the code, I'm leary that bit 0 isn't getting set.
bit 0 is the "Range Enable" that enables decoding of upstream
PCI bus addresses. I suspect it works now only becuase we either
never try peer-peer (but we do with sym2 driver IIRC) or the resulting
addresses that are forwarded upstream never get responses.

You have time for one more experiment for me?
Please add  "| 1" to the ibase value passed in
before writing the register. e.g.:
	WRITE_REG32( ibase | 1, base_addr + LBA_IBASE);

If not I'll try this later...

thanks
grant

Index: drivers/parisc/lba_pci.c
===================================================================
RCS file: /var/cvs/linux-2.6/drivers/parisc/lba_pci.c,v
retrieving revision 1.19
diff -u -p -r1.19 lba_pci.c
--- drivers/parisc/lba_pci.c	17 Nov 2004 22:17:42 -0000	1.19
+++ drivers/parisc/lba_pci.c	19 Nov 2004 05:55:35 -0000
@@ -1656,8 +1656,9 @@ lba_set_iregs(struct parisc_device *lba,
 
 	imask <<= 2;	/* adjust for hints - 2 more bits */
 
-	WARN_ON((ibase & 0x003fffff) == 0);
-	WARN_ON((imask & 0x003fffff) == 0);
+	/* Make sure we aren't trying to set bits that aren't writeable. */
+	WARN_ON((ibase & 0x001fffff) != 0);
+	WARN_ON((imask & 0x001fffff) != 0);
 	
 	DBG("%s() ibase 0x%x imask 0x%x\n", __FUNCTION__, ibase, imask);
 	WRITE_REG32( imask, base_addr + LBA_IMASK);
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
