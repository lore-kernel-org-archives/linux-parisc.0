Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 169A74838
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 Jan 2003 21:27:32 -0700 (MST)
Date: Mon, 27 Jan 2003 20:24:18 -0800
From: Randolph Chung <randolph@tausq.org>
To: Sir Ace <chandler@nateng.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel....
Message-ID: <20030128042418.GC20940@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20030126215205.GD28343@dsl2.external.hp.com> <Pine.LNX.4.33.0301272021470.235-100000@jordan.eng.nateng.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.33.0301272021470.235-100000@jordan.eng.nateng.com>
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

> make boot doesn't work, and make vmlinux doesn't seem to be right
> either...
> 
> What is the target for a kernel build?

make vmlinux is the right target for harddisk boot. for network boot you
want make palo

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
