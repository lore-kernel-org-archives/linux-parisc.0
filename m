Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from oscar.intranet.nimag.net (slipknot.nimag.net [195.202.197.141])
	by dsl2.external.hp.com (Postfix) with SMTP id 0B16E4830
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Oct 2001 18:08:33 -0600 (MDT)
Received: from francois by gollum.intranet.nimag.net with local (Exim 3.32 #1 (Debian))
	id 15pf13-0002WO-00
	for <parisc-linux@lists.parisc-linux.org>; Sat, 06 Oct 2001 02:08:29 +0200
Date: Sat, 6 Oct 2001 02:08:29 +0200
From: Francois Deppierraz <francois@ctrlaltdel.ch>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] nmap -O -> kernel panic on 712
Message-ID: <20011006020828.D2385@gollum.intranet.nimag.net>
References: <20010917165501.B17483@gollum.intranet.nimag.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20010917165501.B17483@gollum.intranet.nimag.net>
Sender: Francois Deppierraz <francois@ctrlaltdel.ch>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Sep 17, 2001 at 04:55:01PM +0200, Francois Deppierraz wrote:

> My HP 712/60 with a 2.4.9-pa20 kernel crash with the following error
> message when I portscan it using nmap -O (OS detection).
> 
> kswapd[4]: Unaligned data reference 28

I just upgraded today to 2.4.9-pa38 and it looks like this bug is
fixed.

Thanks you guys, great work !
-- 
Francois Deppierraz <francois.deppierraz@nimag.net>
Nimag Networks Sàrl - www.nimag.net
PGP Key ID: 9D283BC9
