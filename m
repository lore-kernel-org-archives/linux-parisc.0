Return-Path: <hppa-linux@puffingroup.com>
Date: Tue, 16 Feb 1999 08:32:41 -0800 (PST)
From: Jason Eckhardt <jason@equator.com>
Message-Id: <199902161632.IAA00701@gatekeeper.equator.com>
To: hppa-linux@puffingroup.com
Subject: Re: [hppa-linux] Booting issues.
Cc: jason@gatekeeper.equator.com
Resent-Message-ID: <"2Z5N8.0.ye4.IuPos"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

>
> I was hoping someone could explain how booting works on HPs in the
> following ways:
>
> - booting from disk; is it possible to put our boot image onto an existing
> hpux disk, and boot from that image?
>

  By "boot image" do you mean the bootstrap program or the kernel? I think
  we could load the (future) kernel from an HPUX disk via HP's ISL, but it
  would probably have to be in SOM format. Of course, I don't know for sure.

  Over the weekend I got a simple bootstrap program up on a clean, non-HPUX
  disk. It doesn't do much:
  It simply prints a message "HPPA/Linux bootstrap version 0.00" and then
  waits in a spin loop.
  It is a small step in that I now understand the
  boot process and can actually get the PDC to load and execute a bootstrap
  code. There is a small assembly stub which sets up a C-friendly runtime
  environment and then invokes a C subroutine to do I/O, etc. 
  I wrote a simple utility (like lifinit) which takes the bootstrap object,
  prepends a LIF header, and then places it on the boot sector.

  The next step is to get the simple bootstrap to load a kernel image. Maybe
  someone can help me understand what to do next. Issues:

    1. Should the bootloader be very simple and just load the kernel image
       from a known place on the disk, such as immediately following the
       bootstrap code (I believe the i386 version works this
       way, correct me if I'm wrong) or should we instead load the kernel from
       a Linux filesystem. The later
       is a bit of a pain as it means we must have a standalone version
       of a filesystem code in the bootloader (at least open, close, read,
       seek, stat). The Mklinux works this way -- the boot code is huge...it
       seems to me to be unnecessarily large and complex for a bootloader.

       The first idea is much easier, since we just read from the already
       open boot device (opened by the PDC) from a fixed location and then
       branch to the kernel code.

       Comments?

    2. How are disks "partitioned" on HPs. The bootloader, if it uses the
       scheme of loading the kernel from a linux filesystem, will have to
       also "understand" the partition of the disk.
       Does anyone know how the partitions are setup (i.e. partition table,
       or equivalent)? Is the partition scheme imposed by hardware or
       is this just a software convention? 



Thanks for your help, jason.

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
