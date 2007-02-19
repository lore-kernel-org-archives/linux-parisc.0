From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Re: NPTL for hppa-linux is not backwards
	compatible with Linuxthreads.
Date: Mon, 19 Feb 2007 18:57:07 +0100
Message-ID: <200702191857.07559.deller__40049.8874871575$1416624305$gmane$org@gmx.de>
References: <119aab440702181143h682c78d9ra0d765b06e08a594@mail.gmail.com>
	<45D9C1AC.9000501@aurel32.net>
	<5b2e36650702190748j1d9306e6mdbc6dc8ed210c4ab@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Cc: matthias.klose@ubuntu.com,
 debian-glibc@lists.debian.org,
 Aurelien Jarno <aurel32@debian.org>,
 Roland McGrath <roland@redhat.com>,
 libc-ports@sourceware.org
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <5b2e36650702190748j1d9306e6mdbc6dc8ed210c4ab@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Monday 19 February 2007, Jeff Bailey wrote:
> On 19/02/07, Aurelien Jarno <aurelien@aurel32.net> wrote:
> > >> if the breakage is just in pthreads, i dont think the libc ABI needs to be
> > >> bumped, just the pthread one ?  libc provides look ahead stub functions for
> > >> pthreads, so it shouldnt be affected by the breakage you've mentioned with
> > >> static lock initializers ...
> > >>
> > >> libpthread.so.0 -> libpthread.so.1
> > >
> > > While it's definetly Ubuntu and Debian's problem, not upstream's,
> > > libpthread is bundled in the "libc6" package.  Bumping just the
> > > libpthread version will make packaging hard for those distros.  If
> > > there are other ABI breaking moves that need to be done that would
> > > cause a bump from libc6, doing them now would help sidestep the
> > > problem.
> >
> > Well I am thinking in splitting out libpthread.so.X from the libc6
> > package if the ABI breakage is confirmed. This is still a very
> > complicated transition, but I think far less packages are affected.
> 
> Well, the ABI breakage is confirmed.  I just remember people siting
> some other corner case problems with the ABI they wanted to change.
> Now would be a great time to change it all over if we need to do this.

Maybe relevant:

- [parisc-linux] [PATCH] fix up our compat semaphore operations
   http://lists.parisc-linux.org/pipermail/parisc-linux/2007-January/031125.html
- [parisc-linux] 64-bit long double support.
   http://lists.parisc-linux.org/pipermail/parisc-linux/2006-November/030629.html
- [parisc-linux] [patch] Remove magic constant from gas/tc-hppa.c   Jeff Bailey
   http://lists.parisc-linux.org/pipermail/parisc-linux/2006-October/030417.html
- [parisc-linux] Re: Looking at vfprintf.c and alloca.
   http://lists.parisc-linux.org/pipermail/parisc-linux/2006-July/029607.html 
   (make possible to get ELF64 later?)
- [parisc-linux] Close to mainline for hppa-linux TLS.
   http://lists.parisc-linux.org/pipermail/parisc-linux/2006-May/029171.html
- [parisc-linux] [RFC] using 64bit wide registers with 32bit kernel
   http://lists.parisc-linux.org/pipermail/parisc-linux/2006-May/029050.html
- Bug#364231: [parisc-linux] Re: Bug#364231: exception catching
   http://lists.parisc-linux.org/pipermail/parisc-linux/2006-May/028953.html
   (passing complex types)
- [parisc-linux] ELF ABI Documents
   http://lists.parisc-linux.org/pipermail/parisc-linux/2006-April/028803.html
   (ELF64 ABI?)
   
 
> > I am a bit busy right now, but I think we should put our transition
> > ideas (at least for Debian, and probably Ubuntu) on a wiki, for example
> > http://wiki.debian.org/HppaNptlTransition
> 
> Sounds good.  I've added doko to the cc: list.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
