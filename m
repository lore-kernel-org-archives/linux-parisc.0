Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id A95184829
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 20 Apr 2004 13:36:23 -0600 (MDT)
Date: Tue, 20 Apr 2004 15:35:37 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] RE: [PATCH] glibc-2.3.3 error with debian
	unstable	compiler...
Message-ID: <20040420193537.GB28094@baldric.uwo.ca>
References: <40711E5600000D4E@ocpmta1.freegates.net>
	<40711E5600009520@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <40711E5600009520@ocpmta1.freegates.net>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Tue, Apr 20, 2004 at 02:22:30PM +0200, Joel Soete wrote:
> Carlos,
> 
> Last week I encounter some pb to co last cvs, sorry.
> 
> This week and can apply your patch against the glibc cvs dated 20040419 (just
> some hunk failled because in the uptream: great).
> 
> I just complete the 'make -k check' (on chroot disk) which finished with
> just one more error then well known ones:
> make[2]: *** [/Develop/parisc-linux/build/glibc/stdio-common/tst-rndseek.out]
> Error 1
> make[1]: *** [stdio-common/tests] Error 2
> 
> ... And the compile (always in the chroot disk) of the last k-2.6.6-rc1-pa0
> works still fine and even boot well on a b180.

I'm seeing an extra error with realtime signal delivery tst-timer4, but
not this error. I'm working on fixing tst-timer4, can you find out why
tst-rndseek fails?

What does tst-rndseek.out say? I don't see this error?

Cheers,
Carlos.
