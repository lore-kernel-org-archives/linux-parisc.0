Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id AC2F54851
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Oct 2001 09:53:24 -0600 (MDT)
To: Matthew Wilcox <willy@debian.org>
Message-ID: <1002556397.3bc1cbed99e0b@webmail.tiscalinet.be>
Date: Mon, 08 Oct 2001 17:53:17 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org
References: <1002553729.3bc1c18187924@webmail.tiscalinet.be> <20011008162234.D28880@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20011008162234.D28880@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] Re: LVM 1.0.1-rc4 on hppa
List-ID: <linux-parisc.vger.kernel.org>

Quoting Matthew Wilcox <willy@debian.org>:

> On Mon, Oct 08, 2001 at 05:08:49PM +0200, joel.soete@freebel.net wrote:
> > Also I excute 'vgscan':
> > Segmentation fault.
> > 
> > Oct  8 17:06:56 palinux kernel:  ORIG_R28: 00000003
> 
> looks like a null pointer dereference in a shared library -- can't tell
> which without seeing the maps for vgscan.  i recommend running vgscan
> under gdb and seeing wht's going on.

About gdb for hppa, may I use the one into 
"pehc /pub/parisc/binaries/debian/unofficial-debs/".

        joel

> 
> -- 
> Revolutions do not require corporate support.
> 
> 


-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
