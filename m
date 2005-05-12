From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] ccio-dma 64bit debug_init info
Date: Thu, 12 May 2005 19:37:27 +0200
Message-ID: <4282FEEE00000637@mail-6-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
To: parisc-linux@lists.parisc-linux.org
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

I try to figure out what's wrong with ccio-dma for 64bit and put on DEBUG=
_INIT
an collect:
for 32bit kernel:
...
Setting cache flush threshold to 20 (1 CPUs online)
Found U2 at 0xfff88000
ccio_ioc_init() hpa 0xfff88000 mem 256MB IOV 128MB (27 bits)
 base 10740000
ccio_ioc_init() res_size 0x1000
 chainid_shift 0x13 
Found U2 at 0xfff8a000
ccio_ioc_init() hpa 0xfff8a000 mem 256MB IOV 128MB (27 bits) 
 base 10780000 
ccio_ioc_init() res_size 0x1000
 chainid_shift 0x13 
Lasi version 0 at 0xffd00000 found.
...

Otc for 64bit kernel:
...
Setting cache flush threshold to ee7c0 (1 CPUs online)
Found U2 at 0xfffffffffff88000
ccio_ioc_init() hpa 0xfffffffffff88000 mem 256MB IOV 128MB (27 bits) 
 base 0000000010a80000 
ccio_ioc_init() res_size 0x1000
 chainid_shift 0x13 
Found U2 at 0xfffffffffff8a000
ccio_ioc_init() hpa 0xfffffffffff8a000 mem 256MB IOV 128MB (27 bits) 
 base 0000000010ac0000
ccio_ioc_init() res_size 0x1000
 chainid_shift 0x13 
...

mmm base address seems to be wrong.

Any idea from where came this pb?

Thanks,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
