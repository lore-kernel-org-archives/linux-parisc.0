Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA09470
	for <parisc-linux@puffin.external.hp.com>; Tue, 12 Dec 2000 01:24:18 -0700
To: Alan Modra <alan@linuxcare.com.au>
Cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 32-bit xc-20001206.tar.gz is foobar 
In-Reply-To: Message from Alan Modra <alan@linuxcare.com.au>
   of "Mon, 11 Dec 2000 00:02:57 EST." <Pine.LNX.4.21.0012102347330.31734-100000@front.linuxcare.com.au>
References: <Pine.LNX.4.21.0012102347330.31734-100000@front.linuxcare.com.au> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 12 Dec 2000 01:28:35 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001212082835.698F337CA1@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Alan Modra writes...

> > hppa-linux-ld: fs/fs.o(.text.load_aout_interp+0x11c): cannot reach 00000010
> _flush_instruction_cache+0, recompile with -ffunction-sections
> > hppa-linux-ld: fs/fs.o(.text.load_aout_interp+0x11c): cannot handle R_PARIS
> C_PCREL17F for flush_instruction_cache
> > ...
> 
> This isn't necessarily a problem with Matt's latest compiler binary.  fs.o
> is produced with a "ld -r" link stage, and it's text size is larger than
> 256k, so there is potential for branches to not be able to reach stubs.
> 
> ie. You may get these problems if
>  a) You are using an older binutils (ie. not the latest pehc CVS version),
>     and aren't using -ffunction-sections to compile the kernel
>  b) You are using the very latest binutils, and aren't using
>     -ffunction-sections, and I've goofed in my "ld -r" magic.

I just built a new cross-compiler (xc-20001211.tar.gz) and am still getting 
similar errors when building the kernel. It doesn't seem to matter if I have 
-ffunction-sections in the kernel Makefile or not.

> On a good fs.o, "hppa-linux-readelf -h fs.o" ought to show lots of .text.*
> sections.

$ hppa-linux-readelf -h fs.o
ELF Header:
  Magic:   7f 45 4c 46 01 02 01 03 00 00 00 00 00 00 00 00 
  Class:                             ELF32
  Data:                              2's complement, big endian
  Version:                           1 (current)
  OS/ABI:                            UNIX - Linux
  ABI Version:                       0
  Type:                              REL (Relocatable file)
  Machine:                           HPPA
  Version:                           0x1
  Entry point address:               0x0
  Start of program headers:          0 (bytes into file)
  Start of section headers:          360836 (bytes into file)
  Flags:                             0x210, PA-RISC 1.1
  Size of this header:               52 (bytes)
  Size of program headers:           0 (bytes)
  Number of program headers:         0
  Size of section headers:           40 (bytes)
  Number of section headers:         92
  Section header string table index: 89

HTH,

-- 
Matt Taggart
taggart@fc.hp.com
