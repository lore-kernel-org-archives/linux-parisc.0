Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (unknown [24.112.142.143])
	by dsl2.external.hp.com (Postfix) with ESMTP id DF773482C
	for <parisc-linux@parisc-linux.org>; Wed,  5 Dec 2001 19:32:46 -0700 (MST)
Received: (from carlos@localhost)
	by sh.od.inet (8.11.0/8.11.0) id fB62X8715222
	for parisc-linux@parisc-linux.org; Wed, 5 Dec 2001 21:33:08 -0500
Date: Wed, 5 Dec 2001 21:33:08 -0500
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] ntpdate broken
Message-ID: <20011205213308.C13344@systemhalted>
References: <20011205041853.C12186@parcelfarce.linux.theplanet.co.uk> <20011205175625.G7051@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011205175625.G7051@linuxcare.com>; from rhirst@linuxcare.com on Wed, Dec 05, 2001 at 05:56:25PM +0000
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

> > 
> > ntpdate isn't working on paer.  from the strace:
> > 
> > socket(PF_INET, SOCK_DGRAM, IPPROTO_IP) = 4
> > fcntl(4, F_SETFL, O_RDONLY|O_NONBLOCK)  = 0
> > rt_sigaction(SIGALRM, {0x287a2, [], 0}, {SIG_DFL}, 8) = 0
> > setitimer(ITIMER_REAL, {it_interval={0, 200000}, it_value={0, 100000}}, NULL) = 0
> > setpriority(PRIO_PROCESS, 0, -12)       = 0
> > poll([{fd=4, events=POLLIN}], 1, 60000) = 0
> > poll( <unfinished ...>
> > 
> > anyone want to spend some time debugging this?  i'd bug the debian
> > maintainer, but i hear he's not very sympathetic towards hppa.
> 
> That poll call should have been interrupted by SIGALRM after about 100ms.
> time_t is long, so I guess we need a wrapper for setitimer()/getitimer().
> 
> Richard

Could there be other long issues lurking?
A hidden assumption somewhere?

I guess my questions would be: 
Are wide/narrow wrapper issues ferreted out one by one?

c.
