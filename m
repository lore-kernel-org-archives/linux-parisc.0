Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7A7014829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Dec 2002 17:04:06 -0700 (MST)
Date: Wed, 11 Dec 2002 16:05:11 -0800
From: Randolph Chung <randolph@tausq.org>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Solved: Kernel crash when loggin in via ssh
Message-ID: <20021212000511.GH19331@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20021211063321.GB10185@systemhalted> <Pine.LNX.4.44.0212112313290.861-100000@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.44.0212112313290.861-100000@sal.ucc.ie>
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

> gcc-3.0_3.0.4-13 produces a working kernel, gcc-3.2-3.2.2-0pre0 produces
> a miscompiled kernel (faulty networking, causes kernel crash).

Just to reiterate Dave's point, this is not necessarily a compiler
problem. 

> I think it is no urban legend anymore ... :-/
> I've also see quite alot reports on p-l about miscompiled kernels with
> anything other than gcc-3.0.4, actually several months ago; so I thought
> these issues have been solved by now ...

you will also see several attempts from me to get more info about these
problems, since i have yet to reproduce this. No one has stepped forward
to provide the info to track this down...

please, follow the info at
http://www.parisc-linux.org/faq/kernelbug-howto.html to report where is
the crash, what is your config, etc.... just saying "it doesn't work"
will not help us fix it.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
