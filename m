Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id CB0314829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Sep 2002 07:20:51 -0600 (MDT)
Message-ID: <3D8B2FBA.40909@freebel.net>
Date: Fri, 20 Sep 2002 14:24:58 +0000
From: Joel Soete <joel.soete@freebel.net>
MIME-Version: 1.0
To: Stephan Trajkoff <stephan@itp.bg>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PPPD+PPTPD
References: <3D89A5D4.8050306@itp.bg>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Hey Stephan,

IIRC the solution is to re-compile the kernel with option "PPP  support 
for sync tty ports" and not async (as usual). It solved this problem for me.

I hope it will help you too,

	Joel



Stephan Trajkoff wrote:
> Hello, please see the attachment.
> I use 2.4.18-pa61 kernel and enabled PPP support
> PPPD version is 2.4.1, PPTPD is 1.1.3
> 
> 
> ------------------------------------------------------------------------
> 
> Sep 19 13:22:41 obzor pppd[17190]: read: Resource temporarily unavailable
> Sep 19 13:22:41 obzor pppd[17190]: read /dev/ppp: Resource temporarily
> unavailable
> Sep 19 13:22:41 obzor pppd[17190]: rcvd [LCP ConfAck id=0x1 <asyncmap 0x0>
> <auth pap> <magic 0x2479cb91> <pcomp> <accomp>]
> Sep 19 13:22:41 obzor pppd[17190]: sent [LCP EchoReq id=0x0
> magic=0x2479cb91]
> Sep 19 13:22:41 obzor pppd[17190]: rcvd [PAP AuthReq id=0x1 user="kpematop"
> password=<hidden>]
