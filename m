Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA28623
	for <parisc-linux@puffin.external.hp.com>; Thu, 17 Aug 2000 18:13:34 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 18 Aug 2000 00:13:14 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA25875;
	Fri, 18 Aug 2000 10:12:59 +1000
Date: Fri, 18 Aug 2000 10:12:59 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: David Huggins-Daines <dhd@linuxcare.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: Incompatibility of PIC and non-PIC
In-Reply-To: <87ya1v1q5a.fsf@linuxcare.com>
Message-ID: <Pine.LNX.4.21.0008180950370.24871-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On 17 Aug 2000, David Huggins-Daines wrote:

> The reason this comes up is that libgcc.a has to be built with -fPIC
> since it gets linked into libc.so.  However libgcc.a is also getting
> statically linked with the binary itself (the symbols are not exported
> by libc.so, though I'm not sure if this is the correct behaviour or
> not), and of course it has to get linked in for statically linked
> things anyway.

The libgcc problem can be solved by generating a PIC libgcc.so and non-PIC
libgcc.a

>[snip]
> One potential solution is to use %dp as the data pointer across the
> board (which would solve the problem of mixing PIC and non-PIC in
> static binaries), and generate export stubs for shared library calls
> which restore the old %dp value (which would solve the problem of
> maintaining the non-PIC %dp, useless though it may be).

__builtin_return_address.  See the hoops you'll be jumping through in
gcc/config/pa/pa.c:return_addr_rtx.

> <thinking wishful="wishful">
>   Another one is to ditch our ... ahem ... unique ABI, use function
>   prologues instead, have a single global pointer and a single link
>   register, and have PIC, function pointers and dynamic linking work
>   the way $DEITY intended :-)
> </thinking>
> 
> Of course that's a lot more work and would probably involve breaking
> the published ELF standard for HPPA, such as it is, as well as
> foregoing a lot of code sharing with the rest of the PA-RISC stuff in
> gcc and binutils :-(

One way to keep out current ABI is to generate a .plt and import stubs
when statically linking PIC code.  That should be relatively easy to do in
the linker.

Alan
-- 
Linuxcare.  Support for the Revolution.
