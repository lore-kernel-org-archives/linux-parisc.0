From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] stop the buffer bouncing
Date: Tue, 16 Nov 2004 11:14:27 -0700
Message-ID: <20041116181427.GG4176@colo.lackof.org>
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
> > Further:
> > CCIO depends on GSC
> > SBA  depends on PCI
> > 
> > ergo Enabling PA20 and GSC but not PCI means CCIO *MUST* be enabled.
> > ergo Enabling PA20 and PCI but not GSC means SBA  *MUST* be enabled.
> > 
> > Could someone else look at Kconfig files to verify the above two
> > rules are enforced?
> 
> Ah, "depends on" doesn't mean what you think it does.  It means "if
> GSC isn't selected, CCIO must be N.

Actually, in this particular case, this is what I was expecting. 
I didn't understand some of the other subtleties.
ie I'm still now sure how to encode "depends" statements
that involve PA20 and PCI/GSC vis a vis SBA/CCIO support.
Seems like it should be possible though.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
