Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5D693482E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 17 Nov 2002 06:16:23 -0700 (MST)
Date: Sun, 17 Nov 2002 13:16:51 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] [2.5] next issues ...
In-Reply-To: <200211152245.gAFMjWN0015793@hiauly1.hia.nrc.ca>
Message-ID: <Pine.BSF.4.44.0211171256290.39295-100000@e0-0.zab2.int.zabbadoz.net>
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

On Fri, 15 Nov 2002, John David Anglin wrote:

Hi,

> > Ok, first thing I am going to do is build with gcc 3.0.4 and see if it
> > works.
>
> Be aware that debian 3.0.4 suffers from a problem where calls that have
...


had 2.5.47-pa3 compiled with 3.0.4 up ad running
Linux version 2.5.47-pa3 (bz@apollo) (gcc version 3.0.4) #8 Fri Nov 15 23:38:21 UTC 2002

but had trouble with unaligned page access:
--- 8< 8< 8< ---
bz@apollo:~> sshd(315): unaligned access to 0x0006fe7b at ip=0x00020eaf
sshd(315): unaligned access to 0x0006feaf at ip=0x00020eb3
sshd(315): unaligned access to 0x0006feb3 at ip=0x00020eb7
sshd(315): unaligned access to 0x0006feb7 at ip=0x00020ebb
sshd(315): unaligned access to 0x0006febb at ip=0x00020ebf
sshd(315): unaligned access to 0x0006febf at ip=0x00020ec3
sshd(315): unaligned access to 0x0006fec3 at ip=0x00020ec7
sshd(315): unaligned access to 0x0006fec7 at ip=0x00020ecb
sshd(315): unaligned access to 0x0006fecb at ip=0x00020ecf

bz@apollo:~>
bz@apollo:~> dmesg
ommand='sshd' type=6 address=0xed0e6013
vm_start = 0x402b9000, vm_end = 0x402bc000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001111 Not tainted
r00-03  00000000 fffff000 ed0e6012 59e85014
r04-07  10080302 9d887d40 590cb010 f9080302
r08-11  5ae85014 10080802 42887c40 000e7760
r12-15  00000001 000f7f60 000e7760 000e7760
r16-19  000e7760 00000004 00000004 401dd300
r20-23  0000008e 40166ed4 00000000 00000000
r24-27  000feb50 00000000 00000006 000e7760
r28-31  00000001 00108fe8 0006fe8f 40166ee3
sr0-3   00000000 00000598 00000000 00000598
sr4-7   00000598 00000598 00000598 00000598

IASQ: 00000598 00000598 IAOQ: ed0e6013 ed0e6017
 IIR: 0e760013    ISR: 00000598  IOR: 0006fecb
 CPU:        0   CR30: 151c8000 CR31: 102ac000
 ORIG_R28: 00000000
...
--- 8< 8< 8< ---

Thus it should really be a compiler prob.

So what I did then was ''compiling'' (hopefully) everything with
gcc -S for 3.0.4 and 3.2. Then made a diff between both trees.

For those assembler gurus interested: I placed the bzip2ed diffs at
	http://www.zabbadoz.net/zabbadoz-network/apollo/linux-testing/
in file  gcc-S.diff.bz2 is the wohle diff (without unneccesarry parts)
and file gcc-S-net.diff.bz2 is only linux/net part.
If one really takes a look and needs the whole files, please drop me a
note. I will save them for one or two weeks.


Now I checkout gcc from cvs, updated linux-2.5-pa cvs and compiling...
But it takes ages... and hopefully I will not run out of diskspace
again... let's see what happens...


-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
