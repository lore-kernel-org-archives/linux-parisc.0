Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Leif Harcke <lharcke@Stanford.EDU>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Tulip driver fails to advertise 100baseTx media capability 
In-Reply-To: Message from Leif Harcke <lharcke@Stanford.EDU>
   of "Fri, 22 Nov 2002 13:29:40 PST." <Pine.LNX.4.44.0211221116130.28782-100000@chirp.Stanford.EDU>
References: <Pine.LNX.4.44.0211221116130.28782-100000@chirp.Stanford.EDU> 
Date: Fri, 22 Nov 2002 15:09:37 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021122220937.29082482B@dsl2.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Leif Harcke wrote:
> Just got Debian 3.0 (woody) booted on a C240.  When the Tulip driver is
> initialized by the kernel, it fails to advertise the 100baseTx media
> capability of the DS21143 chip.  I think this is a kernel issue, not a
> Debian or Tulip issue.

Is the tulip comminucating on the wire at all?  (Sounds like it is)

> I think the way Tulip is called by the kernel somehow causes only 10baseT
> to be advertised.  It's easy enough to correct after the fact with a
> simple "mii-tool -A" command, but it would be nicer if the media
> advertising was properly set by the kernel at boot time.  See output of
> uname, dmesg, and mii-tool below.

It's possible this is a problem/interaction with your switch/hub.

> A thousand pardons if this is the wrong list for this bug.  I'll re-post
> to the debian-hppa or the tulip list if people think those are the proper
> places.

It does sound like a kernel problem and this is a good place to start.

> sar2:~# uname -a
> Linux sar2 2.4.18-32 #1 Sat Mar 30 18:26:22 MST 2002 parisc unknown

I committed a tulip "phy reset" issue fix in later kernels that I don't
think is part of the 2.4.18 Debian 3.0 kernel.

> 
> sar2:~# dmesg | grep ulip
> Linux Tulip driver version 0.9.15-pre9 (Nov 6, 2001)
> tulip0: no phy info, aborting mtable build
> tulip0:  MII transceiver #1 config 1000 status 782d advertising 0061.
> eth0: Digital DS21143 Tulip rev 65 at 0xff00, 00:10:83:05:73:95, IRQ 96.
> 
> sar2:~# mii-tool -v
> eth0: negotiated 10baseT-FD, link ok
>   product info: Level One LXT970/971 rev 1
>   basic mode:   autonegotiation enabled
>   basic status: autonegotiation complete, link ok
>   capabilities: 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD
>   advertising:  10baseT-FD 10baseT-HD
>   link partner: 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD

On my a500 (64-bit) I get:
gsyprf11:/usr/src/linux# mii-tool -v eth0
SIOCGMIIPHY on 'eth0' failed: Invalid argument

Looks like we have some work to do for 64-bit.

B180 (32-bit) is much happier:
debian:~# mii-tool -v eth0
eth0: no autonegotiation, 100baseTx-FD, link ok
  product info: Level One LXT970/971 rev 0
  basic mode:   autonegotiation enabled
  basic status: autonegotiation complete, link ok
  capabilities: 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD
  advertising:  100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD
  link partner: 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD
debian:~# uname -r
2.4.19-pa24


> sar2:~# mii-tool -A 100baseTx-FD,100baseTx-HD,10baseT-FD,10baseT-HD
> restarting autonegotiation...
> 
> sar2:~# mii-tool -v
> eth0: negotiated 100baseTx-FD, link ok
>   product info: Level One LXT970/971 rev 1
>   basic mode:   autonegotiation enabled
>   basic status: autonegotiation complete, link ok
>   capabilities: 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD
>   advertising:  100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD
>   link partner: 100baseTx-FD 100baseTx-HD 10baseT-FD 10baseT-HD

This really sounds like a tulip driver/switch interaction problem.

grant
