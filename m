Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from deepthought.blinkenlights.nl (deepthought.blinkenlights.nl [62.58.162.228])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1901C482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  4 Feb 2002 03:51:22 -0700 (MST)
Date: Mon, 4 Feb 2002 11:58:10 +0100 (CET)
From: Sten <sten@blinkenlights.nl>
To: Jochen Friedrich <jochen@scram.de>
Cc: linux-kernel@vger.kernel.org,
	HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <Pine.NEB.4.33.0202041002120.2571-100000@www2.scram.de>
Message-ID: <Pine.LNX.4.44-Blink.0202041155020.19625-100000@deepthought.blinkenlights.nl>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Re: IPv6 Sparc64
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

On Mon, 4 Feb 2002, Jochen Friedrich wrote:

> > I have been trying to get ipv6 to work
> > on sparc64/kernel 2.4 but it looks like it
> > is broken somewhere in the kernel.
> > I was wondering if this was a known problem.
>
> > [root@towel ip]# ping6 ::1
> > PING ::1(::1) from ::1 : 56 data bytes
>
> It's the same on PARISC. However, on PARISC, although ping6 doesn't work,
> telnet etc do work, as well as pinging the PARISC box from an Intel or
> Alpha machine.

The reason I ask this is because I have been trying to setup a
tunnel, and I cant get it to work either with ifconfig or iproute.

[root@towel ip]# ip tunnel add blink mode sit remote x.x.x.x dev
eth0
ioctl: Invalid argument

-- 
Sten Spans

  "What does one do with ones money,
   when there is no more empty rackspace ?"
