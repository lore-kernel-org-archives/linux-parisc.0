Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7F0CF482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 Nov 2001 12:43:51 -0700 (MST)
Message-Id: <200111141939.MAA09459@puffin.external.hp.com>
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.14-pa1 seems to works fine on my B180 
In-Reply-To: Message from joel.soete@freebel.net
   of "Wed, 14 Nov 2001 19:48:04 +0100." <1005763684.3bf2bc64ee2a9@webmail.tiscalinet.be>
Date: Wed, 14 Nov 2001 12:39:07 -0700
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

joel.soete@freebel.net wrote:
> Hi all,
> 
> For my part 2.4.14-pa1 seems to works fine on my B180L (without or with 
> modules).

Astro based machines (eg C3000) still HPMC with:
	sync; cd/tmp; cp /boot/vmlinux .; sync;

I found one nit in sba_dma_supported() but that's not the problem.
Has anyone tried C200 (or similar? ie something with ccio)

thanks,
grant
