Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id CAA29598
	for <parisc-linux@puffin.external.hp.com>; Sun, 24 Oct 1999 02:42:12 -0600
Date: Sun, 24 Oct 1999 10:43:09 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Justin Hamilton <JHamilton@Earthling.Net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Trying to boot on an N-Class
Message-ID: <19991024104309.A31105@suse.de>
References: <199910221606.JAA00597@milano.cup.hp.com> <NDBBKIEANAMHBNPAILKPKEBECEAA.JHamilton@Earthling.Net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <NDBBKIEANAMHBNPAILKPKEBECEAA.JHamilton@Earthling.Net>; from Justin Hamilton on Sat, Oct 23, 1999 at 11:44:00PM -0400
List-ID: <linux-parisc.vger.kernel.org>

> exec_tfile: 0003A000
> exec_tsize: 00079008
> exec_tmem : C0010000
> Code at 0x00010000, size=0x00079008
> Data at 0x0008A000, size=0x0007F000
> BSS  at 0x00109000.
> 
> Transferring control to kernel. (At entry point 0x00010000)
> 
> And this is where it sits.

This looks like it is the same PA 2.0 PDC problem we see on the C class.
Could you try againg after we fixed it ?  (Don't expect the kernel to do
too much with your hardware in the near future, but at least you might
be able to get to a shell prompt).

	Philipp Rumpf
