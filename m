Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.familie-weerts.de (dialin-fl-71247.ewetel.net [212.6.71.247])
	by dsl2.external.hp.com (Postfix) with ESMTP id 312DD482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Aug 2001 13:48:18 -0600 (MDT)
Date: Tue, 14 Aug 2001 13:53:37 +0000
From: Christian Weerts <christian@familie-weerts.de>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-ml <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] LAN booting
Message-ID: <20010814135337.C345@familie-weerts.de>
Reply-To: Christian Weerts <christian@familie-weerts.de>
References: <christian@familie-weerts.de> <200108132355.RAA14012@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200108132355.RAA14012@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Mon, Aug 13, 2001 at 05:55:23PM -0600
List-ID: <linux-parisc.vger.kernel.org>

* Grant Grundler <grundler@puffin.external.hp.com> [010813 23:55]:
> Christian Weerts wrote:
> > Hi,
> > 
> > is there anyone who has a running 715/80? I want to build a kernel for this
> > machine discribed in the nfsroot howto from Martin Petersen, but i don't
> > have HP-UX anywhere.
> 
> You don't need to have HPUX - note the date of Martin's HOW-TO.
> It was posted when we were still using SOM binaries and the linker only
> ran under HPUX. You should be able to install from the 0.92 ISO
> and build kernels natively.
I will try, but first i had to boot the machine over LAN, that's my problem
at the moment.
The RISC-Machine tells something like "Error: cannot load IPL, error
detected. Bootprocess failed..."
Perhaps you could help me, so i attach the bootptab and the dhcp-conf. Also
attached are the daemon.log and output from tcpdump. Btw., gorilla is the
server and mirage the client.
I don't know what's wrong. 
On the risc-machine i told him to boot from the lan.<hw-addr-server>.

> 
> Or build kernels on x86-linux using the XC toolchain built by Matt Taggart
> and posted to the puffin.external.hp.com ftp site. Search parisc-linux
> mail archives since May 2001 if you want the full URL.
Ack.

> 
> > If i had a kernel perhaps i could boot the machine over LAN.
> 
> Could you mount the 0.92 ISO on an x86-linux box and steal that kernel?
> (there are probably several but just try the 32-bit ones.)
I'll try. So, you mean i don't need the nfsroot-package named in Martin's
HOWTO?

Greets from northern germany

	Christian

-- 
http://oldenburg.linux.de
