Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.nateng.com (user-vc8fdp3.biz.mindspring.com [216.135.183.35])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7E96F483D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 Jan 2003 21:31:53 -0700 (MST)
Received: from jordan.eng.nateng.com (jordan.eng.nateng.com [172.16.100.200])
	by mail.nateng.com (8.11.2/8.11.2) with ESMTP id h0S4jlp13674
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 Jan 2003 20:45:47 -0800
Received: from localhost (chandler@localhost)
	by jordan.eng.nateng.com (8.11.4/8.11.4) with ESMTP id h0S4Upt00417
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 Jan 2003 20:30:51 -0800
Date: Mon, 27 Jan 2003 20:30:51 -0800 (PST)
From: Sir Ace <chandler@nateng.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Kernel....
In-Reply-To: <20030128042418.GC20940@tausq.org>
Message-ID: <Pine.LNX.4.33.0301272030380.235-100000@jordan.eng.nateng.com>
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

Does vmlinuz work on hp?

On Mon, 27 Jan 2003, Randolph Chung wrote:

> > make boot doesn't work, and make vmlinux doesn't seem to be right
> > either...
> >
> > What is the target for a kernel build?
>
> make vmlinux is the right target for harddisk boot. for network boot you
> want make palo
>
> randolph
>
