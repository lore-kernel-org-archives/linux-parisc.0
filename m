Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from alpha.bocc.de (p5080D25A.dip.t-dialin.net [80.128.210.90])
	by dsl2.external.hp.com (Postfix) with ESMTP id ECFFE482B
	for <parisc-linux@lists.parisc-linux.org>; Sun, 17 Feb 2002 09:31:14 -0700 (MST)
Date: Sun, 17 Feb 2002 17:30:55 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: Sten <sten@blinkenlights.nl>
Cc: linux-kernel@vger.kernel.org,
	HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Re: IPv6 Sparc64
In-Reply-To: <Pine.LNX.4.44-Blink.0202041155020.19625-100000@deepthought.blinkenlights.nl>
Message-ID: <Pine.LNX.4.43.0202171727570.30347-100000@alpha.bocc.de>
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

Hi Sten,

On Mon, 4 Feb 2002, Sten wrote:

> On Mon, 4 Feb 2002, Jochen Friedrich wrote:
> 
> > > I have been trying to get ipv6 to work
> > > on sparc64/kernel 2.4 but it looks like it
> > > is broken somewhere in the kernel.
> > > I was wondering if this was a known problem.
> >
> > > [root@towel ip]# ping6 ::1
> > > PING ::1(::1) from ::1 : 56 data bytes
> >
> > It's the same on PARISC. However, on PARISC, although ping6 doesn't work,
> > telnet etc do work, as well as pinging the PARISC box from an Intel or
> > Alpha machine.
> 
> The reason I ask this is because I have been trying to setup a
> tunnel, and I cant get it to work either with ifconfig or iproute.
> 
> [root@towel ip]# ip tunnel add blink mode sit remote x.x.x.x dev
> eth0
> ioctl: Invalid argument

At least on PARISC, this turned out to be an glibc issue. With the latest 
glibc from debian unstable, ping6 is now working OK:

# ping6 -n www.kame.net
PING www.kame.net(3ffe:501:4819:2000:203:47ff:fea5:3257) from 
3ffe:400:470:4:a00:9ff:fe17:ca3d : 56 data bytes
64 bytes from 3ffe:501:4819:2000:203:47ff:fea5:3257: icmp_seq=1 ttl=53 
time=592
ms
64 bytes from 3ffe:501:4819:2000:203:47ff:fea5:3257: icmp_seq=2 ttl=53 
time=609
ms

--- www.kame.net ping statistics ---
3 packets transmitted, 2 received, 33% loss, time 2022ms
rtt min/avg/max/mdev = 592.367/601.114/609.862/8.781 ms
 
Cheers,
Jochen
