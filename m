Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from almso1.proxy.att.com (almso1.att.com [192.128.167.69])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3B815482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Oct 2001 09:42:46 -0600 (MDT)
Message-ID: <5360C45FAB301541AEB3C6A45A6B6A02706836@ocst09.ugd.att.com>
From: "Griffin, Aubrey, BMCIO" <aubreygriffin@att.com>
To: "'Kenneth Westelinck'" <kennywest1@hotmail.com>,
	rhirst@linuxcare.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] X window refresh problem
Date: Wed, 24 Oct 2001 11:41:55 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

My X windows problems have been cleared up.

I not sure what exactly made things work. apt-get update and apt-upgrade
might have done it since new versions of X among other things were
installed.

Changing back to 2.4.9-32-pa59 before doing this, of course.

PS: A side note on my failure to get a updated kernel. I didn't post this
earlier because I hate to write long-winded messages.

I did pull down the kernel source, linux-20011015.tar.gz and compile it over
the weekend. The resultant kernel, vmlinux, failed to boot on by box,
something about VFS: can't  mount root filesystem.

I must have missed some steps in the compilation process. These things are
not exactly clear to me. It might be middle-age or something. But, that is
another message thread which I may or may not start shortly.

Anyway, I learned how to use palo at the boot prompt to boot an old kernel.
So, it wasn't a total waste.

Previously, I had install the kernel debian package. That also failed to
work for me. But, I didn't know all the steps. I think that I understand
know. 

I browsed through the Debian package list and have not seen a kernel-image
package for HPPA. At least, there was no package name that I recognized as a
kernel image that was newer than mine.

So, I finally put my technical pride into my pocket and emailed the list for
help and the answers came in.

Thanks to everyone that helped,
Aubrey

-----Original Message-----
From: Kenneth Westelinck [mailto:kennywest1@hotmail.com]
Sent: Wednesday, October 24, 2001 2:23 AM
To: rhirst@linuxcare.com; Griffin, Aubrey, BMCIO
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] X window refresh problem


Or you can grab your kernel from parisc-linux.org and compile him yourself. 
This solved the refresh problem for me ;-)

enjoy life, enjoy linux,

Kenneth



>From: Richard Hirst <rhirst@linuxcare.com>
>To: "Griffin, Aubrey, BMCIO" <aubreygriffin@att.com>
>CC: "'parisc-linux@lists.parisc-linux.org'" 
><parisc-linux@lists.parisc-linux.org>
>Subject: Re: [parisc-linux] X window refresh problem
>Date: Tue, 23 Oct 2001 17:30:25 +0100
>
>On Tue, Oct 23, 2001 at 10:13:00AM -0400, Griffin, Aubrey, BMCIO wrote:
> > Hello all,
> >
> > Well, I decided to ditch HPUX 10.20 for Linux. I have installed the 
>kernel
> > from the ISO image onto a 712/60.
> >
> > I have installed X on it. Every is fine until the screen goes black. 
>Once
> > this happens, the colors are messed up and it is unusable. I believe 
>that is
> > the same problem as the blue is white that was talked on the mailing 
>list.
> > This problem was corrected with a new kernel.
> >
> > The kernel that I am running is 2.4.0-pa22. How do I upgrade the kernel?
>
>grab 
>ftp://ftp.parisc-linux.org/unofficial-debs/kernel-image-2.4.9-32_011017.pa5
9_hppa.deb
>
>and dpkg -i kernel-image-2.4.9-32_011017.pa59_hppa.deb
>
>I think you are advised to upgrade the rest of your system first, if
>you havn't done so recently (apt-get update; apt-get upgrade).
>
>Richard
>
>
>
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux


_________________________________________________________________
Get your FREE download of MSN Explorer at http://explorer.msn.com/intl.asp



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
