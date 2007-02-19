From: Aurelien Jarno <aurelien@aurel32.net>
Subject: [parisc-linux] Re: NPTL for hppa-linux is not backwards compatible
	with Linuxthreads.
Date: Mon, 19 Feb 2007 17:05:10 +0100
Message-ID: <45D9CAB6.1010406__15332.6850188479$1416624303$gmane$org@aurel32.net>
References: <119aab440702181143h682c78d9ra0d765b06e08a594@mail.gmail.com>	
	<200702182027.00027.vapier@gentoo.org>	
	<5b2e36650702190532u680731e4j71fa272806343b17@mail.gmail.com>	
	<45D9C1AC.9000501@aurel32.net>
	<5b2e36650702190748j1d9306e6mdbc6dc8ed210c4ab@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8
Cc: matthias.klose@ubuntu.com,
 libc-ports@sourceware.org,
 Roland McGrath <roland@redhat.com>,
 debian-glibc@lists.debian.org,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Jeff Bailey <jbailey@raspberryginger.com>
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

Jeff Bailey a écrit :
> On 19/02/07, Aurelien Jarno <aurelien@aurel32.net> wrote:
>>>> if the breakage is just in pthreads, i dont think the libc ABI needs to be
>>>> bumped, just the pthread one ?  libc provides look ahead stub functions for
>>>> pthreads, so it shouldnt be affected by the breakage you've mentioned with
>>>> static lock initializers ...
>>>>
>>>> libpthread.so.0 -> libpthread.so.1
>>> While it's definetly Ubuntu and Debian's problem, not upstream's,
>>> libpthread is bundled in the "libc6" package.  Bumping just the
>>> libpthread version will make packaging hard for those distros.  If
>>> there are other ABI breaking moves that need to be done that would
>>> cause a bump from libc6, doing them now would help sidestep the
>>> problem.
>> Well I am thinking in splitting out libpthread.so.X from the libc6
>> package if the ABI breakage is confirmed. This is still a very
>> complicated transition, but I think far less packages are affected.
> 
> Well, the ABI breakage is confirmed.  I just remember people siting
> some other corner case problems with the ABI they wanted to change.
> Now would be a great time to change it all over if we need to do this.

You mean on hppa? Do you remember the proposed changes, or the people
wanted to change that?

-- 
  .''`.  Aurelien Jarno	            | GPG: 1024D/F1BCDB73
 : :' :  Debian developer           | Electrical Engineer
 `. `'   aurel32@debian.org         | aurelien@aurel32.net
   `-    people.debian.org/~aurel32 | www.aurel32.net
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
