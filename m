Return-Path: <hppa-linux@puffingroup.com>
Message-Id: <199902160606.WAA28977@meow.sr.hp.com>
Subject: Re: [hppa-linux] Booting issues.
In-Reply-To: <Pine.LNX.3.96.990215204544.22132E-100000@devserv.devel.redhat.com> from Alex deVries at "Feb 15, 1999  8:48:10 pm"
To: hppa-linux@puffingroup.com
Date: Mon, 15 Feb 1999 22:06:51 -0800 (PST)
From: Bill Katz <billk@sr.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Resent-Message-ID: <"dYTts.0.FV4.qjGos"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

> 
> 
> I was hoping someone could explain how booting works on HPs in the
> following ways:
> 
> - booting from disk; is it possible to put our boot image onto an existing
> hpux disk, and boot from that image?

It certainly should be.  A few notes on the booting process:

The bootROM, known as PDC only knows:

How to move bytes in from the disk (it starts at the beginning), to 
look thorugh those first bytes, and find the header for a LIF volume,
and to launch a program.  The program usually launched is ISL.

ISL knows more about LIF volumes, and can read an AUTOEXECUTE file
(a text file, call "AUTO" that contains the commands to execute 
to boot.  In the case of HPUX, it reads typically reads and executes 
a file called "HPUX" which is the secondary loader.  Note that 
with in HP this loader is often called "mongoose".

WHen we want to make a dual boot system, we can include both HPUX
and LILO (for instance) in the LIF volume, and then launch either 
operating system.

HPUX know about the hpux file systems, and is able to find /hp-ux,
/stand/vmunix, or /linux-kernel or any other file within the 
file system.  To use this as a method of booting Linux, Linux
may need to be taught about hte hpux file system.  Or at least
somehow know how to find another partition.


> 
> - booting over the network: if I understand correctly, my 715 can't do
> bootp, but does some other sort of network protocol.  What is it?  I'm
> told mklinux had a server hacked that could handle this, what is it, and
> where do we get it?

THe protocol is called RMP, and the requests are normally handled 
by rbootd.  From the rbootd man page:

      +  RMP/BOOTP:

         The RMP clients are the older s700 workstations and all DTCs:
         workstations:  705, 710, 715, 720, 725, 730, 735, 750, 755

         The BOOTP clients are the s712 and future workstations.

I don't know where to get documents on this protocol, but there
must be something around.

	-Bill

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
