From: Randolph Chung <tausq@debian.org>
Subject: [parisc-linux] Re: c++/10438: [3.3 regression] [hppa] Segfault when building jade
Date: Sat, 19 Apr 2003 08:30:56 -0700
Message-ID: <20030419153056.GB25257__18094.7467255921$1416622403$gmane$org@tausq.org>
References: <29d101c30685$140bcac0$15472597@bagio>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: gcc-gnats@gcc.gnu.org, parisc-linux@lists.parisc-linux.org,
	gcc-bugs@gcc.gnu.org, debian-gcc@lists.debian.org,
	nobody@gcc.gnu.org, gcc-prs@gcc.gnu.org,
	Wolfgang Bangerth <bangerth@ices.utexas.edu>
To: Giovanni Bajo <giovannibajo@libero.it>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <29d101c30685$140bcac0$15472597@bagio>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> Confirmed. Slightly reduced testcase:

Thanks. 

Running under gdb, I see:

(gdb) run bug.cxx
Starting program: /home/tausq/gcc/build-3.3/gcc/cc1plus bug.cxx

Program received signal SIGSEGV, Segmentation fault.
setup_class_bindings (name=0x401c9780, type_binding_p=1)
    at ../../gcc-3.3/gcc/cp/search.c:2560
2560          if (TREE_CODE (type_binding) == TREE_LIST
(gdb) bt
#0  setup_class_bindings (name=0x401c9780, type_binding_p=1)
    at ../../gcc-3.3/gcc/cp/search.c:2560
#1  0x00094410 in dfs_push_type_decls (binfo=0x401c9b40, data=0x401cf010)
    at ../../gcc-3.3/gcc/cp/search.c:2615
#2  0x00092f50 in dfs_walk_real (binfo=0x401c9b40, prefn=0,
    postfn=0x362c0e <__JCR_LIST__+486>, qfn=0x362bde <__JCR_LIST__+438>,
    data=0x0) at ../../gcc-3.3/gcc/cp/search.c:1911
[...]

type_binding is NULL after lookup_member()...

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
