Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA11786
	for <parisc-linux@puffin.external.hp.com>; Tue, 10 Oct 2000 14:54:53 -0600
Received: from ppp-1-57.as53.telinco.net (HELO rhirst.linuxcare.com) (@212.159.152.57)
  by mailserv2.iuinc.com with SMTP; 10 Oct 2000 20:55:54 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 3B32EB005; Tue, 10 Oct 2000 21:53:15 +0100 (BST)
Date: Tue, 10 Oct 2000 21:53:15 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Bdale Garbee <bdale@gag.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ntpd fails on mlockall()
Message-ID: <20001010215315.J9399@linuxcare.com>
References: <20001010025700.26519359E7@rover.gag.com> <20001010120841.F9399@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001010120841.F9399@linuxcare.com>; from rhirst@linuxcare.com on Tue, Oct 10, 2000 at 12:08:41PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Oct 10, 2000 at 12:08:41PM +0100, Richard Hirst wrote:
> On Mon, Oct 09, 2000 at 08:57:00PM -0600, Bdale Garbee wrote:
> > I built a package of ntp, and it installed ok, but when ntpd goes to launch,
> > I get the following in daemon.log:
> > 
> > Oct  9 20:51:27 j5k ntpd[19416]: ntpd 4.0.99g Mon Oct  9 20:44:40 MDT 2000 (1)
> > Oct  9 20:51:27 j5k ntpd[19416]: mlockall(): Cannot allocate memory
> 
> A simple prog that just calls mlockall() fails as well.  It is because
> we currently allocate a massive stack (256MB?) for every process, and
> mlockall() tries to actually claim the memory for that stack.  I tried
> allocating just a 1MB stack in fs/exec.c, and my simple mlockall()
> prog then worked.

I've changed the kernel to grow the user stack dynamically, so
hopefully your ntpd will work now.

Richard
