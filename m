Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (unknown [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 294C9482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 14 Nov 2001 23:33:00 -0700 (MST)
To: thunder7@xs4all.nl, Jurriaan on Alpha <thunder7@xs4all.nl>
Subject: Re: [parisc-linux] 2.4.14-pa1 seems to works fine on my B180
Message-ID: <1005805963.3bf3618b12c3d@webmail.tiscalinet.be>
Date: Thu, 15 Nov 2001 07:32:43 +0100 (CET)
From: joel.soete@freebel.net
Cc: Grant Grundler <grundler@puffin.external.hp.com>,
	joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <1005763684.3bf2bc64ee2a9@webmail.tiscalinet.be> <200111141939.MAA09459@puffin.external.hp.com> <20011115070432.A3451@alpha.of.nowhere>
In-Reply-To: <20011115070432.A3451@alpha.of.nowhere>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Hello Jurrian,

Quoting Jurriaan on Alpha <thunder7@xs4all.nl>:

> On Wed, Nov 14, 2001 at 12:39:07PM -0700, Grant Grundler wrote:
> > joel.soete@freebel.net wrote:
> > > Hi all,
> > > 
> > > For my part 2.4.14-pa1 seems to works fine on my B180L (without or
> with 
> > > modules).
> > 
> > Astro based machines (eg C3000) still HPMC with:
> > 	sync; cd/tmp; cp /boot/vmlinux .; sync;
> > 
> > I found one nit in sba_dma_supported() but that's not the problem.
> > Has anyone tried C200 (or similar? ie something with ccio)
> > 
> I'd be willing to try, but will the new kernel build with the old, pre
> 'don't apt-get upgrade!!' userland tools?

You could be confident, I successfully re-compile the kernel from a cvs 
checkout on my B180 natively (what I do from some month now) with a running 
kernel 2.4.9-pa78.

Have a nice kernel :<)) ,
        Joel


> 
> Thanks,
> Jurriaan
> -- 
> Holed up in your little room, we talk for hour on empty hour,
> pacing up and down between the walls that we have built ourselves.
> 	New Model Army - Long Goodbye
> GNU/Linux 2.4.15-pre4 on Debian/Alpha 64-bits 990 bogomips load:0.08
> 0.21 0.15
> 
> 


-------------------------------------------------
This mail sent through Tiscalinet Webmail (http://webmail.tiscali.be)
