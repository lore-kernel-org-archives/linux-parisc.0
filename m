Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA02924
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Mar 2000 16:34:25 -0700
From: willy@thepuffingroup.com
Date: Wed, 15 Mar 2000 17:35:02 -0500
To: "Brian S. Julin" <bri@mojo.calyx.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Cross compiler -- on Alpha?
Message-ID: <20000315173502.Z27942@thepuffingroup.com>
References: <Pine.LNX.4.10.10003151927530.21833-100000@bastion.hugo.vanderkooij.org> <Pine.BSO.4.21.0003151719030.7474-100000@mojo.calyx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSO.4.21.0003151719030.7474-100000@mojo.calyx.net>; from Brian S. Julin on Wed, Mar 15, 2000 at 05:30:03PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Mar 15, 2000 at 05:30:03PM -0500, Brian S. Julin wrote:
> /usr/src/parisc/binutils/gas/./config/tc-hppa.c:3972: undefined reference
> to `_bfd_elf64_hppa_gen_reloc_type'
> /usr/src/parisc/binutils/gas/./config/tc-hppa.c:3972: undefined reference
> to `_bfd_elf64_hppa_gen_reloc_type'

elf_64_?  I think you may have misconfigured it.  were you following the
recipe on the website?
