Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 19 Feb 2003 22:15:06 -0700
To: Dan Baker <dan_baker@eli.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] X problems...
Message-ID: <20030220051506.GA10418@dsl2.external.hp.com>
References: <20030220012101.7198.23807.Mailman@dsl2.external.hp.com> <003601c2d881$54da7920$830c1bac@vli82k7dbaker>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <003601c2d881$54da7920$830c1bac@vli82k7dbaker>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Wed, Feb 19, 2003 at 05:42:29PM -0800, Dan Baker wrote:
> BUT, I did download source code for HP's Intel linux visualize driver. I
> can't get it to compile, the assembler tells me there's an invalid opcode
> (??) in the .o file. I'm not really a programmer, so I'm hoping somebody out
> there can take a look at what they're doing and fix it.

Well, it's not that easy even for someone who can read C.

First, some bad news:
o x86 version of the card has extra VGA cruft+BIOS.
  PA-Risc version uses STI firmware for initialization.
o IIRC, the X11 server (or maybe just gfx card driver?) is a custom,
  closed source code.  Hopefully I'm wrong and someone will correct me.
o I'll guess that many (most of the?) interesting bits are in the XF86
  hpgfx driver module. I'm assuming one exists.

Good news: 3d acceleration for x86 cards uses the same RISC engines
as the parisc cards.

Several years ago I asked someone in the HP gfx group if they
could port the HPUX driver to parisc-linux but our port wasn't
ready then (I think it is now). The gfx driver interacts *alot*
with the rest of the kernel *and* the X11 server.
The above is what I remember from conversations with people.

> The files are at
> 
> ftp://ftp.hp.com/pub/ccd/soar2sdd/wk207/wk207en/hpgraphics_kernel-1.5.3-1.sr
> c.rpm
> and
> ftp://ftp.hp.com/pub/ccd/soar2sdd/wk207/wk207en/hpgraphics_kernel-1.5.3-1.sr
> c.rpm

uhm...'cuse me, but aren't those the same?

hth
grant
