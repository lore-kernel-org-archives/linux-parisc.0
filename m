Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA17225
	for <parisc-linux@puffin.external.hp.com>; Wed, 11 Oct 2000 06:11:32 -0600
Received: from user32-202.jakinternet.co.uk (HELO rhirst.linuxcare.com) (@212.41.32.202)
  by mailserv2.iuinc.com with SMTP; 11 Oct 2000 12:12:37 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 453CAB005; Wed, 11 Oct 2000 13:09:57 +0100 (BST)
Date: Wed, 11 Oct 2000 13:09:57 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Bdale Garbee <bdale@gag.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ntpd fails on mlockall()
Message-ID: <20001011130957.N9399@linuxcare.com>
References: <20001010025700.26519359E7@rover.gag.com> <20001010215315.J9399@linuxcare.com> <8766n0ynjw.fsf@rover.gag.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <8766n0ynjw.fsf@rover.gag.com>; from bdale@gag.com on Tue, Oct 10, 2000 at 11:06:11PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Oct 10, 2000 at 11:06:11PM -0600, Bdale Garbee wrote:
> rhirst@linuxcare.com (Richard Hirst) writes:
> 
> > I've changed the kernel to grow the user stack dynamically, so
> > hopefully your ntpd will work now.
> 
> Still dies, but without the mlockall() error, so that seems fixed.  The dmesg
> output when it fails is

Thought I'd better investigate in case it was my stack changes...
(configured and built ntp natively, btw).
Turns out this crash is caused by the call to timer_create() in
ntpd/ntp_timer.c.

timer_create() is in librt.a - anyone know whether we expect this to
work or not atm?

Anyway, if you undefine HAVE_TIMER_CREATE and HAVE_TIMER_SETTIME
in config.h and rebuild it, it does better.  I now get:

11 Oct 05:21:13 ntpd[3141]: logging to file /tmp/ntpd.log
11 Oct 05:21:13 ntpd[3141]: ntpd 4.0.99g Wed Oct 11 05:17:40 MDT 2000 (5)
11 Oct 05:21:13 ntpd[3141]: precision = 10000 usec
11 Oct 05:21:13 ntpd[3141]: kern_enable is 1
11 Oct 05:21:13 ntpd[3141]: init_socket_sig: ioctl(I_SETSIG, S_INPUT) failed: Bad address

So, I undefined USE_UDP_SIGPOLL, and now ntpd runs and talks to remote
ntp servers.  Don't know whether it is doing what it should though...

Richard
