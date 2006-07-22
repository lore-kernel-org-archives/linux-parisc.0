From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] The problem on the PA8800 is all in the data-cache.
Date: Sat, 22 Jul 2006 13:50:40 -0400
Message-ID: <119aab440607221050w3b6a949j49862c2766d5c7ef@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>,
 "James Bottomley" <James.Bottomley@steeleye.com>,
 "Grant Grundler" <grundler@parisc-linux.org>
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

James,

After spending ~4 hours of debugging yesterday evening, between
Thibaut, Dave, and myself, we firmly believe the PA8800 problems are
data cache issues.

Let me describe the test environment, the test, and the results/conclusions:

1. Thibaut's magnum, PA8800. 1 cpu enabled, 2 cores, L1/L2 enabled. etc.
2. Kernel was 2.6.17, with a revision identifier that is not in my notes.
3. A statically compiled sshd, with *everything* disabled.
    This required LIBS="-ldl" and LD_FLAGS="-static" to achieve.

We copied the statically compiled sshd to the PA8800, loaded sshd via
gdb. Passed the following parameters "-D -p 2222", in gdb we used "set
follow-fork-mode child", and started the process.

>>From an external box we initiate an ssh connection to the remote
PA8800 and waite for gdb to catch the SIGSEGV in the sshd child. We
did this over, and over, and over to look for patterns.

Pattern 1:

Using strace, we looked at the syscalls, and determined that the child
sshd process *always* dies after an fd socket read.

Pattern 2:

The set of registers involved is small, roughly r4, r19, r3, r21, r28.
These registers are primarily used by GCC to reference local data on
the stack. r3 is the frame marker and was frequently involved in the
faults.

Pattern 3:

Called functions that fail deal with allocating and touching new
memory. Deaths are primarily in malloc, xmalloc, memset,
packet_read_seqnr, buffer_put_bignum2_ret. Infact we died more often
than not in malloc.

Results:

Initially we thought it was an icache issue, then we realized that
PLABEL's are just data, and when we removed the PLABEL's from the
equation (complete static compile) we stopped seeing invalid insns. We
believe the truth here is that the PLABEL data is corrupted, and thus
r19 and the ip are bogus, so the failure appears to be icache related.
In thruth it was only corrupted PLABELs.

With a fully static sshd, the PLABEL's are not present, and the faults
are *all* memory loads and stores to the stack.

Conclusions:

a) We think it is not an icache issue, but infact a dcache issue.

Often it appears as if a register was corrupted, but the truth is that
the ldw loaded bogus data into a register.

b) One time, on a later comparison in gdb, the register and data in
memory did not equal. I stress that we only saw this situation once.

c) We have often seen the failure with the frame marker on a cacheline
boundary, for example 0xc0278100 (e.g. 256 bytes).

It is my hope that these patterns will trigger someone to devise a
plan for fixing this. If you have any questions about our methods, or
reproducing this, you can easily talk to Thibaut and we can probably
setup access to the test sshd binary.

Grant expressed worry that "Pattern 1" was indicative of a dma sync
problem with the network socket read.

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
