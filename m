Return-Path: <ajwalker@broadpark.no>
Received: from mail.broadpark.no (mail.broadpark.no [217.13.4.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0A2A948A0
	for <parisc-linux@parisc-linux.org>;
	Mon, 12 Apr 2004 11:07:56 -0600 (MDT)
Message-ID: <52525.127.0.0.1.1081790295.squirrel@www.puszczka.com>
In-Reply-To: <1081782948.2234.26.camel@mulgrave>
References: <20040411165459.GB11699@kitenet.net><20040411171831.GA15032@mcmartin.ca><20040411174629.GA12562@kitenet.net><20040412111257.GS20209@linuxcare.com><1081779569.1804.11.camel@mulgrave>
	<20040412150556.GT20209@linuxcare.com>
	<1081782948.2234.26.camel@mulgrave>
Date: Mon, 12 Apr 2004 19:18:15 +0200 (CEST)
Subject: Re: [parisc-linux] Re: if something is not done,
	hppa will not havean installer for sarge
From: "Andy Walker" <ajwalker@broadpark.no>
To: "James Bottomley" <James.Bottomley@steeleye.com>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Cc: Kyle McMartin <kyle@mcmartin.ca>, debian-boot@lists.debian.org,
	debian-hppa@lists.debian.org, Richard Hirst <rhirst@linuxcare.com>,
	parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> On Mon, 2004-04-12 at 10:05, Richard Hirst wrote:
>> Unbootable, or unbootable on 64 bit h/w?
>
> It seems to be unbootable entirely, but for 32 bit kernels that's random
> (sometimes it will, sometimes it won't).
>
>> > Unfortunately, palo is rather poor about checking this limit when
>> > installing the image or modifying the command line...
>>
>> and last time I tried building palo on a sid system to investigate
>> these hangs on boot, the result didn't work at all :(
>
> I think just reducing the command line would be the best option.  Why's
> it so long?
>
> James

Well, palo adds a whole bunch of stuff to the command line automatically.
If, for example, your /boot directory is on the root partition and you're
testing a kernel called vmlinux-2.6.5-rc1-pa5, then you get at least:

kernel=0/boot/vmlinux-2.6.5-rc1-pa5
root=/dev/sda1
console=tty0
sti=8/24
palo_kernel=0/boot/vmlinux-2.6.5-rc1-pa5

In fact I think there is more (the B132L is offline right now and
the C180 is boostrapping Gentoo so I can't check). Then you only
need to add another parameter, like the very reasonable:

stifb=bpp:32

and you're screwed. Been there, done that!

-Andy
