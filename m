Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from kcmso1.proxy.att.com (kcmso1.att.com [192.128.133.69])
	by dsl2.external.hp.com (Postfix) with ESMTP id 741B8482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Oct 2001 10:52:22 -0600 (MDT)
Message-ID: <5360C45FAB301541AEB3C6A45A6B6A02706832@ocst09.ugd.att.com>
From: "Griffin, Aubrey, BMCIO" <aubreygriffin@att.com>
To: "'Richard Hirst'" <rhirst@linuxcare.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] X window refresh problem
Date: Tue, 23 Oct 2001 12:51:16 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Richard,

I installed that kernel already and booted from it. When I started X, it
crashed. So, I went back to my old kernel.

I have just done an apt-get update; apt-get upgrade. I'll see if it works
now.

Thanks,

Aubrey

-----Original Message-----
From: Richard Hirst [mailto:rhirst@linuxcare.com]
Sent: Tuesday, October 23, 2001 12:30 PM
To: Griffin, Aubrey, BMCIO
Cc: 'parisc-linux@lists.parisc-linux.org'
Subject: Re: [parisc-linux] X window refresh problem


On Tue, Oct 23, 2001 at 10:13:00AM -0400, Griffin, Aubrey, BMCIO wrote:
> Hello all,
> 
> Well, I decided to ditch HPUX 10.20 for Linux. I have installed the kernel
> from the ISO image onto a 712/60.
> 
> I have installed X on it. Every is fine until the screen goes black. Once
> this happens, the colors are messed up and it is unusable. I believe that
is
> the same problem as the blue is white that was talked on the mailing list.
> This problem was corrected with a new kernel.
> 
> The kernel that I am running is 2.4.0-pa22. How do I upgrade the kernel?

grab
ftp://ftp.parisc-linux.org/unofficial-debs/kernel-image-2.4.9-32_011017.pa59
_hppa.deb

and dpkg -i kernel-image-2.4.9-32_011017.pa59_hppa.deb

I think you are advised to upgrade the rest of your system first, if
you havn't done so recently (apt-get update; apt-get upgrade).

Richard
