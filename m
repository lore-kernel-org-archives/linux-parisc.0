Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id D7CA84829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 23 Sep 2002 14:19:46 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: Steve Pacenka <spacenka@lightlink.com>
Subject: Re: [parisc-linux] RTC and FB on 735/125
Date: Mon, 23 Sep 2002 22:18:08 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <03ab01c26266$2416dea0$1f96078d@acid> <003001c26327$d0db42e0$1f96078d@acid> <1032806776.2868.19.camel@romano>
In-Reply-To: <1032806776.2868.19.camel@romano>
MIME-Version: 1.0
Message-Id: <200209232217.45577.deller@gmx.de>
Content-Type: text/plain;
  charset="iso-8859-1"
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

On Monday 23 September 2002 20:46, Steve Pacenka wrote:
> The CRX24 framebuffer also works at 8 bit color, a bit faster.  A minor
> patch to one file in the kernel is needed (duplicating a few lines that
> apply to another card's depth selection in the same file) and a kernel
> boot argument is needed to (optionally) cause the kernel to start video
> in 8 bit mode instead of the default 32.
>
> The hard drive I patched this on is recycled into another type of box,
> but Helge Deller can guess what's needed just from this description.

Hi Steve,

I don't have a CRX24 and can't test anything. 
If you could post a patch here I could add it to the kernel.

Greetings,
Helge
