Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 30210482E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 17 Nov 2002 14:12:44 -0700 (MST)
Date: Sun, 17 Nov 2002 21:13:15 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [2.5] next issues ...
In-Reply-To: <200211172048.gAHKmLu0018188@hiauly1.hia.nrc.ca>
Message-ID: <Pine.BSF.4.44.0211172053420.39295-100000@e0-0.zab2.int.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Sun, 17 Nov 2002, John David Anglin wrote:

> > regex.c:8214: internal compiler error: Segmentation fault
> > Please submit a full bug report,
>
> When I saw your report, I started a new bootstrap and it has passed the
> point of the above ICE.  Thus, the problem could be in the following

that fast *waeehhh* someone missed that last zero at 715/100(0) 8-(

> areas:
>
> 1) Your bootstrap compiler is broken for one reason or another.  Regex.c
>    is a pretty stable bit of code.

was gcc-3.2; now changed my PATH again and is debian 3.0.4 now in
second run; looks fine so far; takes pretty long for -o java/parse.o
again ...


> 2) Your system is unstable.  Various parisc-linux systems have had memory
>    management problems causing random segmentation faults.  This has been

maybe... have some  ... in dmesg (running 2.4.18-pa33):

do_page_fault() pid=22502 command='conftest' type=15 address=0x40019000
vm_start = 0x40018000, vm_end = 0x40019000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000011100000000100001111 Not tainted
r00-03  00000000 00021248 000109df 40176300
r04-07  00021386 00021248 0002135e 00000001
r08-11  0002137e 00000000 000d8f68 000f9008
r12-15  00000008 000e8d08 000d8f68 000e95e8
r16-19  00000000 000d24a4 0009e800 00000001
r20-23  40019000 40018000 4005e2fc 00000008
r24-27  0002152c 00000000 00010ff8 00021248
r28-31  00000000 00000219 faf00800 401038e7
sr0-3   00000014 00000014 00000000 00000014
sr4-7   00000014 00000014 00000014 00000014

IASQ: 00000014 00000014 IAOQ: 000109db 00010613
 IIR: 0e931200    ISR: 00000014  IOR: 40019000
 CPU:        0   CR30: 13560000 CR31: 103a0000
 ORIG_R28: 00000000


> 3) There have been problems with bash causing seg faults.  Glibc could
>    be involved.

no bash, nowhere, never, not as dflt ! 2> /dev/null ;-))


> You have to be specific about with compiler version was used for the
> bootstrap and the configuration options used for the build.

gcc-3.2  and --enable-nls=no

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
