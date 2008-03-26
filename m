From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [alpha, hppa] GCC-4.3 as the default compilers for lenny?
Date: Wed, 26 Mar 2008 10:20:35 -0600
Message-ID: <20080326162035.GB24944@colo.lackof.org>
References: <18405.27903.317733.531002@gargle.gargle.HOWL> <119aab440803221402w2bfe5a7le9499e4eb6e0e3c1@mail.gmail.com> <47E583EA.7000006@aurel32.net> <119aab440803251542l4d86ef9bvaf8163e940e1ab35@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Matthias Klose <doko@cs.tu-berlin.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org,
	debian-release@lists.debian.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440803251542l4d86ef9bvaf8163e940e1ab35@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Mar 25, 2008 at 06:42:44PM -0400, Carlos O'Donell wrote:
> On Sat, Mar 22, 2008 at 6:10 PM, Aurelien Jarno <aurelien@aurel32.net> wrote:
> >  I have tried to build the glibc with GCC 4.3 on hppa, and rpcgen
> >  segfaults when it is used, so the build fails. I haven't start to
> >  investigate the problem (I started by the architectures where the
> >  problems were minor).
> 
> I switched from gcc-4_2-branch to gcc-4_3-branch and I see the loader
> gets a SIGTRAP, not a SIGSEGV. I'll try to debug this.


Another gcc problem report:

That past weekend I built the latest parisc-2.6-25-rc6 kernel from
Kyle's tree using gcc-4.1, gcc-4.2, and gcc-4.3. All three kernels
booted but the networking only worked for gcc-4.1 kernel.

When sending ICMP (ping) messages, the "ifconfig eth0" output on the
parisc machine was reporting RX and TX packets at the expected rate
(1 per second).  But the source host (omnibook 500 laptop) only rarely
saw the ICMP reply. Maybe 1 out of 30 or 50 ICMP.  My guess is the
IP layer is racing with DMA and the packet is mangled in some subtle way.
Both gcc-4.2 and gcc-4.3 showed the same symptom.

I just realized it's possible the 100BT switch is dropping the packets.
I'll try to capture a tcpdump from the omnibook 500 side using a
crossover cable tonight or tomorrow since without that, I don't see
how this can be debugged.

thanks,
grant
