Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 029444834
	for <parisc-linux@lists.parisc-linux.org>; Thu, 24 Oct 2002 12:11:28 -0600 (MDT)
Date: Thu, 24 Oct 2002 11:15:41 -0700
From: Randolph Chung <randolph@tausq.org>
To: Stefan Pfetzing <dreamind@dreamind.de>
Cc: jsoe0708@tiscali.be, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: mkfs.xfs (xfsprogs-2.3.5) failled
Message-ID: <20021024181540.GE5602@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3DB5776100000362@ocpmta8.be.tiscali.com> <20021024175802.GA9490@dreamind.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021024175802.GA9490@dreamind.de>
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

> Yea thats a problem, still in the Linux/Parisc kernel. It gives garbage with
> BLKGETSIZE64. Simply look in the xfslibs directory where BLGKETSIZE64 is used
> and comment that out. Thats a disgusting hack but it leads to a set of working
> xfsprogs.

i thought i fixed this in the kernel recently (last month). If this is
still not working, please point out the kernel version you are using.

thanks
randolph
