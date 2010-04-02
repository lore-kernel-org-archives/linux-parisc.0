From: NIIBE Yutaka <gniibe@fsij.org>
Subject: threads and fork on machine with VIPT-WB cache
Date: Fri, 02 Apr 2010 11:41:16 +0900
Message-ID: <4BB5594C.8050505@fsij.org>
References: <4BA43CE5.4020807@fsij.org> <87hbo4ek8l.fsf@thialfi.karme.de>	<4BB18B46.2070203@fsij.org> <4BB53D26.60601@fsij.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: pkg-gauche-devel@lists.alioth.debian.org, 561203@bugs.debian.org
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4BB53D26.60601@fsij.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi there,

I think that I am catching a bug for threads and fork.  I found it
when debugging FTBFS of Gauche, a Scheme interpreter.  As I think that
the Debian bug #561203 has same cause, I am CC:-ing to the BTS too.
Please send Cc: to me, I am not on linux-parisc list.

Here, I am talking uniprocessor system case.
I assume that PARISC has virtually indexed, physically tagged, write
back cache, I call it VIPT-WB.

I am reading the source in Debian:
	linux-source-2.6.32/kernel/fork.c
	linux-source-2.6.32/mm/memory.c
	linux-source-2.6.32/arch/parisc/include/asm/pgtable.h

To have same semantics as other archs, I think that VIPT-WB cache
machine should have cache flush at ptep_set_wrprotect, so that memory
of the page has up-to-date data.  Yes, it will be huge performance
impact for fork.  But I don't find any good solution other than this
yet.  Well, I will need to write to linux-arch.

Let me explain our case.  As I couldn't catch the scene, but the
result, it includes imagination and interpretation of mine.  Correct
me if I'm wrong.

(1) We have process A with threads.  One of threads calls fork(2) (in
    fact, it's clone(2) without CLONE_VM) when other threads are still
    live.  Let's call this thread A-1.

(2) As a result of clone(2), we have process B.

(3) The memory of process A are copied to process B by dup_mmap
    (fork.c) by A-1 with the context of process A.  There,
    flush_cache_dup_mm is called.

    In case of single thread, flush_cache_dup_mm is enough.  All data
    in cache go to memory.  But we have other threads, in this case.

(4) From dup_mmap, copy_page_range (memory.c) is called.

    Note that there is a possibility of sleep in copy_page_range.
    Allocation of page in pud_alloc, pmd_alloc, or pte_alloc_map_lock
    may need the A-1 thread to be scheduled off (and wakes up the
    swapper or other processes).

(5) Suppose the A-1 thread sleeps in copy_page_range, and another
    thread of A-2 of process A is waken up, and touches memory.  Then
    we have data only in cache, memory has stale data.

(6) A-2 thread sleeps, and A-1 thread is waken up to continue
    copy_page_range -> copy_*_range -> copy_one_pte.

(7) From copy_one_pte, A-1 thread call ptep_set_wrprotect as
    this is COW mapping. (*)

(8) A-1 thread sleeps again in copy_page_range and process B is waken up.

(9) Process B does read-access on memory, which gets *NEW* data in
    cache (if process space identifier color is same).
    Process B does write-access on memory which causes memory fault,
    as it's COW memory.

    Note: Process B sees *NEW* data because it's VIPT-WB cache.
    It shares same memory in this situation.

(10) New page is allocated and memory contents are copied, with
     stale data.

     I assume that kernel access to the memory is by different
     cache line and does not see cache data of A-2.

(11) After falut, process B gets *OLD* data on memory.


(*) When we make COW memory mapping between process A and process B,
    we assume memory were up-to-date.  As this assumption is
    incorrect, I think that we need to flush cache data to memory
    here.


If you have more interest or like ASCII art, please keep reading.

In our Gauche case, we saw this problem on the linked list handling of
pthread implementation (NPTL).  We have two linked list heads, <used>
and <cache>.

Initially, situation of process A is like this:

      +-------------------------------------+
      |                                     |
used  v     ELEM                            |
+-----+     +-----+     +-----+     +-----+ |
|   ------->|   ------->|   ------->|   ----+
+-----+     +-----+     +-----+     +-----+
            |     |     |     |     |     |
            +-----+     +-----+     +-----+

      +-------------+
      |             |
cache v             |
+-----+     +-----+ |
|   ------->|   ----+
+-----+     +-----+                       This is in memory
            |     |
            +-----+

A-2 thread removes ELEM during fork.
This is Process A's final situation, and what Process B sees initially.

      +-------------------------------------+
      |                                     |
used  v                                     |
+-----+                 +-----+     +-----+ |
|   ------------------->|   ------->|   ----+
+-----+                 +-----+     +-----+
                        |     |     |     |
                        +-----+     +-----+

      +---------------------------+
      |     ELEM                  |
      |     +-----+               |
      | +-->|   -----+            |
      | |   +-----+  |            |
      | |   |     |  |            |
cache v |   +-----+  |            |        This is in cache
+-----+ |            |   +-----+  |
|   ----+            +-->|   -----+
+-----+                  +-----+
                         |     |
                         +-----+


Process B scans through linked list with <cache> and update data
in linked list.  After process B touches ELEM, it sees
*OLD* data of ELEM.


      +-------------------------------------+
      |                                     |
used  v                                     |
+-----+                 +-----+     +-----+ |
|   -----------------+->|   ------->|   ----+
+-----+              |  +-----+     +-----+
                     |  |     |     |     |
            ELEM     |  +-----+     +-----+
            +-----+  |
        +-->|   -----+ Wow!
        |   +-----+
        |   |*****|
cache   |   +-----+
+-----+ |                +-----+
|   ----+                |   ----> ... to cache
+-----+                  +-----+
                         |     |
                         +-----+

Process B follows the link and goes different places
and touches wrongly.

      +-------------------------------------+
      |                                     |
used  v                                     |
+-----+                 +-----+     +-----+ |
|   -----------------+->|   ------->|   ----+
+-----+              |  +-----+     +-----+
                     |  |*****|     |     |
            ELEM     |  +-----+     +-----+
            +-----+  |
        +-->|   -----+
        |   +-----+
        |   |*****|
cache   |   +-----+
+-----+ |                +-----+
|   ----+                |   ----> ... to cache
+-----+                  +-----+
                         |     |
                         +-----+

      +-------------------------------------+
      |                                     |
used  v                                     |
+-----+                 +-----+     +-----+ |
|   -----------------+->|   ------->|   ----+
+-----+              |  +-----+     +-----+
                     |  |*****|     |*****|
            ELEM     |  +-----+     +-----+
            +-----+  |
        +-->|   -----+
        |   +-----+
        |   |*****|
cache   |   +-----+
+-----+ |                +-----+
|   ----+                |   ----> ... to cache
+-----+                  +-----+
                         |     |
                         +-----+

Process B scans and goes linked list head of <used> as if it were
element of linked list.  Process B couldn't stop because its
condition is comparison with the head <cache>.  Process B touches
memory, and then it sees *OLD* data of <used>.  Besides,
<cache> is on the same page with <used>, it's contents from
viewpoint of process B is also changed to *OLD*.

      +-------------------------------------+
      |                                     |
used  v                                     |
+-----+ Wow!            +-----+     +-----+ |
|   -----+           +->|   ------->|   ----+
+-----+  |           |  +-----+     +-----+
 *****   |           |  |*****|     |*****|
         |  ELEM     |  +-----+     +-----+
         |  +-----+  |
         +->|   -----+
            +-----+
            |*****|
cache       +-----+
+-----+ Wow!             +-----+
|   -------------------->|   ----> ... to cache
+-----+                  +-----+
                         |     |
                         +-----+

Process B continues scanning this linked list forever.
It enters this loop from <cache>, but <cache>
does not points to ELEM now.
-- 
