Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id EAA09625
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Oct 1999 04:24:26 -0600
Received: from spacetec.no (metis.spacetec.no [192.51.5.180])
	by spacetec.no (8.9.1a/8.9.1) with ESMTP id MAA06705
	for <parisc-linux@thepuffingroup.com>; Thu, 21 Oct 1999 12:25:15 +0200
Sender: magne@spacetec.no
Message-ID: <380EEA0B.F5E469DB@spacetec.no>
Date: Thu, 21 Oct 1999 12:25:15 +0200
From: Magne =?iso-8859-1?Q?=D8stlyngen?= <magne@spacetec.no>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] So you wanna get to a prompt, eh?
References: <Pine.LNX.4.10.9910191607110.10378-100000@localhost.localdomain>
Content-Type: text/plain; charset=iso-8859-1
List-ID: <linux-parisc.vger.kernel.org>

> I've spent most of the afternoon working on the patches sent in by Thomas
> Bogendoerfer, and have extended them to get the kernel working and to a
> functional sash prompt.

> And for those you out there who are interested in helping us test the
> kernel, I've also posted a functional kernel image, for you try. You can
> find it at:

> And not wanted to leave much as an excercise for the reader, I've also
> posted the ramdisk that I used, which has been extended to include
> /dev/console, etc.

Is the ramdisk included in the kernel-image? When I boot the kernel,
I get 'no ramdisk'.

Of course, I don't get further than 'Transferring control to kernel'..
:(
I thought I had a 715, but no, it was a 710 (Bushmaster), and that seems
to make a big difference.

Is anyone working on support for the 700?  I could do some work there,
if it was possible to compile the kernel on linux.  Is anything being
done on that? (What was the problem?)

The Image-990705 kernel worked. What changed from that to Image-990929?

-- 
Magne Østlyngen <magne@spacetec.no>
                <magne@skybert.org>
