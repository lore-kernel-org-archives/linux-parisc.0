Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA03344
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Mar 2000 16:56:59 -0700
To: "Brian S. Julin" <bri@mojo.calyx.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Cross compiler -- on Alpha?
References: <Pine.BSO.4.21.0003151719030.7474-100000@mojo.calyx.net>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 15 Mar 2000 17:57:28 -0500
In-Reply-To: "Brian S. Julin"'s message of "Wed, 15 Mar 2000 17:30:03 -0500 (EST)"
Message-ID: <87wvn3alk7.fsf@saison.thepuffigroup.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: David Huggins-Daines <dhd@saison.thepuffigroup.com>
List-ID: <linux-parisc.vger.kernel.org>

"Brian S. Julin" <bri@mojo.calyx.net> writes:

> tc-hppa.o: In function `tc_gen_reloc':
> /usr/src/parisc/binutils/gas/./config/tc-hppa.c:3972: undefined reference
> to `_bfd_elf64_hppa_gen_reloc_type'
> /usr/src/parisc/binutils/gas/./config/tc-hppa.c:3972: undefined reference
> to `_bfd_elf64_hppa_gen_reloc_type'
> collect2: ld returned 1 exit status
> make[3]: *** [as-new] Error 1

Yeah, the problem here is that some part of the binutils configure
script is getting the host and target word size confused and thus
thinking that it should be building for an ELF64 instead of ELF32
target.

You cna fix this by undefining BFD64 in tc-hppa.c and possibly some
other place, I think.  I didn't commit this to CVS because it's really
the wrong thing to do. Someone who actually understands the binutils
configuration and build system should be able to apply the correct fix...


-- 
David Huggins-Daines, Senior Linux Consultant, Linuxcare, Inc.
613.562.1239 tel
dhuggins@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
