Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id DD03E482B
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Nov 2001 03:32:21 -0700 (MST)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #3)
	id 161Q0H-0000Ye-00
	for parisc-linux@lists.parisc-linux.org; Wed, 07 Nov 2001 12:32:17 +0200
Date: Wed, 7 Nov 2001 16:31:17 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720/50 update
Message-ID: <20011107163116.A8527@dogbert.localdomain>
References: <fullung@ilink.nis.za> <20011107023007.A12882@dogbert.localdomain> <200111070700.AAA08983@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200111070700.AAA08983@puffin.external.hp.com>
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

Hello,

apt is mostly fine now, but when I added the following line to
/etc/apt/sources.list:

deb-src ftp://archive.sun.ac.za/debian testing main contrib non-free

it died again:

...
Get:1 ftp://archive.sun.ac.za testing/main Sources [609kB]
Ign ftp://archive.sun.ac.za testing/main Release
Get:Illegal instruction

Nov  7 12:26:33 bob kernel: !!die_if_kernel: apt-get(2805): Privileged
register - shouldn't happen! 11
Nov  7 12:26:33 bob kernel:
Nov  7 12:26:33 bob kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Nov  7 12:26:33 bob kernel: PSW: 00000000000001101111111100001111
Nov  7 12:26:33 bob kernel: r0-3^I 00000000 401e43fc 401845ff 00045990
Nov  7 12:26:33 bob kernel: r4-7^I 401e5bfc bff00dd0 bff00c50 0000000a
Nov  7 12:26:33 bob kernel: r8-11^I 0004a5f0 bff00a08 0004a618 bff00c68
Nov  7 12:26:33 bob kernel: r12-15^I 00000000 bff00c58 000c56f0 00000000
Nov  7 12:26:33 bob kernel: r16-19^I 00000000 000255c8 00014000 00045220
Nov  7 12:26:33 bob kernel: r20-23^I 00000002 401cec20 401845b0 00000000
Nov  7 12:26:33 bob kernel: r24-27^I 00000020 00045998 bff00e50 00040220
Nov  7 12:26:33 bob kernel: r28-31^I bff00dd0 00000005 bff00ec0 00026f03
Nov  7 12:26:33 bob kernel: sr0-3^I 00000000 000001b2 00000000 000001b2
Nov  7 12:26:33 bob kernel: sr4-7^I 000001b2 000001b2 000001b2 000001b2
Nov  7 12:26:33 bob kernel:
Nov  7 12:26:33 bob kernel: IASQ: 000001b2 000001b2 IAOQ: 401cec23 401cec27
Nov  7 12:26:33 bob kernel:  IIR: 00040948    ISR: 000001b2  IOR: 00000000
Nov  7 12:26:33 bob kernel:  CPU:        0   CR30: 1527c000 CR31: 10330000
Nov  7 12:26:33 bob kernel:  ORIG_R28: 00000001

I have the ftp_proxy environment variable set, if that makes any
difference. I'll try to do it without the proxy shortly; just need to
setup my "gateway" box right so that the 720/50 can transparently access
the outside world.

Relevant packages versions:

apt            0.5.4
apt-utils      0.5.4
binutils       2.11.92.0.10-2
cpp            3.0.2-10
cpp-3.0        3.0.2-3
g++            3.0.2-10
g++-3.0        3.0.2-3
gcc-3.0        3.0.2-3
gcc-3.0-base   3.0.2-3 (got it from http.us.debian.org)
gzip           1.2.4-33
libc6          2.2.4-5.1

bob:~# uname -a
Linux bob 2.4.9-pa70 #16 Wed Nov 7 02:08:44 SAST 2001 parisc unknown

Regards,

Albert
