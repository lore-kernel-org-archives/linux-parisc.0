From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] stop the buffer bouncing
Date: Tue, 16 Nov 2004 11:05:25 -0700
Message-ID: <20041116180525.GF4176@colo.lackof.org>
References: <20041116063733.GA27633@colo.lackof.org>
	<20041116150748.GI26623@parcelfarce.linux.theplanet.co.uk>
	<20041116160939.GB4176@colo.lackof.org>
	<20041116163403.GJ26623@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041116163403.GJ26623@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Nov 16, 2004 at 04:34:03PM +0000, Matthew Wilcox wrote:
> On Tue, Nov 16, 2004 at 09:09:39AM -0700, Grant Grundler wrote:
> > yeah...I'm probably responsible for that setting.
> > It worked the best. :^/
> > The 39/40 bit or full 64-bit support don't help on parisc-linux anyway.
> 
> Why not?  40 bits of addressing supports up to 1TB, which exceeds the
> highest physical address on any PA machine I know about -- oh, but we
> can't bypass the IOMMU, right?

exactly.

Certainly not for CCIO.
On SBA, someone could try writing DVI mode support but I'm not going to.
I think DVI mode adds more complexity than performance improvement.
But clearly some workloads could benefit. Anything that helps avoid
IO TLB thrashing is a good thing.

On ZX1 (also SBA), I suppose it's possible to fully bypass using
non-coherent support.  But that seems like a step backwards for general use.

...
> > ergo Enabling PA20 and GSC but not PCI means CCIO *MUST* be enabled.
> > ergo Enabling PA20 and PCI but not GSC means SBA  *MUST* be enabled.
> > 
> > Could someone else look at Kconfig files to verify the above two
> > rules are enforced?
> 
> Ah, "depends on" doesn't mean what you think it does.  It means "if
> GSC isn't selected, CCIO must be N.

Oh. You are right...but YKWIM.

> if GSC is M, CCIO can be N or M.
> if GSC is Y, CCIO can be Y, N or M."
...
> The values in the table show the permitted values that SCSI_SYM53C8XX_2
> can take on.  If there's only one possible answer, it doesn't even ask
> the question ;-)  Think of 'depends on' as 'limit to' and it might be more
> clear to you.

*nod*
I'll have to re-read this and the original docs...but I suspected
I didn't fully understand Kconfig anyway.  That's contributing to why
I'm "defering" it. :^)

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
