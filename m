Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from moutvdom.kundenserver.de (moutvdom.kundenserver.de [195.20.224.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id F1FAD4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Sep 2002 18:24:01 -0600 (MDT)
From: "Tobias Giesen" <tobias_subscriber@tgtools.com>
To: "'Helge Deller'" <deller@gmx.de>,
	"'B. Douglas Hilton'" <bdhilton@charter.net>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Re: [PATCH] Voodoo framebuffer on PARISC
Date: Mon, 16 Sep 2002 02:17:54 +0200
Message-ID: <000001c25d16$80be8b30$0100a8c0@PLUTO>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <200209151031.16912.deller@gmx.de>
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

Hello,

I think I need some more help with this. Here's what I did:

- grabbed fresh 2.4.19-pa17 sources
- applied sstfb.c and .h patch
- set kernel options to include sst1
- compiled & installed new kernel

The new kernel seems to try to activate a Voodoo console shortly after
the "If this is the last message you see ..." warning. However, my
monitor says the frequencies are out of range and switches itself off.
The main sti console is then dead also.

Any ideas? Maybe could I try a precompiled kernel with Voodoo support?

Thanks.

Best wishes,
Tobias Giesen
