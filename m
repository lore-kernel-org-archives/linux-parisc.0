From: "Joel Soete" <soete.joel@tiscali.be>
Subject: RE: [parisc-linux] (Round 2) hppa glibc 2.3.2-9 available for the brave testers (Round 2)!
Date: Tue, 21 Oct 2003 12:29:38 +0200
Message-ID: <3F8A272E00004E58__42903.951512608$1416622897$gmane$org@ocpmta3.freegates.net>
References: <20031020233625.GB5606@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: debian-hppa@lists.debian.org
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20031020233625.GB5606@systemhalted>
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

I test it on my b180 running a k-2.4-23-pre7-pa12 (hosting a basic iptable
fw and a squid proxy and it works fine now).

Thanks alot for this great job,
    Joel

>-- Original Message --
>From: Carlos O'Donell <carlos@baldric.uwo.ca>
>To: parisc-linux@lists.parisc-linux.org
>Cc: debian-hppa@lists.debian.org
>Date: Mon, 20 Oct 2003 19:36:25 -0400
>Subject: [parisc-linux] (Round 2) hppa glibc 2.3.2-9 available for the brave
>testers (Round 2)!
>
>
>debian-hppa, 
parisc-linux,

New testing deb's can be found at:

ftp://ftp.parisc-linux.org/unofficial-debs/glibc_2.3.2-9_2003-10-20/

They fix the following problems encountered by testers:

- Six argument cancellable syscalls don't crash you
> program anymore.
- Calling feraiseexcept with FE_INEXACT raises the correct exception and
  flag bits.

Cheers,
Carlos.

On Fri, Oct 17, 2003 at 02:09:12PM -0400, Carlos O'Donell wrote:
> --- CALLING ALL TESTERS! ---
> 
> glibc 2.3.2 is comp
>ete for HPPA. We've gotten rid of the following
> long standing test-suite errors (bug-iconv3, and test-fenv).
> 
> The regressions in 2.3.2 were caused by incorrect handling of the PIC
> register by the kernel, but fixed in glibc. Most cases for o
>r stack
> were handled incorrectly (stack grows up cases), but are fixed in this
> release.
> 
> ftp://ftp.parisc-linux.org/unofficial-debs/glibc_2.3.2-9_2003-10-16/
> 
> Download all the debs and install with:
> 
> dpkg -i libc6_*.deb
> (Foll
>wed by dpkg -i of the rest in any order, libc6 must install first) 
> 
> Please do this only if you consider yourself a well seasoned linux-type
> person. If that dpkg install fails for any reason you might be in
> trouble. I'm running these debs o
> all my boxes, and I've tested in a
> chroot, rebuilt our toolchain, and ran lmbench, gnome-session, nautilus,
> and abi-word.
> 
> http://www.baldric.uwo.ca/~carlos/a500-gnome-abiword.png
> 
> Thanks go out to everyone for all the moral support 
>nd fun! 
> 
> --- TEST IT AND REPORT BACK ... PLEASE! :) ---
> 
> == DISCLAIMER ===
> I do not guarantee that these debs won't cause your computer to explode
> like a pineapple grenade, showering shrapnel and fiery death on all your
> loved ones
>
> == DISCLAIMER ===

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux



-------------------------------------------------------------------------
Tiscali ADSL: 3 mois GRATUITS! L'Internet rapide, c'est pour tout le monde.

http://reg.tiscali.be/default.asp?lg=fr
