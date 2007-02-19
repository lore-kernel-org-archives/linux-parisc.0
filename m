From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: [parisc-linux] Re: NPTL for hppa-linux is not backwards compatible
	with Linuxthreads.
Date: Mon, 19 Feb 2007 08:32:15 -0500
Message-ID: <5b2e36650702190532u680731e4j71fa272806343b17__43929.2823001326$1416624302$gmane$org@mail.gmail.com>
References: <119aab440702181143h682c78d9ra0d765b06e08a594@mail.gmail.com>
	<200702182027.00027.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: debian-glibc@lists.debian.org,
 Aurelien Jarno <aurel32@debian.org>,
 Roland McGrath <roland@redhat.com>,
 libc-ports@sourceware.org,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Mike Frysinger" <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200702182027.00027.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 18/02/07, Mike Frysinger <vapier@gentoo.org> wrote:
> if the breakage is just in pthreads, i dont think the libc ABI needs to be
> bumped, just the pthread one ?  libc provides look ahead stub functions for
> pthreads, so it shouldnt be affected by the breakage you've mentioned with
> static lock initializers ...
>
> libpthread.so.0 -> libpthread.so.1

While it's definetly Ubuntu and Debian's problem, not upstream's,
libpthread is bundled in the "libc6" package.  Bumping just the
libpthread version will make packaging hard for those distros.  If
there are other ABI breaking moves that need to be done that would
cause a bump from libc6, doing them now would help sidestep the
problem.

Tks.

-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
