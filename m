Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 14FF0482A
	for <parisc-linux@parisc-linux.org>; Tue, 21 Aug 2001 01:09:58 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15Z5fd-0004UR-00; Tue, 21 Aug 2001 08:09:53 +0100
Date: Tue, 21 Aug 2001 08:09:53 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] iotree thoughts
Message-ID: <20010821080953.B12638@parcelfarce.linux.theplanet.co.uk>
References: <willy@debian.org> <200108210544.XAA20603@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200108210544.XAA20603@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Mon, Aug 20, 2001 at 11:44:20PM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Aug 20, 2001 at 11:44:20PM -0600, Grant Grundler wrote:
> That sounds too much like work. ;^)
> Raven PDC ERS is available from HP's firmware team website. (internal only).

Thanks, I'll look at that.

> I disagree. I want the kernel to NOT link if CONFIG_PCI and
> CONFIG_ISA are not enabled when inx/outx functions are used.

I discussed this with Ted Ts'o at OLS.  The difficulty is that there's
a fair bit of arch-independent code which does (example taken from serial.c):

static _INLINE_ unsigned int serial_in(struct async_struct *info, int offset)
{
        switch (info->io_type) {
        case SERIAL_IO_MEM:
                return readb((unsigned long) info->iomem_base +
                             (offset<<info->iomem_reg_shift));
        default:
                return inb(info->port + offset);
        }
}

so either we add the nasty:

        default:
#if defined(CONFIG_PCI) || defined(CONFIG_ISA)
                return inb(info->port + offset);
#else
                BUG();
#endif

or we just make inb() BUG().

> This will allow the kernel to link and then fail after rebooting.
> That seems like a step backwards to me.

Only if they're called.  The majority of places where these functions
exist can provably never be called.  The others probably won't be :-)

-- 
Revolutions do not require corporate support.
