From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] gdb testcase for debugging shared loader.
Date: Tue, 5 Apr 2005 11:06:16 -0400
Message-ID: <20050405150616.GK1833@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: Randolph Chung <tausq@debian.org>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


Randolph,

This is the testcase I will use to demonstrate gdb's problem with single
stepping after loosing the frame, and generally getting confused.

I need to be able to step out of the plt trampoline and into the
loaded/relocated function.

---
set env CPP='gcc -E -x c-header'
file /usr/lib/debug/ld.so.1
set args --library-path \
/usr/lib/debug:/usr/lib/debug/lib/:/usr/lib/debug/usr/lib:/usr/lib:/lib \
/bin/touch test.txt
break fixup
break *_dl_runtime_resolve+68
run
si
si
---

This only works if you are using some glibc with the same offsets in
_dl_runtime_resolve (the plt trampoline).

After that last 'si' you are already going to the new function (as
looked up and loaded by the dynamic loader).

gdb chokes at this point and won't let me 'si' through the insn
sequences. In the past gdb would enter asm mode, and attempted to show
me the insn addresses (not even the insn, though that would have been
awesome). At this point I used 'i r' to watch the registers and continue
using 'si' to walk through the problem function.

Currently gdb won't produce 'i r' without some frame or function
information, though it seems to half work if I break and then issue 'i
r'.

Thoughts? It makes for debugging ld.so much more painful with gdb's
current behaviour. I have to use a lot of breaks since 'si' doesn't work
but break tends to work almost always. 

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
