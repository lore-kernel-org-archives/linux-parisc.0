Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpzilla1.xs4all.nl (smtpzilla1.xs4all.nl [194.109.127.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0D090482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 Nov 2001 23:07:11 -0700 (MST)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtpzilla1.xs4all.nl (8.12.0/8.12.0) with ESMTP id fAF675hv029640
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Nov 2001 07:07:09 +0100 (CET)
Date: Thu, 15 Nov 2001 07:04:32 +0100
From: Jurriaan on Alpha <thunder7@xs4all.nl>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.14-pa1 seems to works fine on my B180
Message-ID: <20011115070432.A3451@alpha.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <1005763684.3bf2bc64ee2a9@webmail.tiscalinet.be> <200111141939.MAA09459@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200111141939.MAA09459@puffin.external.hp.com>
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

On Wed, Nov 14, 2001 at 12:39:07PM -0700, Grant Grundler wrote:
> joel.soete@freebel.net wrote:
> > Hi all,
> > 
> > For my part 2.4.14-pa1 seems to works fine on my B180L (without or with 
> > modules).
> 
> Astro based machines (eg C3000) still HPMC with:
> 	sync; cd/tmp; cp /boot/vmlinux .; sync;
> 
> I found one nit in sba_dma_supported() but that's not the problem.
> Has anyone tried C200 (or similar? ie something with ccio)
> 
I'd be willing to try, but will the new kernel build with the old, pre
'don't apt-get upgrade!!' userland tools?

Thanks,
Jurriaan
-- 
Holed up in your little room, we talk for hour on empty hour,
pacing up and down between the walls that we have built ourselves.
	New Model Army - Long Goodbye
GNU/Linux 2.4.15-pre4 on Debian/Alpha 64-bits 990 bogomips load:0.08 0.21 0.15
