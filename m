Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (f21.law4.hotmail.com [216.33.149.21])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0BD4C482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Oct 2001 00:22:44 -0600 (MDT)
From: "Kenneth Westelinck" <kennywest1@hotmail.com>
To: rhirst@linuxcare.com, aubreygriffin@att.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] X window refresh problem
Date: Wed, 24 Oct 2001 06:22:42 +0000
Mime-Version: 1.0
Content-Type: text/plain; format=flowed
Message-ID: <F21AWmVXViK9NaKNaS500013821@hotmail.com>
List-ID: <linux-parisc.vger.kernel.org>

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
>ftp://ftp.parisc-linux.org/unofficial-debs/kernel-image-2.4.9-32_011017.pa59_hppa.deb
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
