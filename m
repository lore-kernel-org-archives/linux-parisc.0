From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] waitid doesn't work on hppa?
Date: Fri, 24 Sep 2004 00:37:49 -0400
Message-ID: <200409240037.49160.vapier@gentoo.org>
References: <20040924000646.GZ22642@tausq.org>
	<20040924035552.GS27033@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040924035552.GS27033@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thursday 23 September 2004 11:55 pm, Carlos O'Donell wrote:
> I see waitid regressions in the glibc testsuite. I'm not sure if this
> had anything to do with these hanging processes. I haven't looked too
> deeply.

i know we tried a 20040916 glibc snapshot at Gentoo but had to abandon it 
because of so many problems ...

one of them is what you describe, processes running just fine but hanging just 
before exit ... but we saw that on amd64 ...
in other words, these waitpid problems are probably not arch related :)

here's what i noticed in an amd64 chroot:
- 20040808 glibc snapshot works great
- install 20040916 glibc snapshot, things work fine
- rebuild bash against 20040916 ... suddenly all child processes of the new 
bash shells hang after they've completed normal operations ... note that bash 
is the *only* app that's been recompiled against the new glibc
- install 20040808 glibc, bug persists; rebuild bash, things works fine 
again ...
-mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
