Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc3-hems4-0-cust183.bre.cable.ntl.com [213.107.179.183])
	by dsl2.external.hp.com (Postfix) with ESMTP id 700A9482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Oct 2001 10:30:49 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 18E86B00C; Tue, 23 Oct 2001 17:30:25 +0100 (BST)
Date: Tue, 23 Oct 2001 17:30:25 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: "Griffin, Aubrey, BMCIO" <aubreygriffin@att.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] X window refresh problem
Message-ID: <20011023173025.K11105@linuxcare.com>
References: <5360C45FAB301541AEB3C6A45A6B6A02706831@ocst09.ugd.att.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5360C45FAB301541AEB3C6A45A6B6A02706831@ocst09.ugd.att.com>; from aubreygriffin@att.com on Tue, Oct 23, 2001 at 10:13:00AM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Oct 23, 2001 at 10:13:00AM -0400, Griffin, Aubrey, BMCIO wrote:
> Hello all,
> 
> Well, I decided to ditch HPUX 10.20 for Linux. I have installed the kernel
> from the ISO image onto a 712/60.
> 
> I have installed X on it. Every is fine until the screen goes black. Once
> this happens, the colors are messed up and it is unusable. I believe that is
> the same problem as the blue is white that was talked on the mailing list.
> This problem was corrected with a new kernel.
> 
> The kernel that I am running is 2.4.0-pa22. How do I upgrade the kernel?

grab ftp://ftp.parisc-linux.org/unofficial-debs/kernel-image-2.4.9-32_011017.pa59_hppa.deb

and dpkg -i kernel-image-2.4.9-32_011017.pa59_hppa.deb

I think you are advised to upgrade the rest of your system first, if
you havn't done so recently (apt-get update; apt-get upgrade).

Richard
