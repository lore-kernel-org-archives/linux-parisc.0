From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc tls linuxthreads failure baseline.
Date: Tue, 30 May 2006 10:07:00 -0400 (EDT)
Message-ID: <200605301407.k4UE71cL014247@hiauly1.hia.nrc.ca>
References: <119aab440605291950w7f1f0022nd96fcdce3082bb44@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440605291950w7f1f0022nd96fcdce3082bb44@mail.gmail.com>
	from "Carlos O'Donell" at May 29, 2006 10:50:10 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> make[1]: *** [math/tests] Error 2
> make[2]: *** [/libc/stdlib/tst-strtod.out] Error 1
> make[2]: *** [/libc/stdlib/bug-strtod.out] Error 1
> 
> Usual long-double problem.

I thought we had agreed to treat long doubles as doubles...

Debian has had a one-line glibc patch installed for some time to
fix this and GCC has always treated long doubles as doubles on linux.
I don't understand why you persist in leaving this bug in the upstream
source.

HP isn't going to release their ieee library and I had to disable using
it with Ada on hpux because of bugs.  That only leaves the double-double
extended format used by powerpc and mips.  Even if we decide to change
the ABI again and add this support, this is a separate issue as far as
I can tell.

> make[1]: *** [stdlib/tests] Error 2
> make[2]: [/libc/posix/annexc.out] Error 1 (ignored)
> make[2]: *** [/libc/crypt/cert.out] Error 139
> 
> GCC optimizer bug.

Is there a PR?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
