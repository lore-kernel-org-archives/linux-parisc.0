Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [63.224.241.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id BCAA0482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Nov 2001 00:11:57 -0700 (MST)
Date: Thu, 15 Nov 2001 00:11:00 -0700
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.14-pa1 seems to works fine on my B180
Message-ID: <20011115001100.A23883@beavis.ybsoft.com>
References: <1005763684.3bf2bc64ee2a9@webmail.tiscalinet.be> <200111141939.MAA09459@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200111141939.MAA09459@puffin.external.hp.com>
From: rbradetich@uswest.net (Ryan Bradetich)
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

Yes, I've hooked up some FW/Diff disk behind the Bluefish card in
the C200 trying to duplicate the scsi error seen by other people,
I have effectively been doing this in a continous loop on serveral
disks in parallel ... works for me(tm).

mkp is not seeing the disk corruption using the 2.4.14-pa1 kernel
on his C160 either, which used to corrupt this way also....

Not that this is much help, but hopefully will provide a data
point ....

- Ryan

> 
> thanks,
> grant
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 

-- 
