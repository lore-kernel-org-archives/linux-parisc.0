Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA25384
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 May 2000 08:34:19 -0600
Received: from ppp-1-154.cvx3.telinco.net (HELO rhirst.linuxcare.com) (@212.1.144.154)
  by mailserv2.iuinc.com with SMTP; 25 May 2000 14:34:37 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 8BC58B009; Thu, 25 May 2000 15:34:23 +0100 (BST)
Date: Thu, 25 May 2000 15:33:46 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Ethernet driver issues....
Message-ID: <20000525153346.C4413@linuxcare.com>
References: <Pine.GSO.3.96.1000525095354.23825D-100000@users.qual.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.GSO.3.96.1000525095354.23825D-100000@users.qual.net>; from sammy@oh.verio.com on Thu, May 25, 2000 at 09:55:01AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Thu, May 25, 2000 at 09:55:01AM -0400, Sam Creasey wrote:
> 
> This message appeared on the m68k list today, I've had some of these
> issues with the lasi ethernet driver on my 712....  any change with a
> newer driver as listed below?

The changes that went in to 82596.c for 2.3.99-pre6 are already in
our lasi_82596.c source, under cvs.  I committed them about a week
ago and have had only positive reports since.  Give it a try on
your 712...

Richard
