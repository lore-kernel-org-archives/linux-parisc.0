From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: BUG 2.6.26-rc2: deadlock with pa_tlb_lock
Date: Tue, 20 May 2008 13:53:01 -0600
Message-ID: <20080520195301.GA28189@colo.lackof.org>
References: <K1630E$CD50E274087F116859994AEA72189418@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: grundler <grundler@parisc-linux.org>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	rubisher <rubisher@scarlet.be>
To: rubisher <rubi.sher@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <K1630E$CD50E274087F116859994AEA72189418@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, May 20, 2008 at 01:36:14PM +0100, rubisher wrote:
> Hello,
> 
> > Hey,
> >
> > Rebuilding now with gcc-4.2 (instead of gcc-4.3) and retesting
> > with 2.6.26-rc3.
> >
> Just a short report, tbh I didn't pay attention that gcc-4.3 became the
> default gcc on my unstable install:
> same Kyle git tree 2.6.26-rc2 + fixed vmlinux.lds 32bit up build for d380 &
> b2k with new gcc-4.3 boot well but nic failed to work (either from box ping
> outside or the contrary: nothing respond)? (the same for the 2 different boxes.)

Yes - we have to track down what causes the network to fail.
ARP is still working correctly so I'm doubtful this is a
NIC driver problem. I've posted more notes on this several
weeks ago.

The gcc-4.3/networking bug is a seperate issue from the bug
which I original reported in this thread.

hth,
grant

> Otoh, same src tree rebuild with gcc-4.2 works fine on the boxes without any
> other chg.
> 
> Hth,
>   r.
> 
> 
