Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA16306
	for <parisc-linux@puffin.external.hp.com>; Tue, 25 Jan 2000 12:21:49 -0700
From: willy@thepuffingroup.com
Date: Tue, 25 Jan 2000 14:22:43 -0500
To: Hannu Martikka <martikka@stybba.ntc.nokia.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715 problem
Message-ID: <20000125142243.B32390@thepuffingroup.com>
References: <Pine.LNX.4.10.10001241636160.3967-100000@grasshopper.thepuffingroup.com> <Pine.HPX.4.21.0001251927060.15648-200000@gamgee.ntc.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.HPX.4.21.0001251927060.15648-200000@gamgee.ntc.nokia.com>; from Hannu Martikka on Tue, Jan 25, 2000 at 07:38:01PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jan 25, 2000 at 07:38:01PM +0200, Hannu Martikka wrote:
> I tried the linux-2.3 latest kernel (ramdisk.bin-20000118a) from CVS with
> 715/80. I didn't get shell prompt. It seems to end up with somekind of
> endless loop.

The endless loop isn't a problem; that's `debugging the switch_to' code.
prumpf, can we get rid of this now or is it still important?  I _think_
you'll find you are actually at a prompt, it's just not obvious because
of the messages.

> I'll include the bootup messages. Hopefully someone can make something out
> of them..
> My guess would be that something goes wrong near lines:
> 	do_mmap c7efc0e0 00001000 0003f000 00000005 00001806 00000000
> 	miscoloured mmap
> or
> 	mem_map disagrees with c122b77c at 2001f000

no problem, i get those too.

> Also I wonder why it doesn't recognice the Model/CPU-type? Even the size
> of memory is incorrent (256). MHz figure is ok.
> 	model   00006190 00000481 00000000 00000000 7804f0a4 00000000 
> 00000004 00000072 00000072
> 	vers    0000000b
> 	CPUID vers 0 rev 0
> 	Model: <NULL> with 128 MB RAM.
> 	CPU(s): 1 x <unknown> at 80.000000 MHz

That code's just been commented out for the moment.  Something else for
the todo list.

[...]

> DQ0KDQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
> LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0NCkJvb3RS
> b20gVmVyc2lvbiAgICAxLjQgIA0NCk1lbW9yeSBTaXplOiAgMjU2IE1CDQ0K

many many lines like this which I can't decode.  It's tagged as text/plain;
should it be mime or something?
