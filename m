Return-Path: <hppa-linux@puffingroup.com>
Date: Tue, 16 Feb 1999 12:18:00 -0500 (EST)
From: Alex deVries <adevries@redhat.com>
To: hppa-linux@puffingroup.com
Subject: Re: [hppa-linux] Booting issues.
In-Reply-To: <199902160606.WAA28977@meow.sr.hp.com>
Message-ID: <Pine.LNX.3.96.990216121507.22132J-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Resent-Message-ID: <"WGr4G3.0.xf4.oYQos"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org


On Mon, 15 Feb 1999, Bill Katz wrote:
> ISL knows more about LIF volumes, and can read an AUTOEXECUTE file
> (a text file, call "AUTO" that contains the commands to execute 
> to boot.  In the case of HPUX, it reads typically reads and executes 
> a file called "HPUX" which is the secondary loader.  Note that 
> with in HP this loader is often called "mongoose".

Right.  We should look at getting Linux to be able to write to LIF
volumes.  I imagine the structure is reasonably simple.

How do you write to a LIF volume from hpux right now?

> HPUX know about the hpux file systems, and is able to find /hp-ux,
> /stand/vmunix, or /linux-kernel or any other file within the 
> file system.  To use this as a method of booting Linux, Linux
> may need to be taught about hte hpux file system.  Or at least
> somehow know how to find another partition.

That shouldn't be too difficult; I'm told HPUX uses BSD 4.2 filesystems,
which I think we have drivers for already.

Thanks for the pointers.

- Alex

-- 
Alex deVries <puffin@redhat.com>     
Red Hat Contrib Net maintainer          
Ottawa, Canada  
HPPA/Linux Porting Team



----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
