Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from interzone.ucc.ie (interzone.ucc.ie [143.239.1.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3A22F482E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Nov 2002 21:45:00 -0700 (MST)
Date: Sat, 23 Nov 2002 04:44:50 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Leif Harcke <lharcke@Stanford.EDU>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Tulip driver fails to advertise 100baseTx media
 capability
In-Reply-To: <Pine.LNX.4.44.0211221116130.28782-100000@chirp.Stanford.EDU>
Message-ID: <Pine.LNX.4.44.0211230437370.13058-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Fri, 22 Nov 2002, Leif Harcke wrote:

> Just got Debian 3.0 (woody) booted on a C240.  When the Tulip driver is
> initialized by the kernel, it fails to advertise the 100baseTx media
> capability of the DS21143 chip.  I think this is a kernel issue, not a
> Debian or Tulip issue.

the same for me.
It happens one out of 30 time that I get a 100mbit connection.
Usually I just get 10mbit full duplex (this machine is connected to a
10/100 Switch (not Hub), and just other 100Mbit capable network devices
are attached to it.

> Setting the PDC/firmware (v. 6.3, latest for the C240) to force the
> 100/Full duplex rate at boot time doesn't fix the problem, nor does
> issuing an "ether=0,0,[11|14],eth0" to the kernel from the PALO kernel
> parameters line.

The same for me

> I think the way Tulip is called by the kernel somehow causes only 10baseT
> to be advertised.  It's easy enough to correct after the fact with a
> simple "mii-tool -A" command, but it would be nicer if the media
> advertising was properly set by the kernel at boot time.  See output of
> uname, dmesg, and mii-tool below.
>
> A thousand pardons if this is the wrong list for this bug.  I'll re-post
> to the debian-hppa or the tulip list if people think those are the proper
> places.

I think it more a hardware related issue. The network card in the C240
is VERY picky about 100mbit negotiation.

Maybe you are able to force to switch it to 100mbit via software,
but I'm not sure.

See also http://www.unixnerd.demon.co.uk/hp_unix.html , the FAQ at
the bottom at the page.

greetings max
