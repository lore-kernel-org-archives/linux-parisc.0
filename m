Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta-2.gci.net (mta-2.gci.net [208.138.130.83])
	by dsl2.external.hp.com (Postfix) with ESMTP id 67DE3484C
	for <parisc-linux@parisc-linux.org>; Thu, 27 Dec 2001 11:02:57 -0700 (MST)
Received: from mmp-2.gci.net ([208.138.130.81]) by mta-2.gci.net
          (Netscape Messaging Server 4.15) with ESMTP id GP0KSV00.AFV for
          <parisc-linux@parisc-linux.org>; Thu, 27 Dec 2001 09:02:55 -0900
Date: Thu, 27 Dec 2001 09:00:04 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Oops... 
In-Reply-To: <20011227164045.45E9F4831@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.33.0112270851160.4166-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

> Tom wrote:
> > Perhaps I spoke too soon about -pa24 being good. After compiling and
> > rebooting with -pa24, then an apt-get update/dist-upgrade, make no longer
> > works.
>
On Thu, 27 Dec 2001, Grant Grundler wrote:
> Could you check if make was replaced or one of it's libs?
> "debsums -s" would be another good thing to check.
> FWIW, make works fine for me with all the recent kernels (if they booted).

That's my guess too... 'make -d mrproper' gives:

Reading makefiles...
Reading makefile `Makefile'...
Got a SIGCHLD; 1 upreaped children.
Got a SIGCHLD; 1 upreaped children.
Got a SIGCHLD; 1 upreaped children.
Reading makefile `.config' (search path) (no ~ expansion)...
Reading makefile `.depend' (search path) (no ~ expansion)...
Reading makefile `arch/parisc/Makefile' (search path) (no ~ expansion)...
Got a SIGCHLD; 2 unreaped children
Trace/Breakpoint trap

...and back to prompt. Running again crashed the telnet session :-(  So,
ran with 'make -d mrproper > ~/make.err' a few times. Sometimes I get the
above text, sometimes it's just empty. 'make clean' or 'make oldconfig' do
the same thing...

'debsums -s' once again is clean, no errors. I'm thinking of waiting a
bit, re-running the apt-get dist-upgrade to catch things up, then see if
it fixes itself...

> Reboot the older kernel and run "debsums -s" would be my first step.

...although I'll probably do this, since I can't stand the idea of just
ignoring a problem :-)
