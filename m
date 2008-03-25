From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [alpha, hppa] GCC-4.3 as the default compilers for lenny?
Date: Tue, 25 Mar 2008 18:42:44 -0400
Message-ID: <119aab440803251542l4d86ef9bvaf8163e940e1ab35@mail.gmail.com>
References: <18405.27903.317733.531002@gargle.gargle.HOWL>
	 <119aab440803221402w2bfe5a7le9499e4eb6e0e3c1@mail.gmail.com>
	 <47E583EA.7000006@aurel32.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "Matthias Klose" <doko@cs.tu-berlin.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org,
	debian-release@lists.debian.org
To: "Aurelien Jarno" <aurelien@aurel32.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <47E583EA.7000006@aurel32.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Mar 22, 2008 at 6:10 PM, Aurelien Jarno <aurelien@aurel32.net> wrote:
>  I have tried to build the glibc with GCC 4.3 on hppa, and rpcgen
>  segfaults when it is used, so the build fails. I haven't start to
>  investigate the problem (I started by the architectures where the
>  problems were minor).

I switched from gcc-4_2-branch to gcc-4_3-branch and I see the loader
gets a SIGTRAP, not a SIGSEGV. I'll try to debug this.

Cheers,
Carlos.
