From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: can't compile kernel for parisc
Date: Sat, 28 Feb 2009 11:17:18 -0500 (EST)
Message-ID: <20090228161719.40D0D4E9A@hiauly1.hia.nrc.ca>
References: <a4423d670902270955j5562dd4bkce8142e0a89750f9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: a.beregalov@gmail.com (Alexander Beregalov)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <a4423d670902270955j5562dd4bkce8142e0a89750f9@mail.gmail.com> from "Alexander Beregalov" at Feb 27, 2009 08:55:28 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> (no debugging symbols found)
> /usr/bin/ld:
> Program received signal SIGSEGV, Segmentation fault.
> 0x4080f404 in strlen () from /lib/libc.so.6
> (gdb) backtrace
> #0  0x4080f404 in strlen () from /lib/libc.so.6
> #1  0x407d5428 in vfprintf () from /lib/libc.so.6
> #2  0x407d1304 in ?? () from /lib/libc.so.6
> #3  0x407d18b0 in vfprintf () from /lib/libc.so.6
> #4  0x4088359c in __vfprintf_chk () from /lib/libc.so.6
> #5  0x4040cdc8 in _bfd_default_error_handler () from
> /usr/lib/binutils/hppa2.0-unknown-linux-gnu/2.18/libbfd-2.18.so
> #6  0x40432034 in ?? () from
> /usr/lib/binutils/hppa2.0-unknown-linux-gnu/2.18/libbfd-2.18.so
> #7  0x40452f58 in bfd_elf_final_link () from
> /usr/lib/binutils/hppa2.0-unknown-linux-gnu/2.18/libbfd-2.18.so
> #8  0x4042e764 in ?? () from
> /usr/lib/binutils/hppa2.0-unknown-linux-gnu/2.18/libbfd-2.18.so
> #9  0x00029f3c in ?? ()
> #10 0x000295c8 in main ()
> 
> Glibc is  2.9_p20081201, I will try older version.

Assuming you have the glibc debug libraries, try the same backtrace
with LD_LIBRARY_PATH set to /usr/lib/debug.  Try to determine
if a bad pointer has been passed from _bfd_default_error_handler.
This seems likely.

binutils has likely been miscompiled, or your kernel build has
exposed a problem in binutils.  We may be not handling a relocation
correctly during the final link.

If you can, would you build CVS binutils with debugging.  Disable
building shared libraries so we don't use libbfd-2.18.so.  Install
it somewhere.  Replace your current versions of as and ld.  Then
redo the kernel build.  If the same error occurs, we will have a
version that can be debugged.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
