Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id D673C486E
	for <parisc-linux@lists.parisc-linux.org>; Sat, 18 Oct 2003 14:31:47 -0600 (MDT)
Message-ID: <3F91A332.9050700@tiscali.be>
Date: Sat, 18 Oct 2003 20:31:46 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] hppa glibc 2.3.2-9 available for the brave testers!
References: <20031017180912.GD27289@systemhalted>
In-Reply-To: <20031017180912.GD27289@systemhalted>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hi Carlos,

I can safely broken my raid1 Debian/unstable install and drive some test 
on a disk :) and advise you.

Joel

Carlos O'Donell wrote:
> parisc-linux,
> debian-hppa,
> 
> --- CALLING ALL TESTERS! ---
> 
> glibc 2.3.2 is complete for HPPA. We've gotten rid of the following
> long standing test-suite errors (bug-iconv3, and test-fenv).
> 
> The regressions in 2.3.2 were caused by incorrect handling of the PIC
> register by the kernel, but fixed in glibc. Most cases for our stack
> were handled incorrectly (stack grows up cases), but are fixed in this
> release.
> 
> ftp://ftp.parisc-linux.org/unofficial-debs/glibc_2.3.2-9_2003-10-16/
> 
> Download all the debs and install with:
> 
> dpkg -i libc6_*.deb
> (Followed by dpkg -i of the rest in any order, libc6 must install first) 
> 
> Please do this only if you consider yourself a well seasoned linux-type
> person. If that dpkg install fails for any reason you might be in
> trouble. I'm running these debs on all my boxes, and I've tested in a
> chroot, rebuilt our toolchain, and ran lmbench, gnome-session, nautilus,
> and abi-word.
> 
> http://www.baldric.uwo.ca/~carlos/a500-gnome-abiword.png
> 
> Thanks go out to everyone for all the moral support and fun! 
> 
> --- TEST IT AND REPORT BACK ... PLEASE! :) ---
> 
> == DISCLAIMER ===
> I do not guarantee that these debs won't cause your computer to explode
> like a pineapple grenade, showering shrapnel and fiery death on all your
> loved ones.
> == DISCLAIMER ===
> 
> c.
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
