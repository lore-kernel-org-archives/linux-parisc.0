Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 18B574A19
	for <parisc-linux@lists.parisc-linux.org>; Sun,  4 Feb 2001 06:34:04 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA21411
	for <parisc-linux@puffin.external.hp.com>; Sun, 4 Feb 2001 06:29:51 -0700
Received: from pc117-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.117)
  by mailserv2.iuinc.com with SMTP; 4 Feb 2001 13:33:57 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 74776B005; Sun,  4 Feb 2001 12:11:06 +0000 (GMT)
Date: Sun, 4 Feb 2001 12:11:06 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Greg Ingram <ingram@symsys.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] C100 improvements, problems
Message-ID: <20010204121106.A1374@linuxcare.com>
References: <20010125173637.R3571@linuxcare.com> <Pine.LNX.4.21.0101261205420.31352-100000@maestro.symsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0101261205420.31352-100000@maestro.symsys.com>; from ingram@symsys.com on Fri, Jan 26, 2001 at 12:16:29PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jan 26, 2001 at 12:16:29PM -0600, Greg Ingram wrote:
> > There is a bug in more (really!), now fixed, but needs a rebuild.  If you
> > invoke it as /bin/more you'll be ok.
> 
> I believe it, I just don't believe it.  Is this related to stack
> direction?  (What is it: grows down on parisc but up on Intel and most
> other Linux-supported processors?)  If so, what is more fiddling with on
> its stack?  Does it alter its behavior based on argv[0]?  Oh well, not
> really too important now, I guess.

parsic grows up, most others grow down.  'more' checked argv[0] to see
how it was invoked, and due to a coding bug tried to read argv[0][-1].
As argv[0] is the first item on our stack, that caused a trap.

Richard
