Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from blimpo.internal.net (ppp01.ts1-1.NewportNews.visi.net [209.8.196.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id C5BF4482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 22 Oct 2001 19:53:06 -0600 (MDT)
Date: Mon, 22 Oct 2001 21:31:39 -0400
From: Ben Collins <bcollins@debian.org>
To: parisc-linux@lists.parisc-linux.org, randolph@tausq.org
Message-ID: <20011022213139.H10952@visi.net>
References: <20011020170907.G1037@bubble.sa.bigpond.net.au> <20011022233534.X1037@bubble.sa.bigpond.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011022233534.X1037@bubble.sa.bigpond.net.au>
Sender: Ben Collins <bmc@visi.net>
Subject: [parisc-linux] Re: Fix for hppa-linux ld.so with newer binutils
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Oct 22, 2001 at 11:35:34PM +0930, Alan Modra wrote:
> On Sat, Oct 20, 2001 at 05:09:07PM +0930, Alan Modra wrote:
> > 	* sysdeps/hppa/dl-machine.h (elf_machine_dynamic):  Make it a
> > 	const function.  Do not use &_DYNAMIC as .got entries for global
> > 	syms are no longer initialised.  Instead they rely on the reloc,
> > 	which hasn't yet been applied.
> > 	(elf_machine_load_address): Make it const.  Call
> > 	elf_machine_dynamic as that function is called fropm rtld anyway.
> 
> The following, which includes the above patch, should allow glibc to
> once again work on hppa-linux with current binutils.  A number of other
> horrible things fixed:

Excellent. This fixes the ld.so problem. I can only assume that the 235
test suite failures are due to the one missing patch from the current
Debian binutils package.

Randolph, any estimate on when that fixed package will be available?

-- 
 .----------=======-=-======-=========-----------=====------------=-=-----.
/                   Ben Collins    --    Debian GNU/Linux                  \
`  bcollins@debian.org  --  bcollins@openldap.org  --  bcollins@linux.com  '
 `---=========------=======-------------=-=-----=-===-======-------=--=---'
