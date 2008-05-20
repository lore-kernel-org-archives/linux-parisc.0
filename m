From: "rubisher" <rubisher@scarlet.be>
Subject: Re: BUG 2.6.26-rc2: deadlock with pa_tlb_lock
Date: Wed, 21 May 2008 00:39:33 +0100
Message-ID: <K16XPX$D5402EE5D532F39790DD094A456EC2C4@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "grundler" <grundler@parisc-linux.org>,
	"linux-parisc" <linux-parisc@vger.kernel.org>,
	"rubisher" <rubisher@scarlet.be>
To: "grundler" <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Tue, May 20, 2008 at 01:36:14PM +0100, rubisher wrote:
> > Hello,
> > 
> > > Hey,
> > >
> > > Rebuilding now with gcc-4.2 (instead of gcc-4.3) and retesting
> > > with 2.6.26-rc3.
> > >
> > Just a short report, tbh I didn't pay attention that gcc-4.3 became the
> > default gcc on my unstable install:
> > same Kyle git tree 2.6.26-rc2 + fixed vmlinux.lds 32bit up build for d380 &
> > b2k with new gcc-4.3 boot well but nic failed to work (either from box ping
> > outside or the contrary: nothing respond)? (the same for the 2 different
boxes.)
> 
> Yes - we have to track down what causes the network to fail.
> ARP is still working correctly so I'm doubtful this is a
> NIC driver problem. I've posted more notes on this several
> weeks ago.
> 
oops sorry I missed it or simply wrongly understand ;<?

> The gcc-4.3/networking bug is a seperate issue from the bug
> which I original reported in this thread.
> 
ok

cu,
  J.
> hth,
> grant
> 
> > Otoh, same src tree rebuild with gcc-4.2 works fine on the boxes without any
> > other chg.
> > 
> > Hth,
> >   r.
> > 
> > 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 

