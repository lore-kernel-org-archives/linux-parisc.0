From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Some warning: ... cleanup; realy no interest?
Date: Fri, 7 Sep 2007 12:53:58 -0400
Message-ID: <20070907165358.GF23583__4415.4173265726$1416624438$gmane$org@fattire.cabal.ca>
References: <46E1808B.20301@scarlet.be> <200709071650.l87GoPTZ020957@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Joel Soete <soete.joel@scarlet.be>,
 matthew@wil.cx,
 parisc-linux@lists.parisc-linux.org,
 deller@gmx.de
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <kyle@fattire.cabal.ca>
In-Reply-To: <200709071650.l87GoPTZ020957@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Sep 07, 2007 at 12:50:25PM -0400, John David Anglin wrote:
> > Matthew Wilcox wrote:
> > > On Wed, Sep 05, 2007 at 03:51:22PM +0000, Joel Soete wrote:
> > >> mmm and what do you think about adding yet another format letter e.g. [rR] for resource_size_t as it was done for [zZ]?
> > > 
> > > You'd also have to teach gcc about it.
> > > 
> > What should I teach to gcc?
> 
> Don't try, it's a waste of effort.  Just do the cast to unsigned long long
> as previously suggested.
>

I'd rather do neither. Talking to Viro we've been thinking about
removing the format check attributes from the kernel and using sparse
instead, which is under a bit tighter control.

--Kyle
