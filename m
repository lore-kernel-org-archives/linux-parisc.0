Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 74459482C
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 Nov 2001 07:11:04 -0700 (MST)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #3)
	id 161ptL-0005BW-00
	for parisc-linux@lists.parisc-linux.org; Thu, 08 Nov 2001 16:10:51 +0200
Date: Thu, 8 Nov 2001 16:11:26 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720/50 update
Message-ID: <20011108161126.A2541@dogbert.localdomain>
References: <fullung@ilink.nis.za> <20011107023007.A12882@dogbert.localdomain> <200111070700.AAA08983@puffin.external.hp.com> <20011107163116.A8527@dogbert.localdomain> <20011107200110.C616@dogbert.localdomain> <3BE9799E.8C2C9C77@esiee.fr> <20011108080516.A1857@dogbert.localdomain> <20011108172026.I6922@bubble.sa.bigpond.net.au> <20011108001410.B2835@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011108001410.B2835@tausq.org>
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

Hello Randolph, Alan and parisc-linux,

I've grabbed the new debs from the site. Here's how things went:

0. Using old apt with old libs, things seemed to work initially, but by
   yesterday around lunch-time, everything was dying (bigger database
   maybe?).

1. Using apt I built from scratch yesterday, _without_ LD_BIND_NOW=1
   set, I get a segmentation fault (apt-cache and apt-get). /var/log/syslog
   contains the following:

Nov  8 16:08:28 bob kernel: do_page_fault() pid=436 command='apt-get'
type=15 address=0xffffffec
Nov  8 16:08:28 bob kernel: vm_start = 0xbff00000, vm_end = 0xbff02000
Nov  8 16:08:28 bob kernel:
Nov  8 16:08:28 bob kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Nov  8 16:08:28 bob kernel: PSW: 00000000000001000000000100001111
Nov  8 16:08:28 bob kernel: r0-3^I 00000000 00031854 4006189b bff00ad0
Nov  8 16:08:28 bob kernel: r4-7^I bff00ac0 401211b8 0004bb6b bff00ab0
Nov  8 16:08:28 bob kernel: r8-11^I 0004bb00 bff009b0 00000000 bff00aa0
Nov  8 16:08:28 bob kernel: r12-15^I 00000000 00049100 000d00d0 00000000
Nov  8 16:08:28 bob kernel: r16-19^I 00000000 000255c8 00014000 401211b8
Nov  8 16:08:28 bob kernel: r20-23^I 00000000 0002cdd4 0002cdd4 0004b7f0
Nov  8 16:08:28 bob kernel: r24-27^I bff00ae0 00000029 bff00ac0 000429c0
Nov  8 16:08:28 bob kernel: r28-31^I bff00ab0 0000003c bff00c00 40009ae7
Nov  8 16:08:28 bob kernel: sr0-3^I 00000000 0000003f 00000000 0000003f
Nov  8 16:08:28 bob kernel: sr4-7^I 0000003f 0000003f 0000003f 0000003f
Nov  8 16:08:28 bob kernel:
Nov  8 16:08:28 bob kernel: IASQ: 0000003f 0000003f IAOQ: 400618af 400618b3
Nov  8 16:08:28 bob kernel:  IIR: 4a963fd9    ISR: 0000003f  IOR: ffffffec
Nov  8 16:08:28 bob kernel:  CPU:        0   CR30: 1327c000 CR31: 10330000
Nov  8 16:08:28 bob kernel:  ORIG_R28: 403d5a84

2. Using original apt, with new libs, apt-cache search, apt-get remove,
   and apt-get install all seem to work. apt-get update from http sites
   seems to work. apt-get update with deb-src lines in the sources.list
   produces an Illegal instruction error right after wgetting the
   relevant file. /var/log/syslog contains the following:

Nov  8 16:04:59 bob kernel: !!die_if_kernel: apt-get(367): Privileged
register - shouldn't happen! 11
Nov  8 16:04:59 bob kernel:
Nov  8 16:04:59 bob kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Nov  8 16:04:59 bob kernel: PSW: 00000000000001101111111100001111
Nov  8 16:04:59 bob kernel: r0-3^I 00000000 401e43fc 401845ff 00045990
Nov  8 16:04:59 bob kernel: r4-7^I 401e5bfc bff00f90 bff00e10 0000000a
Nov  8 16:04:59 bob kernel: r8-11^I 0004e100 bff00bc8 0004e128 bff00e28
Nov  8 16:04:59 bob kernel: r12-15^I 00000000 bff00e18 000cf2d0 00000000
Nov  8 16:04:59 bob kernel: r16-19^I 00000000 000255c8 00014000 00045220
Nov  8 16:04:59 bob kernel: r20-23^I 00000002 401cec20 401845b0 00000000
Nov  8 16:04:59 bob kernel: r24-27^I 00000020 00045998 bff01010 00040220
Nov  8 16:04:59 bob kernel: r28-31^I bff00f90 00000005 bff01080 00026f03
Nov  8 16:04:59 bob kernel: sr0-3^I 00000000 00000083 00000000 00000083
Nov  8 16:04:59 bob kernel: sr4-7^I 00000083 00000083 00000083 00000083
Nov  8 16:04:59 bob kernel:
Nov  8 16:04:59 bob kernel: IASQ: 00000083 00000083 IAOQ: 401cec23 401cec27
Nov  8 16:04:59 bob kernel:  IIR: 00040948    ISR: 00000083  IOR: 00000000
Nov  8 16:04:59 bob kernel:  CPU:        0   CR30: 12728000 CR31: 10330000
Nov  8 16:04:59 bob kernel:  ORIG_R28: 00000001

3. Using the apt I built from sources, _with_ LD_BIND_NOW=1 set, 
   everything seems to work fine, including fetching deb-src.

4. Using original apt _with_ LD_BIND_NOW=1 set, everything also seems to
   work; most notably the fetching of deb-src works.

bob:/home/fullung# uname -a
Linux bob 2.4.9-pa70 #5 Thu Nov 8 08:08:50 UTC 2001 parisc unknown

I built this kernel using the most recent gcc on this box yesterday.

For the rest I have all the latest packages from gluck -- everything
from about a day ago, and today's libc6, libc6-dev and nscd.

That's about. :-)

Regards,

Albert

On Thu, 08 Nov 2001, Randolph Chung wrote:

> In reference to a message from Alan Modra, dated Nov 08:
> > Randolph Chung is currently testing a new glibc that should cure most,
> > if not all, of your problems.  The problem was that the lazy linking
> 
> Alan's new patch seems to be working. I've updated the debs at
> http://gluck.debian.org/~tausq/hppa/
> 
> With these new debs I'm not seeing the apt-get crashes anymore.
> 
> I've passed the patch to Ben Collins for the next glibc build.
> 
> Please let us know if you are still seeing crashes after using the
> updated debs. (Apologies -- but the version numbers are the same as the
> previous ones)

Regards,

Albert
