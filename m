Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id BE5886130
	for <parisc-linux@parisc-linux.org>; Wed,  5 Dec 2001 10:56:17 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id D2A7FB00C; Wed,  5 Dec 2001 17:56:25 +0000 (GMT)
Date: Wed, 5 Dec 2001 17:56:25 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] ntpdate broken
Message-ID: <20011205175625.G7051@linuxcare.com>
References: <20011205041853.C12186@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011205041853.C12186@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Wed, Dec 05, 2001 at 04:18:53AM +0000
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

On Wed, Dec 05, 2001 at 04:18:53AM +0000, Matthew Wilcox wrote:
> 
> ntpdate isn't working on paer.  from the strace:
> 
> socket(PF_INET, SOCK_DGRAM, IPPROTO_IP) = 4
> fcntl(4, F_SETFL, O_RDONLY|O_NONBLOCK)  = 0
> rt_sigaction(SIGALRM, {0x287a2, [], 0}, {SIG_DFL}, 8) = 0
> setitimer(ITIMER_REAL, {it_interval={0, 200000}, it_value={0, 100000}}, NULL) = 0
> setpriority(PRIO_PROCESS, 0, -12)       = 0
> poll([{fd=4, events=POLLIN}], 1, 60000) = 0
> poll( <unfinished ...>
> 
> anyone want to spend some time debugging this?  i'd bug the debian
> maintainer, but i hear he's not very sympathetic towards hppa.

That poll call should have been interrupted by SIGALRM after about 100ms.
time_t is long, so I guess we need a wrapper for setitimer()/getitimer().

Richard
