Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.nateng.com (user-vc8fdp3.biz.mindspring.com [216.135.183.35])
	by dsl2.external.hp.com (Postfix) with ESMTP id 510ED482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Jan 2003 17:22:39 -0700 (MST)
Received: from jordan.eng.nateng.com (jordan.eng.nateng.com [172.16.100.200])
	by mail.nateng.com (8.11.2/8.11.2) with ESMTP id h0T0avp06189
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Jan 2003 16:36:58 -0800
Received: from localhost (chandler@localhost)
	by jordan.eng.nateng.com (8.11.4/8.11.4) with ESMTP id h0T0LqE01041
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Jan 2003 16:21:52 -0800
Date: Tue, 28 Jan 2003 16:21:52 -0800 (PST)
From: Sir Ace <chandler@nateng.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Kernel compile errors...
In-Reply-To: <Pine.LNX.4.33.0301281618020.235-100000@jordan.eng.nateng.com>
Message-ID: <Pine.LNX.4.33.0301281621440.235-100000@jordan.eng.nateng.com>
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

Oops this was on the make dep, sorry.

On Tue, 28 Jan 2003, Sir Ace wrote:

>
> I got these compiling the 2.4.20-pa23 tree:
>
> via-pmu.c:36:22: asm/prom.h: No such file or directory
> via-pmu.c:41:26: asm/sections.h: No such file or directory
> via-pmu.c:44:30: asm/pmac_feature.h: No such file or directory
> via-pmu.c:47:26: asm/sections.h: Success
> via-pmu.c:48:26: asm/cputable.h: No such file or directory
> via-pmu.c:49:22: asm/time.h: No such file or directory
>
> It didn't halt the compile but I did see it go by.
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
