Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver1.hrz.tu-darmstadt.de (mailserver1.hrz.tu-darmstadt.de [130.83.126.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id DE77C482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Sep 2001 11:03:26 -0600 (MDT)
Received: from fb04281.mathematik.tu-darmstadt.de (fb04281.mathematik.tu-darmstadt.de [130.83.2.21])
	by mailserver1.hrz.tu-darmstadt.de (8.9.1a/8.9.1) with ESMTP id TAA17649
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Sep 2001 19:01:59 +0200 (MET DST)
Received: from fb0482.mathematik.tu-darmstadt.de (dummy82.mathematik.tu-darmstadt.de [130.83.2.82])
	by fb04281.mathematik.tu-darmstadt.de (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id TAA10879
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Sep 2001 19:03:25 +0200
Received: (from grothe@localhost)
	by fb0482.mathematik.tu-darmstadt.de (8.9.3/8.9.3/Debian 8.9.3-21) id TAA04497
	for parisc-linux@lists.parisc-linux.org; Thu, 20 Sep 2001 19:03:25 +0200
Date: Thu, 20 Sep 2001 19:03:24 +0200
From: hgrothe@mathematik.tu-darmstadt.de
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] nmap -O -> kernel panic on 712
Message-ID: <20010920190324.A4489@mathematik.tu-darmstadt.de>
References: <20010917165501.B17483@gollum.intranet.nimag.net> <20010917203312.A6109@middle.of.nowhere> <20010918002427.C17483@gollum.intranet.nimag.net> <20010918073855.A11627@middle.of.nowhere> <20010918123829.A3082@dogbert.localdomain> <20010918210628.A10837@middle.of.nowhere>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="EVF5PPMfhYS0aIcm"
In-Reply-To: <20010918210628.A10837@middle.of.nowhere>; from thunder7@xs4all.nl on Tue, Sep 18, 2001 at 09:06:28PM +0200
List-ID: <linux-parisc.vger.kernel.org>

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 18, 2001 at 07:38:55PM +0200, thunder7@xs4all.nl wrote:
> At this point, newbies like you and me can only hope one of the real
> kernel hackers sees this and says 'A-ha!'.
> 
> If I look at that code, I see a lot of (__u16 *)ptr and the like.
> 
> Am I correct in assuming those are all suspects and this is just another
> example of the missing unaligned access trap haunting us?

Far away from being a kernel hacker I tracked down the problem a little bit,
because I hate it if my favourite 'playing around' machine can be easily
crashed down by network. The following patch is not a solution in sense
of missing unaligned access trap(s) (I have much too few knowledge especially
of parisc assembler). It's a quick'n (really) dirty workaround which works
for me. The patch (for linux-2.4.9-pa24) breaks (__u32 *)ptr into two 
(__u16 *)ptr.

Comments are welcome.
   Holger
-- 
Holger Grothe  (Email: hgrothe@mathematik.tu-darmstadt.de)
Fachbereich Mathematik, TU Darmstadt

--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="linux-2.4.9-pa24.diff"

*** net/ipv4/tcp_input.c.dist	Fri Aug 17 12:04:25 2001
--- net/ipv4/tcp_input.c	Wed Sep 19 19:25:18 2001
***************
*** 2051,2058 ****
--- 2051,2063 ----
  						if ((estab && tp->tstamp_ok) ||
  						    (!estab && sysctl_tcp_timestamps)) {
  							tp->saw_tstamp = 1;
+ #if defined (__hppa__)							
+ 							tp->rcv_tsval = (((__u32)ntohs(*(__u16 *)ptr))<<16) | ((__u32)ntohs(*(__u16 *)(ptr+2)));
+ 							tp->rcv_tsecr = (((__u32)ntohs(*(__u16 *)(ptr+4)))<<16) | ((__u32)ntohs(*(__u16 *)(ptr+6)));
+ #else
  							tp->rcv_tsval = ntohl(*(__u32 *)ptr);
  							tp->rcv_tsecr = ntohl(*(__u32 *)(ptr+4));
+ #endif
  						}
  					}
  					break;

--EVF5PPMfhYS0aIcm--
