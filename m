From: "rubisher" <rubisher@scarlet.be>
Subject: Any idea why gcc "discards qualifiers from pointer target type"?
Date: Tue, 15 Jan 2008 11:30:24 +0100
Message-ID: <JUOL6O$C7EEA9CB9692A2BC327179D8052AF7D0@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
To: "linux-parisc" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello Dave,

Compiling p-l with gcc-4.2 I see new warning "discards qualifiers from pointer
target type":

gcc -Wp,-MD,drivers/net/.lasi_82596.o.d  -nostdinc -isystem
/usr/lib/gcc/hppa-linux-gnu/4.2.3/include -D__KERNEL__ -Iinclude -Iinc
lude2 -I/SRCTREE/include -include include/linux/autoconf.h
-I/CAD/linux-2.6.24-rc4-pa-git-2007120
6-trace/drivers/net -Idrivers/net -Wall -Wundef -Wstrict-prototypes
-Wno-trigraphs -fno-strict-aliasing -fno-common -Werror-implicit
-function-declaration -O2 -pipe -mno-space-regs -mfast-indirect-calls
-mdisable-fpregs -ffunction-sections -march=1.1 -mschedule=720
0 -fomit-frame-pointer -fno-stack-protector -Wdeclaration-after-statement
-Wno-pointer-sign  -D"KBUILD_STR(s)=#s" -D"KBUILD_BASENAME
=KBUILD_STR(lasi_82596)"  -D"KBUILD_MODNAME=KBUILD_STR(lasi_82596)" -c -o
drivers/net/lasi_82596.o /CAD/linux-2.6.24-rc4-pa-git-2007
1206-trace/drivers/net/lasi_82596.c
/SRCTREE/drivers/net/lib82596.c: In function 'wait_cmd':
/SRCTREE/drivers/net/lib82596.c:388: warning: passing argument 2 of
'dma_cache_sync' discards qualifiers from pointer target type
/SRCTREE/drivers/net/lib82596.c:391: warning: passing argument 2 of
'dma_cache_sync' discards qualifiers from pointer target type
/SRCTREE/drivers/net/lib82596.c: In function 'wait_istat':
/SRCTREE/drivers/net/lib82596.c:372: warning: passing argument 2 of
'dma_cache_sync' discards qualifiers from pointer target type
/SRCTREE/drivers/net/lib82596.c:375: warning: passing argument 2 of
'dma_cache_sync' discards qualifiers from pointer target type
/SRCTREE/drivers/net/lib82596.c: In function 'i596_cleanup_cmd':
/SRCTREE/drivers/net/lib82596.c:839: warning: passing argument 2 of
'dma_cache_sync' discards qualifiers from pointer target type
/SRCTREE/drivers/net/lib82596.c: In function 'init_i596_mem':
/SRCTREE/drivers/net/lib82596.c:580: warning: passing argument 2 of
'dma_cache_sync' discards qualifiers from pointer target type
/SRCTREE/drivers/net/lib82596.c:581: warning: passing argument 2 of
'dma_cache_sync' discards qualifiers from pointer target type
/SRCTREE/drivers/net/lib82596.c:600: warning: passing argument 2 of
'dma_cache_sync' discards qualifiers from pointer target type
/SRCTREE/drivers/net/lib82596.c:629: warning: passing argument 2 of
'dma_cache_sync' discards qualifiers from pointer target type  
/SRCTREE/drivers/net/lib82596.c: In function 'i596_reset':
/SRCTREE/drivers/net/lib82596.c:857: warning: passing argument 2 of
'dma_cache_sync' discards qualifiers from pointer target type
/SRCTREE/drivers/net/lib82596.c: In function 'i596_add_cmd':
/SRCTREE/drivers/net/lib82596.c:898: warning: passing argument 2 of
'dma_cache_sync' discards qualifiers from pointer target type
/SRCTREE/drivers/net/lib82596.c: In function 'i596_tx_timeout':
/SRCTREE/drivers/net/lib82596.c:963: warning: passing argument 2 of
'dma_cache_sync' discards qualifiers from pointer target type
/SRCTREE/drivers/net/lib82596.c: In function 'i596_interrupt':
/SRCTREE/drivers/net/lib82596.c:1266: warning: passing argument 2 of
'dma_cache_sync' discards qualifiers from pointer target type
/SRCTREE/drivers/net/lib82596.c:1291: warning: passing argument 2 of
'dma_cache_sync' discards qualifiers from pointer target type
/SRCTREE/drivers/net/lib82596.c: In function 'i596_close':
/SRCTREE/drivers/net/lib82596.c:1322: warning: passing argument 2 of
'dma_cache_sync' discards qualifiers from pointer target type

After more investigation it seems to linked to the fact that mentioned
arguments are 'volatile' in this structure:

struct i596_dma {
        struct i596_scp scp                     __attribute__((aligned(32)));
        volatile struct i596_iscp iscp          __attribute__((aligned(32)));
        volatile struct i596_scb scb            __attribute__((aligned(32)));
        struct sa_cmd sa_cmd                    __attribute__((aligned(32)));
        struct cf_cmd cf_cmd                    __attribute__((aligned(32)));
        struct tdr_cmd tdr_cmd                  __attribute__((aligned(32)));
        struct mc_cmd mc_cmd                    __attribute__((aligned(32)));
        struct i596_rfd rfds[RX_RING_SIZE]      __attribute__((aligned(32)));  
        struct i596_rbd rbds[RX_RING_SIZE]      __attribute__((aligned(32)));
        struct tx_cmd tx_cmds[TX_RING_SIZE]     __attribute__((aligned(32)));
        struct i596_tbd tbds[TX_RING_SIZE]      __attribute__((aligned(32)));
};

I tried this sample foobar:
      1 struct A {
      2         unsigned long a;
      3         unsigned char *b;
      4 };
      5
      6 struct B {
      7         volatile struct A AinB1;
      8         volatile struct A AinB2;
      9 };
     10
     11 void fooA(struct A *pa);
     12
     13 void fooB(struct B *pB)
     14 {
     15         fooA(&(pB->AinB1));
     16         fooA(&(pB->AinB2));
     17 }

which well return warnings:
# gcc-4.2 -c -o ts.o ts.c 
ts.c: In function 'fooB':
ts.c:15: warning: passing argument 1 of 'fooA' discards qualifiers from
pointer target type
ts.c:16: warning: passing argument 1 of 'fooA' discards qualifiers from
pointer target type

Removing a 'volatile' like:
      1 struct A {
      2         unsigned long a;
      3         unsigned char *b;
      4 };
      5
      6 struct B {
      7         volatile struct A AinB1;
      8         struct A AinB2;
      9 };
     10
     11 void fooA(struct A *pa);
     12
     13 void fooB(struct B *pB)
     14 {
     15         fooA(&(pB->AinB1));
     16         fooA(&(pB->AinB2));
     17 }

and it returns
# gcc-4.2 -c -o ts.o ts.c 
ts.c: In function 'fooB':
ts.c:15: warning: passing argument 1 of 'fooA' discards qualifiers from
pointer target type

Well my understanding of 'volatile' is that this prefix prevent gcc of any
optimization/reorganization. Is it correct? if yes why this warning?

Tia for your attention,
    r.




---
Scarlet One, ADSL 6 Mbps + Telephone, from EUR 29,95...
http://www.scarlet.be/
