Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (mail.gmx.de [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 070A548C7
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 15 Feb 2004 02:28:19 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] C3000 video options
Date: Sun, 15 Feb 2004 10:27:59 +0100
References: <Pine.GSO.4.44.0402142137500.12861-100000@keymaster>
	<Pine.LNX.4.58.0402150326330.22822@sal.ucc.ie>
In-Reply-To: <Pine.LNX.4.58.0402150326330.22822@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200402151027.59161.deller@gmx.de>
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sunday 15 February 2004 04:36, M. Grabert wrote:
> > 2) Someone posted on the list that you could get a PCI Nvidia Voodoo2
> > card and maybe it would work, but when he tried it he got nothing except
> > corrupted nvram.  That doesn't sound very promising, but I thought I'd
> > ask.
> 
> Someone tried Voodoo2, but no success report so far.

I tested/fixed Vodoo2 and it should work with kernel 2.4 and 2.6 on HPPA.
Maximum resolution is 800x600 @16bpp though.

> Somebody had success with a ATI Rage XL graphics card and a 2.4.22 kernel
> (and a special no-bios patch). He had some colour issues 'though.
> Unfortunatelty the patch doesn't work on the 2.4.24 kernel anymore;
> I contacted the developer of this patch, and he said he's busy with some
> other things, and porting it to 2.4.24 (or even 2.6) will be low priority.

The "no-card-bios" patch is at least in kernel 2.6 and I tried it recently 
with a ATI Mach64 w/ 2MB (not XL!!). I got some crashes, but chances 
are pretty high that this could be made work.
 
Helge
