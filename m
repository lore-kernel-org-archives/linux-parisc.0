Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id F40DD482E
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Aug 2003 09:51:29 -0600 (MDT)
Date: Thu, 7 Aug 2003 08:54:42 -0700
From: Randolph Chung <randolph@tausq.org>
To: geos@canada.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] adding a second nic to B1000
Message-ID: <20030807155442.GE4979@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20030807083620.21079.h004.c009.wm@mail.canada.com.criticalpath.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030807083620.21079.h004.c009.wm@mail.canada.com.criticalpath.net>
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

> it may be the 3com 3C95x pci card does not work in this
> box 
> it should work with debian 
> the card does work in i386 box 
> the builtin nic works fine

how does it "not work"? does it hang the box?

i have a spare 3c95x that i can try as well... (altho there are 
really many variants of the vortex/boomerang cards)

can you perhaps plug the card into a working i386 box and show us the
lspci -vvvn output?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
