From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] stop the buffer bouncing
Date: Tue, 16 Nov 2004 16:34:03 +0000
Message-ID: <20041116163403.GJ26623@parcelfarce.linux.theplanet.co.uk>
References: <20041116063733.GA27633@colo.lackof.org>
	<20041116150748.GI26623@parcelfarce.linux.theplanet.co.uk>
	<20041116160939.GB4176@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
 parisc-linux@lists.parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041116160939.GB4176@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Nov 16, 2004 at 09:09:39AM -0700, Grant Grundler wrote:
> yeah...I'm probably responsible for that setting.
> It worked the best. :^/
> The 39/40 bit or full 64-bit support don't help on parisc-linux anyway.

Why not?  40 bits of addressing supports up to 1TB, which exceeds the
highest physical address on any PA machine I know about -- oh, but we
can't bypass the IOMMU, right?

> > Equally, if GSC is deselected, this must be
> > a pure PCI machine (if it boots ;-) and they all have an IOMMU, though
> > I guess you'd always select PA20 for that case.  In any case, I think
> > a couple of new symbols are in order.
> 
> Hrm....I was trying to avoid new config symbols.
> We have three cases where I only saw two before:
> 1) PA20=y, always have IOMMU (SBA or CCIO _MUST_ be enabled).
> 2) PA11=y, if SBA=n and CCIO=n, never IOMMU.
> 3) PA11=y, if SBA=y _or_ CCIO=y, requires runtime check
> 
> I think this is straight forward enough to code up in pci.h.
> 
> Further:
> CCIO depends on GSC
> SBA  depends on PCI
> 
> ergo Enabling PA20 and GSC but not PCI means CCIO *MUST* be enabled.
> ergo Enabling PA20 and PCI but not GSC means SBA  *MUST* be enabled.
> 
> Could someone else look at Kconfig files to verify the above two
> rules are enforced?

Ah, "depends on" doesn't mean what you think it does.  It means "if
GSC isn't selected, CCIO must be N.  if GSC is M, CCIO can be N or M.
if GSC is Y, CCIO can be Y, N or M."  OK, GSC can't be modular (nor can PCI),
but SCSI can, so:

config SCSI_SYM53C8XX_2
        tristate "SYM53C8XX Version 2 SCSI support"
        depends on PCI && SCSI

PCI ->	Y	N
SCSI v
Y	YMN	N
M	MN	N
N	N	N

The values in the table show the permitted values that SCSI_SYM53C8XX_2
can take on.  If there's only one possible answer, it doesn't even ask
the question ;-)  Think of 'depends on' as 'limit to' and it might be more
clear to you.

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
