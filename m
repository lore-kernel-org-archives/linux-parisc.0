Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA20503
	for <parisc-linux@puffin.external.hp.com>; Tue, 10 Oct 2000 05:10:31 -0600
Received: from user48-186.jakinternet.co.uk (HELO rhirst.linuxcare.com) (@212.41.48.186)
  by mailserv2.iuinc.com with SMTP; 10 Oct 2000 11:11:30 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 5DD34B005; Tue, 10 Oct 2000 12:08:41 +0100 (BST)
Date: Tue, 10 Oct 2000 12:08:41 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Bdale Garbee <bdale@gag.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ntpd fails on mlockall()
Message-ID: <20001010120841.F9399@linuxcare.com>
References: <20001010025700.26519359E7@rover.gag.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001010025700.26519359E7@rover.gag.com>; from bdale@gag.com on Mon, Oct 09, 2000 at 08:57:00PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Oct 09, 2000 at 08:57:00PM -0600, Bdale Garbee wrote:
> I built a package of ntp, and it installed ok, but when ntpd goes to launch,
> I get the following in daemon.log:
> 
> Oct  9 20:51:27 j5k ntpd[19416]: ntpd 4.0.99g Mon Oct  9 20:44:40 MDT 2000 (1)
> Oct  9 20:51:27 j5k ntpd[19416]: mlockall(): Cannot allocate memory

A simple prog that just calls mlockall() fails as well.  It is because
we currently allocate a massive stack (256MB?) for every process, and
mlockall() tries to actually claim the memory for that stack.  I tried
allocating just a 1MB stack in fs/exec.c, and my simple mlockall()
prog then worked.

Richard
