Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1AE6D482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jul 2001 06:39:12 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15ND5C-0006ku-00; Thu, 19 Jul 2001 13:39:10 +0100
Date: Thu, 19 Jul 2001 13:39:09 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: "Laubrock, Ulrich" <Ulrich.Laubrock@t-systems.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Problems with Release 0.9 for PA-RISC
Message-ID: <20010719133909.A24210@parcelfarce.linux.theplanet.co.uk>
References: <Ulrich.Laubrock@t-systems.de> <200107182135.PAA08428@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200107182135.PAA08428@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Wed, Jul 18, 2001 at 03:35:58PM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jul 18, 2001 at 03:35:58PM -0600, Grant Grundler wrote:
> > My greatest problem is that i have no ftpd, no telnetd and no rlogind. 
> > As ftpd i think i can get wu_ftp, but where can i get an telnetd and an rlogi
> >   nd?
> 
> Right.  As root:
> 	apt-get update 
> 	apt-get install ftpd
> 	apt-get install telnetd
> 
> I didn't see a rlogind package available.

apt-cache search rlogind returns rrlogind, rsh-server, and
krb5-rsh-server.  rrlogind is a spurious hit, so you have your choice
of kerborised or vanilla rlogin servers :-)

> The evil-minded debian developers I consort with have brainwashed
> me into only using ssh and sshd.

... of course, i only have sshd installed :-)

-- 
Revolutions do not require corporate support.
