Return-Path: <hppa-linux@puffingroup.com>
Date: Tue, 16 Feb 1999 13:01:39 -0500 (EST)
From: Alex deVries <adevries@redhat.com>
To: hppa-linux@puffingroup.com
cc: jason@gatekeeper.equator.com
Subject: Re: [hppa-linux] Booting issues.
In-Reply-To: <199902161632.IAA00701@gatekeeper.equator.com>
Message-ID: <Pine.LNX.3.96.990216125227.22132L-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Resent-Message-ID: <"mRQ3E3.0.mi4.lBRos"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org


On Tue, 16 Feb 1999, Jason Eckhardt wrote:
> > I was hoping someone could explain how booting works on HPs in the
> > following ways:
> > - booting from disk; is it possible to put our boot image onto an existing
> > hpux disk, and boot from that image?
> 
>   By "boot image" do you mean the bootstrap program or the kernel? I think
>   we could load the (future) kernel from an HPUX disk via HP's ISL, but it
>   would probably have to be in SOM format. Of course, I don't know for sure.

Well, I meant kernel, but that may not have ben what I should have been
asking.

What's SOM?

>   Over the weekend I got a simple bootstrap program up on a clean, non-HPUX
>   disk. It doesn't do much:
>   It simply prints a message "HPPA/Linux bootstrap version 0.00" and then
>   waits in a spin loop.
>   It is a small step in that I now understand the
>   boot process and can actually get the PDC to load and execute a bootstrap
>   code. There is a small assembly stub which sets up a C-friendly runtime
>   environment and then invokes a C subroutine to do I/O, etc. 
>   I wrote a simple utility (like lifinit) which takes the bootstrap object,
>   prepends a LIF header, and then places it on the boot sector.

That's cool.  You might also want to have a look at openbsd's mkboot
utility; I know it prepares the LIF header, although the details are a
little complex.  I'll port it to Linux if you think it will help.

>   The next step is to get the simple bootstrap to load a kernel image. Maybe
>   someone can help me understand what to do next. Issues:
>     1. Should the bootloader be very simple and just load the kernel image
>        from a known place on the disk, such as immediately following the
>        bootstrap code (I believe the i386 version works this
>        way, correct me if I'm wrong) or should we instead load the kernel from
>        a Linux filesystem. The later
>        is a bit of a pain as it means we must have a standalone version
>        of a filesystem code in the bootloader (at least open, close, read,
>        seek, stat). The Mklinux works this way -- the boot code is huge...it
>        seems to me to be unnecessarily large and complex for a bootloader.
> 
>        The first idea is much easier, since we just read from the already
>        open boot device (opened by the PDC) from a fixed location and then
>        branch to the kernel code.
> 
>        Comments?

I'd say start with the first, then worry about the second later.  Having
the boot loader be able to read ext2 would be cool, but large.

>     2. How are disks "partitioned" on HPs. The bootloader, if it uses the
>        scheme of loading the kernel from a linux filesystem, will have to
>        also "understand" the partition of the disk.
>        Does anyone know how the partitions are setup (i.e. partition table,
>        or equivalent)? Is the partition scheme imposed by hardware or
>        is this just a software convention? 

I'd much prefer to use the partitioning scheme of HP-UX for Linux disks,
particularly because this would let us install Linux on disks that already
had HPUX on them.  However, just using pc-partitioning might be a quick
hack to make it work.

I imagine there's partition read code in either openbsd or mklinux.

- Alex

-- 
Alex deVries <puffin@redhat.com>     
Red Hat Contrib Net maintainer          
Ottawa, Canada  
HPPA/Linux Porting Team


----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
