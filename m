From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] Re: gsyprf11 and 2.6.13-rc3-pa1
Date: Fri, 12 Aug 2005 23:02:11 -0600
Message-ID: <20050813050211.GE32609@colo.lackof.org>
References: <20050812180551.GA32609@colo.lackof.org>
	<200508130000.j7D00oKW005186@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200508130000.j7D00oKW005186@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Aug 12, 2005 at 08:00:50PM -0400, John David Anglin wrote:
> With 2.6.8.1-pa11, cc1plus generates a SIGSEGV here:
> 
> 0x00418d98 <ggc_set_mark+0>:    stw rp,-14(,sp)
> 
> The backtrace is:
> 
> (gdb) bt
> #0  ggc_set_mark (p=0x404c12a0) at ../../gcc/gcc/ggc-page.c:1254
> #1  0x00109ec0 in gt_ggc_mx_lang_tree_node (x_p=0x404c12a0) at gt-cp-tree.h:69
> ... [lots more frames]
> 
> (gdb) disass gt_ggc_mx_lang_tree_node
> Dump of assembler code for function gt_ggc_mx_lang_tree_node:
> 0x00109e84 <gt_ggc_mx_lang_tree_node+0>:        stw rp,-14(,sp)
> 0x00109e88 <gt_ggc_mx_lang_tree_node+4>:        stw,ma r7,80(,sp)
> 
> (gdb) p/x $sp
> $2 = 0xc0700040
> 
> So, the frame allocation by gt_ggc_mx_lang_tree_node appears to span
> a page boundary and the store into the frame marker by ggc_set_mark
> causes a data TLB miss and the SIGSEGV.  This causes the 2.6.13 kernel
> to crash in what's apparently an infinite loop involving
> handle_interruption.
> 
> So, I think the bug is that 2.6.13 (32-bit) crashes when we have a data
> TLB miss for an address outside the allowed bounds for the stack.  Probably,
> any simple program that recursively allocates stack frames until the
> allowed stack size is exceeded will demonstrate the problem.

While I believe you are probably right, I could not reproduce
this on my c3k here at home:

svenc3k:/# ls -l foo.*
-rw-r--r--  1 root root 180 Aug 13 04:40 foo.cc
-rw-r--r--  1 root root 748 Aug 13 04:42 foo.o
svenc3k:/# g++-4.0 -O2 -ftemplate-depth-20000 -c foo.cc
svenc3k:/# ls -l foo.*
-rw-r--r--  1 root root 180 Aug 13 04:40 foo.cc
-rw-r--r--  1 root root 748 Aug 13 04:44 foo.o
svenc3k:/# ulimit -a
core file size        (blocks, -c) 0
data seg size         (kbytes, -d) unlimited
file size             (blocks, -f) unlimited
max locked memory     (kbytes, -l) unlimited
max memory size       (kbytes, -m) unlimited
open files                    (-n) 1024
pipe size          (512 bytes, -p) 8
stack size            (kbytes, -s) 8192
cpu time             (seconds, -t) unlimited
max user processes            (-u) unlimited
virtual memory        (kbytes, -v) unlimited
svenc3k:/#

svenc3k:/# gcc-4.0 -v
Using built-in specs.
Target: hppa-linux-gnu
Configured with: ../src/configure -v --enable-languages=c,c++,java,f95,objc,ada,treelang --prefix=/usr --enable-shared --with-system-zlib --libexecdir=/usr/lib --enable-nls --without-included-gettext --enable-threads=posix --program-suffix=-4.0 --enable-__cxa_atexit --enable-libstdcxx-allocator=mt --enable-clocale=gnu --enable-libstdcxx-debug --enable-java-gc=boehm --enable-java-awt=gtk --enable-gtk-cairo --with-java-home=/usr/lib/jvm/java-1.4.2-gcj-4.0-1.4.2.0/jre --enable-mpfr --disable-werror --enable-checking=release hppa-linux-gnu
Thread model: posix
gcc version 4.0.2 20050806 (prerelease) (Debian 4.0.1-4)

> The C++ program that causes the system crash when compiled with cc1plus
> from the GCC head is shown below.  Note that there is a change to GCC's
> inlining in 4.1, and 4.0 doesn't cause the SIGSEGV.

I expect this is the difference...I need to use the same g++ version.
Does someone want to hack a small test program that consumes
stack space until it bombs out becuase of the ulimit?


>   My stack limit is
> the default 8192 kbytes.  The c3k kernel is default except I had to
> disable CONFIG_PDC_STABLE and CONFIG_INFINIBAND.

I'm not certain I have a perfectly clean -rc3-pa1 kernel either.
I expect I have some PCI changes and the same .config changes you
have listed above.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
