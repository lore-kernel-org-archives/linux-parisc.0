Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id GAA28768
	for <parisc-linux@puffin.external.hp.com>; Fri, 24 Mar 2000 06:31:26 -0700
Message-ID: <20000324063105.A28615@puffin.external.hp.com>
Date: Fri, 24 Mar 2000 06:31:05 -0700
From: Philipp Rumpf <prumpf@puffin.external.hp.com>
To: Ulrich Strelow <ulrich_strelow@yahoo.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Success story on 715/33 and a question
References: <20000324121539.21840.qmail@web502.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000324121539.21840.qmail@web502.mail.yahoo.com>; from Ulrich Strelow on Fri, Mar 24, 2000 at 04:15:39AM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Mar 24, 2000 at 04:15:39AM -0800, Ulrich Strelow wrote:
> So now I am trying to do something useful :) with that
> booted kernel. I would like to mount the proc
> filesystem. I am using a very old ramdisk image
> (19991108) because I had trouble with the newer images
> on the 715/33 (no network driver).

I've got a patch to get the 715/old i82596 going right here,
and i'm going to commit it once I am in FC;  my 715/33 starts
sash fine, Hil keyboard works well (including SysRq), nfsroot
works, the framebuffer works at 1bpp (1024x768), and the HIL
mouse generates recognizable data.  This is about what you
should expect when I got around to committing everything.

> Is there a ramdisk image which I can use on a system
> without a network driver ? Or do I need to compile
> sash on HPUX as a SOM executable and build a ramdisk
> image by myself ? Do I have to make any changes to
> ftp://puffin.external.hp.com/pub/parisc/src/sash-2.1-hpux.tar.gz
> ?

Try to move to nfsroot asap - it's easier.  glibc compiles a
(working libc.a) (again, this is only local changes - I'm sure
people will force me to commit everything in FC though), and
ELF binaries linked against it work, so we'll hopefully have an
ELF sash soon.

	Philipp Rumpf
