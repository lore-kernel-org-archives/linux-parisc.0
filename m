Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 953FF4A19
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Feb 2001 09:25:49 -0700 (MST)
Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA28787
	for <parisc-linux@puffin.external.hp.com>; Mon, 5 Feb 2001 09:21:33 -0700
Received: from pc117-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.117)
  by mailserv2.iuinc.com with SMTP; 5 Feb 2001 16:25:21 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 00718B005; Mon,  5 Feb 2001 16:25:23 +0000 (GMT)
Date: Mon, 5 Feb 2001 16:25:23 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: 5116@telia.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Kernel module loader gived break
Message-ID: <20010205162523.P1374@linuxcare.com>
References: <200101271610.RAA30546@zaphod.halden.lillfab.se> <200101290356.TAA25535@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101290356.TAA25535@milano.cup.hp.com>; from grundler@cup.hp.com on Sun, Jan 28, 2001 at 07:56:08PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Jan 28, 2001 at 07:56:08PM -0800, Grant Grundler wrote:
> 5116@telia.com wrote:
> > Modprobe is not in stalled in my system (is it ported yet?).

It is.  Thanks to Bdale there is now a .deb of it in

ftp://puffin.external.hp.com/pub/parisc/binaries/new-debs/debian/

Just tried on a b180 and it seems to work ok.

Note pehc cvs modutils is no longer up to date; if you want to build
your own, you should use the latest official source.

Richard
