Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (pop.gmx.net [194.221.183.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 995B0482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 10 Jun 2001 13:54:39 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Apollo 735/99 hangs after booting from CDROM
Date: Sun, 10 Jun 2001 21:54:26 +0200
References: <20010608155249.T16532@linuxcare.com> <01060810451304.00472@wolf01.my.home> <20010610134130.A16532@linuxcare.com>
In-Reply-To: <20010610134130.A16532@linuxcare.com>
MIME-Version: 1.0
Message-Id: <20010610195439.995B0482A@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> As an example, CONFIG_FB_STI doesn't work on my B180, but CONFIG_STI_CONSOLE
> does.  I believe both work on 712.

Just for the record: afaik CONFIG_FB_STI only works on newer 715's (715/64, 
715/80, 715/100) machines, but you should be able to safely enable both 
CONFIG_xxx's and will get framebuffer support if available.

Helge
