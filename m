Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA16076
	for <parisc-linux@puffin.external.hp.com>; Mon, 28 Aug 2000 06:31:55 -0600
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 28 Aug 2000 12:31:56 -0000
Received: from dis.i.linuxcare.com (HELO vodka.thepuffingroup.com) (192.168.1.57)
  by db1.i.linuxcare.com with SMTP; 28 Aug 2000 12:31:52 -0000
Date: Mon, 28 Aug 2000 07:26:37 -0400
From: Matthew Wilcox <matthew@wil.cx>
To: Paul Bame <bame@noam.fc.hp.com>
Cc: Alan Modra <amodra@puffin.external.hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 64-bit cross compiler broken
Message-ID: <20000828072637.T29677@vodka.thepuffingroup.com>
References: <E13SRJl-0001kq-00@noam.fc.hp.com> <E13SSjR-00050l-00@noam.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E13SSjR-00050l-00@noam.fc.hp.com>; from Paul Bame on Fri, Aug 25, 2000 at 05:17:53PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Aug 25, 2000 at 05:17:53PM -0600, Paul Bame wrote:
> = 
> = The current 64-bit cross compiler dies on drivers/block/rd.c
> = 
> 
> Another 64-bit gotcha: in arch/parisc64/kernel/entry.S:start_parisc_asm
> the 'b start_parisc' is branching through a stub and failing miserably.
> Linker problem?

Wow, you're getting to start_parisc_asm?!  Neat!  You can take it out
now, just branch directly to start_parisc instead -- i only put it in
so that i knew what was being executed, rather than having to decode
what the C was doing.  That doesn't necessarily mean that there isn't
a problem, but we should be able to get further than that.

-- 
Revolutions do not require corporate support.
