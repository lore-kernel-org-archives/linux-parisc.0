Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: HEISERER DANIEL <Daniel.Heiserer@bmw.de>
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] octave2.1_2.1.35-6_hppa 
In-Reply-To: Message from HEISERER DANIEL <Daniel.Heiserer@bmw.de>
   of "Tue, 29 Jan 2002 11:18:01 +0100." <3C5676D9.E4B26D93@bmw.de>
References: <3C5676D9.E4B26D93@bmw.de> 
Date: Tue, 29 Jan 2002 11:59:16 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020129185916.2AE58482A@dsl2.external.hp.com>
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

HEISERER DANIEL wrote:
> I am also a little be astonished about the different object files
> existing on PA-Risc. There are 
> /usr/local/bin/perl:    PA-RISC1.1 shared executable dynamically linked
> -not stripped
> as well as "PA-RISC2" executables.

Also note that "PA-RISC1.1" on HPUX implies the binary is a SOM binary
(not ELF). parisc-linux uses ELF-32 format by default.  This was "invented"
for the parisc-linux port.

parisc-linux kernel has support for SOM binaries but it's really only
for HPUX application compatibility.

> Honestly I have no idea what the difference between ELF-64 and PA-RISC-2
> is. Are both 64 bit?

Since PARISC2.0 introduced 64-bit capability, many people equate the two.
(that's not a shooting offense. ;^) While Matthew is correct, in practice
most folks build PA1.1 binaries when they want a 32-bit application.

I was building 32-bit PA-RISC2.0 linux kernels. But the toolchain was using
"reloc" (type 74, iirc) that the kernel dynamic linker couldn't grok.
So I couldn't load any kernel driver modules.  I decided it wasn't worth
pursueing and now build PA 1.1 kernels.

grant
