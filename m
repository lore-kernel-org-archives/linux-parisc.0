From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] 64bit kernel & nfs module: Global Offset Table overflow (used 1068, allowed 1023)
Date: Wed, 18 Oct 2006 17:23:46 -0600
Message-ID: <20061018232346.GW22289@parisc-linux.org>
References: <200610182203.11413.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@parisc-linux.org>
To: Helge Deller <deller@gmx.de>
Return-Path: <willy@parisc-linux.org>
In-Reply-To: <200610182203.11413.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Oct 18, 2006 at 10:03:11PM +0200, Helge Deller wrote:
> With a 64bit Kernel (git head):
> 
> c3000:/home/cvs# modprobe nfs
> FATAL: Error inserting nfs (/lib/modules/2.6.19-rc2-pa0/kernel/fs/nfs/nfs.ko): Invalid argument
> 
> dmesg says:
> nfs: Global Offset Table overflow (used 1068, allowed 1023)
> 
> 
> In the source code arch/parisc/kernel/module.c I found:
> 
> /* Maximum number of GOT entries. We use a long displacement ldd from
>  * the bottom of the table, which has a maximum signed displacement of
>  * 0x3fff; however, since we're only going forward, this becomes
>  * 0x1fff, and thus, since each GOT entry is 8 bytes long we can have
>  * at most 1023 entries */
> #define MAX_GOTS        1023
> 
> Since I don't have any real idea about GOT and modules in general:
> Isn't it possible to increase this number for 64bit kernels ?

We'd need to make the GOT register point 0x2000 above where it currently
does.  Then we could use a signed +0x1fff / -0x2000 offset.

I have no idea how to make this happen.
