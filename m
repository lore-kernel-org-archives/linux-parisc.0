Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from snipe.mail.pas.earthlink.net (snipe.mail.pas.earthlink.net [207.217.120.62])
	by dsl2.external.hp.com (Postfix) with ESMTP id 29566482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Jan 2003 18:04:15 -0700 (MST)
Message-ID: <3E372979.30604@earthlink.net>
Date: Tue, 28 Jan 2003 19:08:09 -0600
From: "Bryan W. Headley" <bwheadley@earthlink.net>
MIME-Version: 1.0
To: Sir Ace <chandler@nateng.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel compile errors...
References: <Pine.LNX.4.33.0301281618020.235-100000@jordan.eng.nateng.com>
In-Reply-To: <Pine.LNX.4.33.0301281618020.235-100000@jordan.eng.nateng.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Sir Ace wrote:
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

Makes sense. That's a driver for the powerPC/mac adb bus. How you have 
it selected I won't guess at..


-- 
____               .:.                 ____
Bryan W. Headley - bwheadley@earthlink.net
