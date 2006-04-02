From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Strange newest LAB msg?
Date: Sun, 2 Apr 2006 11:29:30 +0200
Message-ID: <200604021129.31095.deller@gmx.de>
References: <IX008E$FF5F5C221189CADA64719030F0E34D37@scarlet.be>
	<200604010935.42819.deller@gmx.de>
	<1143901853.3368.0.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_7l5LEPrlEZV8VJj"
Cc: parisc-linux@lists.parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: James Bottomley <James.Bottomley@steeleye.com>,
 "Joel Soete" <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1143901853.3368.0.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--Boundary-00=_7l5LEPrlEZV8VJj
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Saturday 01 April 2006 16:30, James Bottomley wrote:
> On Sat, 2006-04-01 at 09:35 +0200, Helge Deller wrote:
> > I'm pretty sure.
> > We never vmalloc'ed IOmem before.
> 
> Where are you taking the ioremap virtual range from?  If it's the
> vmalloc range, which is the only one I can think we have available for
> arbitrary kernel mappings, then that would explain the behaviour.

Correct.
ioremap() calls get_vm_area(), which in turn gets it from __get_vm_area(size, flags, VMALLOC_START, VMALLOC_END);
VMALLOC_START seems to be at 32KB, while VMALLOC_END at around 240MB.
This means we have ~240MB of IO-Space which seems to little for the N4k.

Willy said in another mail:
> Either we're leaking vmalloc space, we allocate too much of it, or we
> need to drastically increase it the amount of it we have available.

I think Willy is right.
We probably don't leak in ioremap(), since we use the standard Linux kernel functions.
I would propose to analyze how much the 14 PCI busses wants to allocate, and if they free it correctly and if they might leak.

Might this be the culprit: 
(lba_pci.c:1216)
case PAT_PIOP:
                        /*
                        ** Postable I/O port space is per PCI host adapter.
                        ** base of 64MB PIOP region
                        */
                        lba_dev->iop_base = ioremap_nocache(p->start, 64 * 1024 * 1024);
It allocates 64MB in a loop.

Joel, can you apply the attached patch and send us the bootlog of the N4k with it ?

Helge

--Boundary-00=_7l5LEPrlEZV8VJj
Content-Type: text/plain;
  charset="utf-8";
  name="t"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="t"

Index: ioremap.c
===================================================================
RCS file: /var/cvs/linux-2.6/arch/parisc/mm/ioremap.c,v
retrieving revision 1.16
diff -u -p -r1.16 ioremap.c
--- ioremap.c	29 Mar 2006 22:18:32 -0000	1.16
+++ ioremap.c	2 Apr 2006 09:27:59 -0000
@@ -181,6 +181,9 @@ void __iomem * __ioremap(unsigned long p
 	phys_addr &= PAGE_MASK;
 	size = PAGE_ALIGN(last_addr) - phys_addr;
 
+
+	printk("IOREMAP: phys=%lx, size=%lx\n", phys_addr, size);
+
 	/*
 	 * Ok, go for it..
 	 */
@@ -193,6 +196,8 @@ void __iomem * __ioremap(unsigned long p
 		vfree(addr);
 		return NULL;
 	}
+
+	printk("IOREMAP: remapped to %p\n", addr);
 
 	return (void __iomem *) (offset + (char *)addr);
 }

--Boundary-00=_7l5LEPrlEZV8VJj
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_7l5LEPrlEZV8VJj--
