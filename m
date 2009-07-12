From: Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: HPPA and Squeeze
Date: Sun, 12 Jul 2009 14:30:54 +0200
Message-ID: <20090712123054.GB31207@hall.aurel32.net>
References: <20090602140734.GC26721@mx0.halon.org.uk> <20090606183600.GA425@lackof.org> <4A31FA76.20103@debian.org> <20090615173102.GC2690@lackof.org> <20090616062531.GA17957@xanadu.blop.info> <4A37EDB5.2020400@gmx.de> <20090616191317.GG25535@hall.aurel32.net> <119aab440906211555m116af57ekde6a9d75eae59a01@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Cc: Lucas Nussbaum <lucas@lucas-nussbaum.net>,
	Helge Deller <deller@gmx.de>,
	Grant Grundler <grundler@parisc-linux.org>,
	HPPA porters <debian-hppa@lists.debian.org>,
	Debian Release <debian-release@lists.debian.org>,
	linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440906211555m116af57ekde6a9d75eae59a01@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jun 21, 2009 at 06:55:21PM -0400, Carlos O'Donell wrote:
> On Tue, Jun 16, 2009 at 3:13 PM, Aurelien Jarno<aurelien@aurel32.net> wrote:
> > On Tue, Jun 16, 2009 at 09:08:37PM +0200, Helge Deller wrote:
> >> On 06/16/2009 08:25 AM, Lucas Nussbaum wrote:
> >>> On 15/06/09 at 11:31 -0600, Grant Grundler wrote:
> >>> PS: if you want an HPPA-specific issue to play with,
> >>> http://experimental.debian.net/fetch.php?&pkg=ruby1.9&ver=1.9.0.1-5&arch=hppa&stamp=1213563978&file=log&as=raw
> >>> might be a good candidate.
> >>
> >> In reality it's not (any longer) a hppa specific bug. It's a bug in ruby.
> >> Ruby just relies on NPTL specific behaviour of threads and as such plays mad on LinuxThreads, which we still have active on hppa.
> >> The good thing is, that the NPTL switch-over was started by Carlos, so I expect that this should be fixed when NPTL hits unstable...
> >>
> >
> > BTW, Carlos, could you please send me the latest version of your
> > patches, so that we can actually do the switch with version 2.10?
> >
> 
> The latest patches are now up.
> 
> Core glibc patch:
> http://www.parisc-linux.org/~carlos/2009-06-20-glibc-hppa-nptl.diff
> 
> Ports glibc patch:
> http://www.parisc-linux.org/~carlos/2009-06-20-glibc-ports-hppa-nptl.diff
> 
> No regressions in the testsuite for hppa-linux-gnu.
> 

I have just included these patches in the eglibc-2.10 branch of our SVN,
though currently the linuxthreads version is still built by default.

I got the following regressions in the NPTL build compared to the 
linuxthreads build:
| Encountered regressions that don't match expected failures:
| tst-cancelx20.out, Error 1
| tst-cancelx21.out, Error 1
| tst-cancelx4.out, Error 1
| tst-cancelx5.out, Error 1
| tst-cleanupx4.out, Error 1
| tst-cputimer1.out, Error 1
| tst-cputimer2.out, Error 1
| tst-cputimer3.out, Error 1
| tst-mqueue3.out, Error 1
| tststatic2.out, Error 1
| tststatic.out, Error 1
| tst-timer4.out, Error 1
| tst-timer5.out, Error 1
| tst-tls9-static.out, Error 1

Is it something expected?

-- 
Aurelien Jarno	                        GPG: 1024D/F1BCDB73
aurelien@aurel32.net                 http://www.aurel32.net
