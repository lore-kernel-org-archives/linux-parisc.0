Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8834D48BB
	for <parisc-linux@lists.parisc-linux.org>; Sun, 28 Sep 2003 11:25:48 -0600 (MDT)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h8SHOxq21070;
	Sun, 28 Sep 2003 13:25:00 -0400
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 willy
From: James Bottomley <James.Bottomley@steeleye.com>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20030928165631.GS5759@sleepie.demon.co.uk>
References: <20030927072449.5AF0F494058@palinux.hppa>
	<20030928165631.GS5759@sleepie.demon.co.uk>
Content-Type: text/plain
Date: 28 Sep 2003 12:24:26 -0500
Message-Id: <1064769945.10841.1.camel@mulgrave>
Mime-Version: 1.0
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

On Sun, 2003-09-28 at 11:56, Richard Hirst wrote:
> Only because I didn't get it to work properly when I did the original
> 720 support, iirc.  The chip does have INTFLY.  I _think_ INTFLY worked
> a bit, but the driver tended to miss interrupts sometimes.  Could easily
> have been a driver bug.  Was a long time ago now though, so I could be
> misremembering.

Actually, the 720 is bust in silicon.  The 770 has a properly working
intfly, but the 720's doesnt work reliably.  Actually, the Q720 board
this driver also drives is wired to have a special "intfly" from a board
register to get around the problem.

James
