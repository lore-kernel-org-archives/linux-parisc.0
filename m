From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] pb to build modules on b2k for k-2.6.10-rc1-pa10
Date: Mon, 8 Nov 2004 18:00:50 +0100
Message-ID: <418A80F70000132E@mail-5-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: parisc-linux@parisc-linux.org
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

Hello all,

This smp kernel 64bits boot fine on my n4k :) (Thanks Matthew)
and also as up 64bits on my b2k but when I try to build modules I encount=
er
the following pb:
 hppa64-linux-gcc -Wp,-MD,net/ipv4/netfilter/.ipt_hashlimit.o.d -nostdinc=

-iwithprefix include -D__KERNEL__ -Iinclude  -Wall -Wstrict-prototypes -W=
no-trigraphs
-fno-strict-aliasing -fno-common -O2 -fomit-frame-pointer -pipe -mno-spac=
e-regs
-mfast-indirect-calls -ffunction-sections -march=3D2.0 -mschedule=3D8000 =
-Wdeclaration-after-statement
  -DMODULE -DKBUILD_BASENAME=3Dipt_hashlimit -DKBUILD_MODNAME=3Dipt_hashl=
imit
-c -o net/ipv4/netfilter/ipt_hashlimit.o net/ipv4/netfilter/ipt_hashlimit=
.c
net/ipv4/netfilter/ipt_hashlimit.c: In function `__dsthash_find':
net/ipv4/netfilter/ipt_hashlimit.c:124: structure has no member named `lo=
cked_by'
net/ipv4/netfilter/ipt_hashlimit.c: In function `__dsthash_free':
net/ipv4/netfilter/ipt_hashlimit.c:173: structure has no member named `lo=
cked_by'
net/ipv4/netfilter/ipt_hashlimit.c: In function `htable_selective_cleanup=
':
net/ipv4/netfilter/ipt_hashlimit.c:261: structure has no member named `lo=
cked_by'
net/ipv4/netfilter/ipt_hashlimit.c:261: structure has no member named `l'=

net/ipv4/netfilter/ipt_hashlimit.c:261: structure has no member named `lo=
cked_by'
net/ipv4/netfilter/ipt_hashlimit.c:269: structure has no member named `lo=
cked_by'
net/ipv4/netfilter/ipt_hashlimit.c:269: structure has no member named `lo=
cked_by'
net/ipv4/netfilter/ipt_hashlimit.c:269: structure has no member named `l'=

net/ipv4/netfilter/ipt_hashlimit.c: In function `hashlimit_match':
net/ipv4/netfilter/ipt_hashlimit.c:460: structure has no member named `lo=
cked_by'
net/ipv4/netfilter/ipt_hashlimit.c:460: structure has no member named `l'=

net/ipv4/netfilter/ipt_hashlimit.c:460: structure has no member named `lo=
cked_by'
net/ipv4/netfilter/ipt_hashlimit.c:469: structure has no member named `lo=
cked_by'
net/ipv4/netfilter/ipt_hashlimit.c:469: structure has no member named `lo=
cked_by'
net/ipv4/netfilter/ipt_hashlimit.c:469: structure has no member named `l'=

net/ipv4/netfilter/ipt_hashlimit.c:482: structure has no member named `lo=
cked_by'
net/ipv4/netfilter/ipt_hashlimit.c:482: structure has no member named `lo=
cked_by'
net/ipv4/netfilter/ipt_hashlimit.c:482: structure has no member named `l'=

net/ipv4/netfilter/ipt_hashlimit.c:493: structure has no member named `lo=
cked_by'
net/ipv4/netfilter/ipt_hashlimit.c:493: structure has no member named `lo=
cked_by'
net/ipv4/netfilter/ipt_hashlimit.c:493: structure has no member named `l'=

net/ipv4/netfilter/ipt_hashlimit.c:497: structure has no member named `lo=
cked_by'
net/ipv4/netfilter/ipt_hashlimit.c:497: structure has no member named `lo=
cked_by'
net/ipv4/netfilter/ipt_hashlimit.c:497: structure has no member named `l'=

net/ipv4/netfilter/ipt_hashlimit.c: In function `dl_seq_start':
net/ipv4/netfilter/ipt_hashlimit.c:572: structure has no member named `lo=
cked_by'
net/ipv4/netfilter/ipt_hashlimit.c:572: structure has no member named `l'=

net/ipv4/netfilter/ipt_hashlimit.c:572: structure has no member named `lo=
cked_by'
net/ipv4/netfilter/ipt_hashlimit.c: In function `dl_seq_stop':
net/ipv4/netfilter/ipt_hashlimit.c:606: structure has no member named `lo=
cked_by'
net/ipv4/netfilter/ipt_hashlimit.c:606: structure has no member named `lo=
cked_by'
net/ipv4/netfilter/ipt_hashlimit.c:606: structure has no member named `l'=

make[3]: *** [net/ipv4/netfilter/ipt_hashlimit.o] Error 1
make[2]: *** [net/ipv4/netfilter] Error 2
make[1]: *** [net/ipv4] Error 2
make: *** [net] Error 2

I know you shoulld be busy to fix cvs pb so I would just like to know if
fixed in a  bk (and I will wait for) or if not I will have to check.

Thanks in advance for advise,
    Joel

-------------------------------------------------------------------------=
--
Tiscali ADSL GO & Light, 2 mois gratuits, profitez-en...
http://reg.tiscali.be/adsl/welcome.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
