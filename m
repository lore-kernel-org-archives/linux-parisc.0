Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.rz.uni-ulm.de (gemini.rz.uni-ulm.de [134.60.246.16])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4A7AF482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Mar 2003 16:29:22 -0700 (MST)
Date: Tue, 25 Mar 2003 00:29:17 +0100
From: Markus Schaber <markus.schaber@student.uni-ulm.de>
To: Thibaut VARENE <varenet@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Out of memory problem
Message-Id: <20030325002917.37f386fa.markus.schaber@student.uni-ulm.de>
In-Reply-To: <1B0823D5-5E27-11D7-B738-0030656F07A2@esiee.fr>
References: <20030324185958.307d033c.markus.schaber@student.uni-ulm.de>
	<1B0823D5-5E27-11D7-B738-0030656F07A2@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

Hello,

Thibaut VARENE <varenet@esiee.fr> schrieb:

> >> The Net install ISOs are what you want. See
> >> 	http://www.parisc-linux.org/software/install.html
> > But as this are ISO files, I need to attach a CD drive, and I don't 
> > have an external SCSI drive lying around. I also doubt I'll find any
> > IDE port inside my Apollo. That's why I looked for a net-boot image.
> there are lifimages as well.
> you can also get them here:
> http://pateam.esiee.fr/cd-images/lifimages/
>
> fwiw, reading the PA-RISC/Linux Boot HOWTO would have told you about 
> them.

I read it, and the _readme_first.txt there, but they don't mention that
those lifimages are prepared for NFS Root opposite to the one I used.
And the NetInst procedure for Debian/i386 uses a RAM-Disk, too, so I
thought those were using a initrd just as the one I got from
ftp://ftp.parisc-linux.org/kernels/. And so I just put it out of my
scope when searching for non-ramdisk images.

But I see that the I have to cross-read everything twice here, my fault.

Thanks for the hint.

Markus
