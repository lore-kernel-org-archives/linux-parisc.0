Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA19599
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Mar 2000 11:37:31 -0700
From: willy@thepuffingroup.com
Date: Wed, 1 Mar 2000 11:39:48 -0500
To: mike_clapper@hp.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] cvs setup
Message-ID: <20000301113948.N9944@thepuffingroup.com>
References: <H00007e30eea8638@MHS>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <H00007e30eea8638@MHS>; from mike_clapper@hp.com on Tue, Feb 29, 2000 at 01:32:39PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Feb 29, 2000 at 01:32:39PM -0500, mike_clapper@hp.com wrote:


You sent your mail as RTF for some reason -- I managed to read it, but I
can't reply to it properly.

The problem you are experiencing is because the recipe you read is wrong.
It needs to be updated to reflect reality :-)

I'll add a section detailing which repositories contain what, something
along these lines:

binutils	Binutils 2.9 including hppa-linux (ELF)
binutils-old	Old Binutils
boot_code	?
boot_tools	?
egcs-old	Old EGCS 1.1.2, implementing SOM hppa-linux
gcc		EGCS 2.9 including hppa-linux (ELF)
glibc		GNU C Library including hppa-linux
linker		HP SOM linker
linux		Linux 2.2.  Obsolete, no longer in development.
linux-2.3	Linux 2.3.  Current development branch.
minilibc	A smaller libc which was easier to get going initially.
palo		PA/Linux boot loader.
userspace	Some small userspace utilities
website		The source for http://www.thepuffingroup.com/parisc/
