Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA15288
	for <parisc-linux@puffin.external.hp.com>; Wed, 5 Jul 2000 16:25:00 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 5 Jul 2000 22:26:22 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 139xbs-0006Uy-00
	for <parisc-linux@thepuffingroup.com>; Wed, 05 Jul 2000 18:25:36 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 05 Jul 2000 18:25:35 -0400
Message-ID: <87u2e4kye8.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] untested but building 64-bit toolchain, issues/questions
List-ID: <linux-parisc.vger.kernel.org>

Hi,

I've checked in some bits to get binutils-2.10 to build for 64-bit
Linux/ELF targets.  I have not even attempted to test it yet, but it
doesn't seem to break my 32-bit stuff.  Wherever possible I tried to
reuse the existing 64-bit HP/UX stuff, however I had to do some kludgy
things to work around problems in the way the configuration is set up.

I am using 'hppa2.0w-*-linux-gnu*' as the target architecture string,
so to build a cross-binutils for this target, use the following
configure command:

../binutils-2.10/configure --enable-64-bit-bfd --target=hppa2.0w-linux

I've only tested this in Linux/i386 for the time being.

A couple of questions:

1) What is the proper GNU architecture string for 64-bit Linux on
   PA-RISC?  On #parisc we sort of decided on using
   'hppa1.1-*-linux-*' for 32-bit Linux and 'hppa2.0w-*-linux-*' for
   64-bit Linux.  However the existing configuration files use some
   other strange pattern like 'hppa*64*-*-*' to configure for 64-bit
   PA-RISC.  Seeing as hppa2.0w is 64-bit by definition I don't think
   this makes much sense.

2) A corollary to this problem is that the choice of a 32- or 64-bit
   target in gas is determined at configure time rather than at
   runtime.  Every other architecture allows you to specify the
   architecture revision, code model, and word size on the assembler
   command line (it's the compiler that gets configured differently),
   and it would be nice if we could too.  Can anyone think of a reason
   why we cannot do this?

3) Finally, we use the 'linux' emulation for the assembler instead of
   the 'hppa' or 'hppa64' ones.  I had to kludge in a separate
   'linuxhppa64' target in order to get TARGET_WORD_SIZE defined
   properly.  Can anyone think of a better way to do this?  I think
   that merging the 32 and 64-bit code as noted above would be the
   Right Thing to do.

Cheers.

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
