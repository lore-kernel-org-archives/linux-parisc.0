Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2FA73482B
	for <parisc-linux@parisc-linux.org>; Tue, 30 Apr 2002 00:17:19 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id ptizmaaa for parisc-linux@parisc-linux.org; Mon, 29 Apr 2002 23:15:56 -0700
Date: Mon, 29 Apr 2002 23:21:37 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20020430062137.GF30370@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] wishlist projects, looking for volunteers
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

Hi all,

Just thought I'd post a list of some interesting (IMHO) user-space
projects for parisc-linux.  Feel free to volunteer on anything you
find interesting :-) many of these are good ways to learn things about
an OS/architecture that you don't usually have a chance to do so on more
established platforms. Plus there are lots of people (on this list) who
are willing to answer questions :-)

binutils related
- for hppa64-linux binutils, the linker is always putting dynamic
  sections into the resulting binary, even though they are not always
  needed. there is a sketch of how to fix this at 
http://lists.parisc-linux.org/pipermail/parisc-linux/2002-April/016049.html
- hppa's gas can only be compiled as 32-bit only or 64-bit only. it
  would be nice to make it so that it can be compiled to do both (mode
  chosen using a command line switch). this is how sparc handles mixed
  32-bit/64-bit environments

gdb related
- gdb doesn't work very well on hppa, single stepping with step/next
  often does not work (looks like it can't find the stopping point for
  the next statement). needs to be investigated and fixed
- gdb doesn't recognize the dwarf debug info that you get with
  gcc-3.1/gcc-3.2. needs to be enhanced (i think Dave might have already
  done some work in this area)
- we are also in need of a hppa gdb maintainer. anyone interested? :-)

gcc related
- The debian gcc package currently does not build 64-bit compilers. this
  shouldn't be too hard to fix (can use sparc as a template), just needs
  some experimentation to get it packaged properly

Java
- kaffe port to parisc-linux. i got the interpreter working (sorta) but
  many things don't yet work. would be a good project to learn about
  JITs and such...

ltrace
- this is a function-call level tracer (as opposed to strace, which is
  more on the syscall level). The current ltrace source has some
  assumptions about ELF relocation layout that doesn't work on hppa. It
  shouldn't be *hard* to fix this if you understand how pa relocation
  stubs are generated...

glibc
- there seems to be a problem with the loader going into an infinite
  loop when programs are linked with certain libraries that are linked
  against libpthread. Helge had mentioned to me that he's seen this with
  KDE, also things that are linked against the plib library seems to
  have this problem...

c++ fixing
- http://auric.debian.org/~tausq/buildd/hppa-latest.html has a list of
  debian packages that don't yet build on hppa (the ones that are listed
  as "Failed"). many of these are c++ packages that are not coded
  correctly and don't work with the stricter c++ standard enforced by
  the 3.x compilers. try to fix these and file bugs...

i'm sure there are other things i'm missing.....

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
