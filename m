From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [Alsa-devel] [PATCH] Support for AD1889 PCI
	Soundchip
Date: Mon, 22 Aug 2005 18:13:25 -0600
Message-ID: <20050823001325.GA19568__37955.4454972551$1416623915$gmane$org@colo.lackof.org>
References: <20050817101017.008D03658E8@mail.esiee.fr>
	<Pine.HPX.4.33n.0508171249360.19860-200000@studcom.urz.uni-halle.de>
	<20050819174655.GA6376@colo.lackof.org>
	<s5hr7cpdd9p.wl%tiwai@suse.de>
	<20050820013655.GC6376@colo.lackof.org>
	<s5hpss6p721.wl%tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Clemens Ladisch <clemens@ladisch.de>,
 kyle@parisc-linux.org,
 Thibaut VARENE <T-Bone@parisc-linux.org>,
 alsa-devel@lists.sourceforge.net,
 parisc-linux@lists.parisc-linux.org
To: Takashi Iwai <tiwai@suse.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <s5hpss6p721.wl%tiwai@suse.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Aug 22, 2005 at 01:03:34PM +0200, Takashi Iwai wrote:
> At Fri, 19 Aug 2005 19:36:55 -0600,
> Grant Grundler wrote:
> > 
> > On Fri, Aug 19, 2005 at 07:53:22PM +0200, Takashi Iwai wrote:
> > > Check his patch carefully.  It doesn't add any extra accesses (except
> > > for one readl to flush in irq handler - I guess it was added to be
> > > sure?).  The original driver didn't use these fields effectively at
> > > all, too.
> > 
> > Sorry - I didn't look at patch at all.
> > If the fields were never used, removing them is fine.
> > If they *could* have been used, then removing them is a bad idea.
> 
> They won't be used/referred any more at all, so why do you need still
> to keep them?

I don't - removing them is fine.

> > In general, referencing parameters in IO device registers is NOT
> > a good substitute for caching the values "locally" in host mem.
> 
> A cached value is not accurate, especially if you want to get a
> precise position.

Caching is only possible if the register is "constant" for
the duration of it's use. e.g. offset or "count down" registers
can't be cached.


>   The position callback should return the accurate
> position as much as possible since this can be used from the low
> latency calculation like dmix.

ok - no problem. That's reasonable.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
