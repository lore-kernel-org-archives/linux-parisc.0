Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id D9FAB482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  2 Oct 2001 11:36:03 -0600 (MDT)
Message-Id: <200110021733.LAA07820@puffin.external.hp.com>
To: "Bryan W. Headley" <bheadley@interaccess.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: Message from "Bryan W. Headley" <bheadley@interaccess.com>
   of "Tue, 02 Oct 2001 09:50:59 CDT." <3BB9D453.3050308@interaccess.com>
Date: Tue, 02 Oct 2001 11:33:05 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
Subject: [parisc-linux] Re: C110 question
List-ID: <linux-parisc.vger.kernel.org>

Bryan,
In general, questions like this will get better answers from
the parisc-linux mailing list - see http://lists.parisc-linux.org/.

I'll take a first whack at it though.

"Bryan W. Headley" wrote:
> Grant,
> 
>                 Am still having issues getting my poor C110 to boot up. 
> Doesn't read the   boot CDROM worth a darn even after I "palo" the iso 
> image -- which is probably not necessary, but what the hey?

The ISO image you downloaded has palo in it. Running palo with the
ISO image is either going to fail (best case, do no harm) or trash
the ISO image (worst case). I would guess the latter.
Make sure the md5sum output for the ISO image matches what's posted
on the website you got the ISO from.

> When I rboot 
> the lifimage, it doesn't seem willing to send the console to the serial 
> port nor is it willing to put stuff on the console, either.

When booting, answer Y to "interact with IPL" question with yes.
You have "manually" boot from the PDC prompt (aka BOOT_ADMIN prompt)
in order to get that question.

Then you can verify "console=ttyS0" parameter is set.
Disconnecting the keyboard should force the console output
to the serial port.

Oh - and several workstations may have issues with serial port numbering.
Ie what's labeled port A on the back may be seen as ttyS1 by parisc-linux.
Some of that has been fixed with newer kernels.
You would need to build a newer kernel and boot it via bootp.
This isn't as simple as it sounds...perhaps wait until a new
ISO is published.

> Anyway, it tries to boot (silently) and does things with the hard disks 
> (I know not what), but...
> 
> The drives are hanging off of a FWSCSI controller. I'm right in thinking 
> that the support for that is still not there, right?

In general the SCSI driver for Zalon works. The problem is with
IO MMU support for devices below anything other than the first IO MMU.

> I'm wondering if I 
> should go through the old Mach4 source and try to glom over the FW 
> support... Whose toes do I step on if I try to do that; who should I 
> handshake with?

I dunno. I've only looked at the mach sources once for 712 stuff.

> If you know a good "secret handshake" command to give at the iplboot to 
> make the kernel send it's console messages to to STI or ttyS0, that'd be 
> appreciated.

It's not secret - search for "console=" in the mail archives.


> Oh, and I upped the puppy to 256 Mb, but I doubt that confuses it too 
> much (eek! The memory map is not floating to the "last 32K" or 
> something, is it?)

no. 256MB isn't that much at all. I'm running 2GB in my c3k
and once had as much as 4GB in the c3k.

> I get this puppy up, I get to bring up the 735/99, and then figure out 
> what HP means, we can use STI to be the basis of the X driver...

XF86 is mostly working for B180 and 712's from reports on p-l mailing list.
If you have Vis-EG (normal built-in) graphics, it might work for
C110 as well since it's not using IO MMU (afaik).

grant
