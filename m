From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] RE: hppa glibc 2.3.3 experimental debs - patches
	posted
Date: Fri, 24 Sep 2004 17:50:29 +0200
Message-ID: <4152E882000003B7@mail-7-bnl.tiscali.it>
References: <20040924132313.GU27033@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
 parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040924132313.GU27033@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> 
> 
> On Thu, Sep 23, 2004 at 11:35:19PM -0400, Carlos O'Donell wrote:
> > http://www.parisc-linux.org/~carlos/glibc-work/glibc-2.3.3-debs-2004-=
09-23/
> > 
> > Binary build only. Haven't cleaned up the debian bits to make it
> > sourcefull.
> 
> Patch against cvs head:
> 
> http://www.parisc-linux.org/~carlos/glibc-work/glibc-hppa-patches-2004-=
09-22.tar.gz
> 
Thanks a lot :)

That said, I just rebuild the kernel 2.6.9-rc2-pa7 (just before Matthew
add new sys_call :( ) on the chroot disk with your deb libc6, libc6-dev
installed. All went fine and even boot without pb.

At the console I also log some test-lws:

applying fixup for 0x3e4, fixup at 0x3f8
Testing lws CAS (syscall #0)
Time: 3203003678 3203003897 (Diff 219)
PASSED: CAS worked correctly.
Testing lws with invalid number (syscall #666)
lws() =3D ENOSYS
Time: 3203021404 3203021423 (Diff 19)
PASSED: lws returned ENOSYS.
Testing lws CAS with NULL address (syscall #0)
lws() =3D EFAULT
Time: 3203040526 3211542412 (Diff 8501886)
PASSED: lws CAS returned EFAULT.
Testing lws CAS with an unaligned address (syscall #0)
Time: 3213802396 3213804615 (Diff 2219)
PASSED: lws CAS worked on unaligned address.
Testing lws CAS in multithreaded environment with signals.
Staring loop 1/1000 [................................] done.
Staring loop 2/1000 [................................] done.
Staring loop 3/1000 [................................] done.
Staring loop 4/1000 [................................] done.
[...]
Staring loop 997/1000 [................................] done.
Staring loop 998/1000 [................................] done.
Staring loop 999/1000 [................................] done.
Staring loop 1000/1000 [................................] done.
PASSED: lws CAS passed multithreaded test (e.g. Your box didn't lockup).
Trying to allocate a maximum number of memory pages.
Tried 2147483648 and failed.
Tried 1073741824 and failed.
Tried 536870912 and failed.
Tried 268435456 and failed.
mmap_max: Allocated 134217728 at 0x50b1e000
Trying to allocate any more spare pages.
Tried 2147483648 and failed.
Tried 1073741824 and failed.
Tried 536870912 and failed.
Tried 268435456 and failed.
mmap_max: Allocated 134217728 at 0x40b1e000
Allocated 0x8000000 (134217728) at 0x50b1e000 to 0x58b1e000.
Zeroing memory... done.
Running CAS over all pages:
PASSED: PASS 1 - CAS worked across a large mmap region of memory.
Increasing memory pressure before PASS 2.
oom-killer: gfp_mask=3D0xd2
DMA per-cpu:
cpu 0 hot: low 16, high 48, batch 8
cpu 0 cold: low 0, high 16, batch 8
Normal per-cpu: empty
HighMem per-cpu: empty

Free pages:         504kB (0kB HighMem)
Active:14605 inactive:14155 dirty:0 writeback:0 unstable:0 free:126 slab:=
1443
mapped:28701 pagetables:484
DMA free:504kB min:360kB low:720kB high:1080kB active:58420kB inactive:56=
620kB
present:131072kB
protections[]: 0 0 0
Normal free:0kB min:0kB low:0kB high:0kB active:0kB inactive:0kB present:=
0kB
protections[]: 0 0 0
HighMem free:0kB min:128kB low:256kB high:384kB active:0kB inactive:0kB
present:0kB
protections[]: 0 0 0
DMA: 38*4kB 2*8kB 1*16kB 4*32kB 1*64kB 1*128kB 0*256kB 0*512kB 0*1024kB
0*2048kB 0*4096kB =3D 504kB
Normal: empty
HighMem: empty
Swap cache: add 72324, delete 72169, find 18727/22673, race 0+2
Out of Memory: Killed process 5634 (test-lws).
Out of Memory: Killed process 5641 (test-lws).
Terminated

(unfortunately anoying network pb didn't allow me to do more; I will try
on next Monday test-waitid or I you foreseen some more dedicated test I
would better to do (as a make -k check of the lib,... ? )

Joel


-------------------------------------------------------------------------=
--
Tiscali ADSL GO, 29,50 Euro/mois pendant toute une ann=E9e, profitez-en..=
.
http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
