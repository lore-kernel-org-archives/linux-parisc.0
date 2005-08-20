From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Latest 2.6.13-rc6-pa2 test pr :_(
Date: Sat, 20 Aug 2005 13:51:51 -0400 (EDT)
Message-ID: <200508201751.j7KHpqIH017505@hiauly1.hia.nrc.ca>
References: <4305FA88.9040404@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org (Randolph Chung)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4305FA88.9040404@tausq.org> from "Randolph Chung" at Aug 19,
	2005 11:28:08 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > TOC:
> > 
> > r2	__handle_mm_fault+0x68  (return from call to pte_alloc_map)
> > IIA	__handle_mm_fault+0x190
> > 
> > It looks as if this might have been caused by Process_3.exe in the
> > libjava GCC testsuite.
> 
> Does it always hang in the same place? How much RAM/swap do you have in 
> your system? Does it hang more/less if you disable swap?

Had another hang last night.  Here is the TOC for it:

r2	intr_check_sig+0
IIA	handle_interruption+0x30
r26,r5	code = 0x1a = 26 => Data Memory Access Rights Trap

This again occurred in the libjava testsuite:

byte compile: /home/dave/gnu/gcc-4.0/objdir/gcc/gcj -B/home/dave/gnu/gcc-4.0/objdir/hppa-linux/libjava/ -B/home/dave/gnu/gcc-4.0/objdir/gcc/ --encoding=UTF-8 -C -I/home/dave/gnu/gcc-4.0/objdir/hppa-linux/libjava/testsuite/../libgcj-4.1.0.jar -g /home/dave/gnu/gcc-4.0/gcc/libjava/testsuite/libjava.lang/SyncTest.java -d
/home/dave/gnu/gcc-4.0/objdir/hppa-linux/libjava/testsuite 2>@ stdout
PASS: SyncTest byte compilation
SyncTestSyncTest set_ld_library_path_env_vars: ld_library_path=.:/home/dave/gnu/gcc-4.0/objdir/hppa-linux/./libjava/.libs:/home/dave/gnu/gcc-4.0/objdir/gcc
Setting LD_LIBRARY_PATH to .:/home/dave/gnu/gcc-4.0/objdir/hppa-linux/./libjava/.libs:/home/dave/gnu/gcc-4.0/objdir/gcc:.:/home/dave/gnu/gcc-4.0/objdir/hppa-linux/./libjava/.libs:/home/dave/gnu/gcc-4.0/objdir/gcc:.:/home/dave/gnu/gcc-4.0/objdir/hppa-linux/./libjava/.libs:/home/dave/gnu/gcc-4.0/objdir/gcc:/home/dave/gnu/gcc-4.0/objdir/hppa-linux/libstdc++-v3/.libs:/home/dave/gnu/gcc-4.0/objdir/hppa-linux/libmudflap/.libs:/home/dave/gnu/gcc-4.0/objdir/hppa-linux/libssp/.libs:/home/dave/gnu/gcc-4.0/objdir/./gcc:/home/dave/gnu/gcc-4.0/objdir/./prev-gcc:/usr/lib/debug
Exception in thread "Thread-1" Exception in thread "Thread-2" Exception in thread "Thread-3" Exception in thread "Thread-4"

I found that Process_3.exe was generating unaligned exceptions.  This
was a result of a new macro define being added to libjava
(UNWRAP_FUNCTION_DESCRIPTOR).  This macro was incorrectly doing function
pointer canonicalization resulting in the unaligned exceptions.  I was
testing a fix for this when I got the above hang.

I have the feeling that there is at least one more circumstance where
handle_exceptions can loop.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
