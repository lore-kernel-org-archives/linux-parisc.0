Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from boispop1.bois.uswest.net (boispop1.bois.uswest.net [207.108.224.1])
	by dsl2.external.hp.com (Postfix) with SMTP id E6A474A19
	for <parisc-linux@lists.parisc-linux.org>; Sat,  3 Mar 2001 23:51:00 -0700 (MST)
Sender: rbrad@dsl2.external.hp.com
Message-ID: <3AA1E5C3.1BF30A8C@uswest.net>
Date: Sat, 03 Mar 2001 23:50:43 -0700
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] sym53c8xx driver with 64-bit kernel on C200.
References: <3AA1BA3F.A7C79E31@uswest.net> <20010304041833.B1865@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Willy,

Thanks for decoding that for me.... it does make more sense now :)
Here is the debug messages I added to sym53c8xx.c

 pc  = NCB_SCRIPTH0_PHYS (np, snooptest);
 printk("pc: %x\n", pc);
 host_wr = 1;
 ncr_wr  = 2;
 /*
 ** Set memory and register.
 */
 np->ncr_cache = cpu_to_scr(host_wr);
 OUTL (nc_temp, ncr_wr);
 /*
 ** Start script (exchange values)
 */
 OUTL (nc_dsa, np->p_ncb);
 printk("val: %x\n", __fswab32(pc));
 printk("addr: %p\n", (void *)((char *)np->reg + (((size_t) &((struct ncr_reg
*)0)->nc_dsp))));
 OUTL (nc_dsp, pc);

And here is the scsi boot output:

SCSI subsystem driver Revision: 1.00
sym53c8xx: at PCI bus 0, device 19, function 0
sym53c8xx: setting PCI_COMMAND_IO PCI_COMMAND_MEMORY...
sym53c8xx: setting PCI_COMMAND_MASTER...(fix-up)
sym53c8xx: 53c875 detected
sym53c875-0: rev 0x4 on pci bus 0 device 19 function 0 irq 195
sym53c875-0: NCR clock is 40401KHz
sym53c875-0: ID 7, Fast-20, Parity Checking
sym53c875-0: on-chip RAM at 0xfffffffff2ffe000
pc: 98dd8
val: d88d0900
addr: fffffffff2ffd02c

Here is the function for _gsc_writel:
    void _gsc_writel(u32 val, void *addr)

So it appears to me the correct arguments are being passed to the _gsc_writel
function.
I'm not sure about the values being passed in, but the types look correct, and
the
address is properly sign extended.

- Ryan


Matthew Wilcox wrote:

> On Sat, Mar 03, 2001 at 08:45:03PM -0700, Ryan Bradetich wrote:
> > When I run OUTL(nc_dsp,pc) through the preprocessor the statement gets
> > expanded into this:
> >
> > _gsc_writel(((__builtin_constant_p((__u32)((((pc))))) ? ({ __u32 __x =
> > (((((pc))))); ((__u32)( (((__u32)(__x) & (__u32)0x000000ffUL) << 24) |
> > (((__u32)(__x) & (__u32)0x0000ff00UL) << 8) | (((__u32)(__x) &
> > (__u32)0x00ff0000UL) >> 8) | (((__u32)(__x) & (__u32)0xff000000UL) >>
> > 24) )); }) : __fswab32(((((pc))))))),(void *)((char *)np->reg +
> > (((size_t) &((struct ncr_reg *)0)->nc_dsp))));
>
> I guess you'd like this decoded?  Let's see.  `pc' is clearly not a constant,
> so __builtin_constant_p returns false, so we can simplify this down to:
>
> _gsc_writel(__fswab32(pc) ,
>  (void *)((char *)np->reg + (((size_t) &((struct ncr_reg *)0)->nc_dsp))));
>
> which leads me to ask `what value does `pc' have?'
>
> I suspect you want to put debugging code in _gsc_writel to tell you where
> you're trying to perform IO to.
>
> My suspicion is that you're writing to the 32 bit IO space in 64-bit mode,
> which is juts not going to work.
>
> --
> Revolutions do not require corporate support.
