Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D00AA4829
	for <parisc-linux@parisc-linux.org>; Wed,  4 Dec 2002 07:44:59 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18Jali-0004lv-00; Wed, 04 Dec 2002 14:44:54 +0000
Date: Wed, 4 Dec 2002 14:44:54 +0000
From: Matthew Wilcox <willy@debian.org>
To: LaMont Jones <lamont@b180.mmjgroup.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] airo.c patch for hppa
Message-ID: <20021204144454.P27991@parcelfarce.linux.theplanet.co.uk>
References: <20021204050640.GA22117@b180.mmjgroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021204050640.GA22117@b180.mmjgroup.com>; from lamont@b180.mmjgroup.com on Tue, Dec 03, 2002 at 10:06:40PM -0700
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

On Tue, Dec 03, 2002 at 10:06:40PM -0700, LaMont Jones wrote:
> The first part (chage to init_airo_card and it's callers) allows us to call
> pci_enable_device like we need to.

We certainly do...

> The other part (the stuff inside #ifdef __hppa__) is a gross hack that works
> around some issues between dino and the card during initialization where the
> card fails to ack reads of several 2-byte aligned addresses.  With these
> changes, I have a working PCI4800 in my B180.

Grant, I think this is a long-standing bug (Jan 2000!) in Dino's port IO macros.
Look:

#define DINO_PORT_IN(type, size, mask) \
static u##size dino_in##size (struct pci_hba_data *d, u16 addr) \
{ \
        /* tell HW which IO Port address */ \
        gsc_writel((u32) addr & ~3, d->base_addr + DINO_PCI_ADDR); \
        /* generate I/O PORT read cycle */ \
        v = gsc_read##type(d->base_addr+DINO_IO_DATA+(addr&mask)); \

That '& ~3' clears the bottom two bits of the address, so we always read
from a 32-bit aligned address, even if we actually wanted to read the
other 16-bit word or one of the other bytes.  The PORT_OUT define doesn't
mask that way:

#define DINO_PORT_OUT(type, size, mask) \
static void dino_out##size (struct pci_hba_data *d, u16 addr, u##size val) \
{ \
        /* tell HW which CFG address */ \
        gsc_writel((u32) addr, d->base_addr + DINO_PCI_ADDR); \
        /* generate cfg write cycle */ \
        gsc_write##type(cpu_to_le##size(val), d->base_addr+DINO_IO_DATA+(addr&ma
sk)); \

(oops, looks like a comment wasn't updated ;-)

And HPUX doesn't mask addr that way either:

#define DINO_PRE_RD_IO(this, addr) \
        WRITE_UINT32(this->base_addr + DINO_PCI_ADDR, addr);

STATIC uint16_t
dino_rd_io_w()
{
        off += (uint32_t) phndl;
        DINO_PRE_RD_IO(h2p, off);
        data = READ_UINT16(h2p->base_addr + DINO_IO_DATA + (off & 2));

LaMont's doing a rebuild now to check it works, but this seems fairly
obvious to me.  Thoughts?  (Can _anyone_ remember what they were thinking
when they wrote code nearly three years ago?  ;-)

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
