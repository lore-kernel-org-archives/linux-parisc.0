From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] readb/__raw_readb/gsc_readb and ioremap
Date: Sun, 31 Oct 2004 03:39:50 +0000
Message-ID: <20041031033950.GN8958@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@parisc-linux.org
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


I've been looking at asm/io.h (patch just committed).

I feel the need to explain a bit about what's going on because it seems
a little confused.

gsc_read/writeX:
 - Don't byteswap
 - Can be used on raw memory addresses (ie f-space)
__raw_read/writeX:
 - Don't byteswap
 - Should be used on ioremap'ed address
read/writeX:
 - Byteswap
 - Should be used on ioremap'ed address

It was the case that __raw_readl was the same as gsc_readl, but non-parisc
drivers are using __raw_readl now, so we have to change that.

At the moment, ioremap() is a nop.  That really ought to change, and
it's what the USE_HPPA_IOREMAP define is for.  There's at least one
problem with the USE_HPPA_IOREMAP code -- it doesn't byteswap.

So I've rearranged the code.  Now:

gsc_readl returns the value found at the physical address.
If USE_HPPA_IOREMAP is set, __raw_readl returns the value found at
the virtual address.  If not, it's a #define to gsc_readl.  readl is a
#define to byteswap the result from __raw_readl.

There's now prototypes for readX/writeX, so there's a lot of warnings
to clean up.  I suspect we should start by declaring parisc_device->hpa
to be a void __iomem * ... or maybe we should start by inventing a
parisc_iomap() interface.  Anyway, maybe I'll start trying to make
USE_HPPA_IOREMAP work next ...

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
