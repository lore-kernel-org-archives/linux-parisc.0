Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 98278491B
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 28 Apr 2004 09:56:06 -0600 (MDT)
Date: Wed, 28 Apr 2004 11:54:51 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] RE: [PATCH] glibc-2.3.3 error with debian
	unstable	compiler...
Message-ID: <20040428155451.GE6936@baldric.uwo.ca>
References: <408D43600000128B@ocpmta2.freegates.net>
	<408D43600000166C@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <408D43600000166C@ocpmta2.freegates.net>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Apr 28, 2004 at 11:31:29AM +0200, Joel Soete wrote:
> Certainly: I just rebuild my own merge of 2.6.6-rc1-pa6 and 2.6.6-rc3 with
> gcc-hppa64 (from ftp.p-l.org) and reboot my b2k with it and effectively the
> result of tst-timer4 is a bit different:
> # ./tst-timer4
> clock_gettime returned timespec = { 1083142973, 718981000 }
> clock_getres returned timespec = { 0, 10000000 }
> *** sig1_sigval.sival_ptr (nil) != 0xbff00690
> *** sig2_sigval.sival_ptr 0 != 163
> # echo $?
> 0

It does help, we have a padding problem in siginfo, I never had enough
test cases to prove the __SI_RT parts were in the right place. This goes
to show that what you can't test is probably wrong.

I have to work on this today...

c.
