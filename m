Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id C4524482B
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Nov 2001 00:04:20 -0700 (MST)
Message-Id: <200111070700.AAA08983@puffin.external.hp.com>
To: Albert Strasheim <fullung@ilink.nis.za>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720/50 update 
In-Reply-To: Message from Albert Strasheim <fullung@ilink.nis.za>
   of "Wed, 07 Nov 2001 02:30:07 +0200." <20011107023007.A12882@dogbert.localdomain>
Date: Wed, 07 Nov 2001 00:00:01 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Albert Strasheim wrote:
> Now sshd goes bonkers a little later:

I'm seeing a similar failure on my a500 after installing
the libs/tools from tausq...maybe not all of them got install
right or something.

do_page_fault() pid=30365 command='sshd' type=15 address=0x00000000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111
r0-3     0000000000000000 0000000000000000 00000000404258cb 00000000faf02a18
r4-7     000000004043ee8c 000000004002a09c 0000000040028a64 00000000faf00180
r8-11    00000000faf00178 0000000000000001 0000000000000001 0000000000000001
r12-15   00000000faf02154 00000000faf0214c 00000000faf02146 00000000faf0213e
r16-19   00000000faf02138 00000000faf02130 00000000faf02138 000000004043ee8c
r20-23   0000000000000001 000000004043ee8c 00000000404258a8 00000000400288f8
r24-27   00000000faf00180 00000000faf00178 0000000000000001 000000000005cd5c
r28-31   0000000040020302 0000000000000367 00000000faf02a98 000000004000dd67
sr0-3    00000000003b4180 00000000003b4180 0000000000000000 00000000003b4180
sr4-7    00000000003b4180 00000000003b4180 00000000003b4180 00000000003b4180

IASQ: 00000000003b4180 00000000003b4180 IAOQ: 0000000040425ceb 0000000040425cef
 IIR: 0c201094    ISR: 00000000003b4180  IOR: 0000000000000000
 CPU:        0   CR30: 00000000d6de0000 CR31: 0000000010430000
 ORIG_R28: 0000000000000000

gsyprf11:/home/grundler/tausq_tools# cksum *.deb
1114988557 141528 cpp-3.0_3.0.2-3_hppa.deb
1927521351 48988 fixincludes_3.0.2-3_hppa.deb
642572873 1556684 g++-3.0_3.0.2-3_hppa.deb
2439162186 1512948 gcc-3.0_3.0.2-3_hppa.deb
1556764740 1323150 gobjc-3.0_3.0.2-3_hppa.deb
183295544 3092004 libc6-dbg_2.2.4-5.1_hppa.deb
3189185516 2821668 libc6-dev_2.2.4-5.1_hppa.deb
3206792636 1288104 libc6-pic_2.2.4-5.1_hppa.deb
3456372709 1458650 libc6-prof_2.2.4-5.1_hppa.deb
81332045 4180314 libc6_2.2.4-5.1_hppa.deb
3444036471 32182 libgcc1_3.0.2-3_hppa.deb
3159110615 75220 libobjc1_3.0.2-3_hppa.deb
596324476 706532 libstdc++3-dbg_3.0.2-3_hppa.deb
1990895142 619846 libstdc++3-dev_3.0.2-3_hppa.deb
1076307807 267246 libstdc++3_3.0.2-3_hppa.deb
2468458388 57770 nscd_2.2.4-5.1_hppa.deb
1353008780 35892 protoize_3.0.2-3_hppa.deb
646825021 412622 python1.5-dev_1.5.2-19_hppa.deb
1167294820 25608 python1.5-gdbm_1.5.2-19_hppa.deb
1705531577 27230 python1.5-mpz_1.5.2-19_hppa.deb
2662708058 60932 python1.5-tk_1.5.2-19_hppa.deb
2712725009 979300 python1.5_1.5.2-19_hppa.deb

grant
