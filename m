Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tentakel.fischlustig.de (pD95016E2.dip.t-dialin.net [217.80.22.226])
	by dsl2.external.hp.com (Postfix) with SMTP id 7BA04482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Sep 2001 19:25:28 -0600 (MDT)
Sender: andi@dsl2.external.hp.com
Message-ID: <3B96D0A2.81EC8688@fischlustig.de>
Date: Thu, 06 Sep 2001 03:25:55 +0200
From: Andi <andi@fischlustig.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH] harmony audio driver
References: <3B96B360.33152CC7@fischlustig.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

> The sound driver however is still broken, the only program I know that
> works 100% correctly is xmms.

I just found out that mpg123 runs and sounds perfectly now(now you should
merge the patch in ;-) )

PS: to compile mpg123 you can type make linux-ppc, it works.
