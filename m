Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA31147
	for <parisc-linux@puffin.external.hp.com>; Fri, 11 Jun 1999 01:28:52 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id DAA18551
	for <parisc-linux@thepuffingroup.com>; Fri, 11 Jun 1999 03:36:20 -0400
Sender: adevries@feather.thepuffingroup.com
Message-ID: <3760BC72.B193B201@thepuffingroup.com>
Date: Fri, 11 Jun 1999 03:36:18 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] booting problems
References: <375F482D.E1E0B53D@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Alex deVries wrote:
> 
> Looks like we just need to compare a large chunk of the bootable binary
> to figure out what's happening.
> 

For kicks, I tried building the boot structure as it exists in the
kernel, and the kernel itself on HPUX.  I was thinking that maybe there
was a byte order probelm in the boot image generation tools.  I get
pretty much the same thing though, the parisc box just dies without even
entering the IPL code.

It's time to start digging deeper.  If someone else wants look over the
boot code in the kernel, it'd be appreciated.  I'm sure it's a simple
mistake.

The gist of it is this:

- Jason's existing prebuilt bootstrap binary does work
- my copy of his code with some build scripts used to generate a
bootstrap does not



- Alex
