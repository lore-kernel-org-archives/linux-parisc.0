Return-Path: <hppa-linux@puffingroup.com>
Message-Id: <199902161823.KAA01318@meow.sr.hp.com>
Subject: Re: [hppa-linux] Booting issues.
In-Reply-To: <Pine.LNX.3.96.990216121507.22132J-100000@devserv.devel.redhat.com> from Alex deVries at "Feb 16, 1999 12:18: 0 pm"
To: hppa-linux@puffingroup.com
Date: Tue, 16 Feb 1999 10:23:54 -0800 (PST)
From: Bill Katz <billk@sr.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Resent-Message-ID: <"7LcMP3.0.Dl4.6XRos"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

> 
> On Mon, 15 Feb 1999, Bill Katz wrote:
> > ISL knows more about LIF volumes, and can read an AUTOEXECUTE file
> > (a text file, call "AUTO" that contains the commands to execute 
> > to boot.  In the case of HPUX, it reads typically reads and executes 
> > a file called "HPUX" which is the secondary loader.  Note that 
> > with in HP this loader is often called "mongoose".
> 
> Right.  We should look at getting Linux to be able to write to LIF
> volumes.  I imagine the structure is reasonably simple.
> 
> How do you write to a LIF volume from hpux right now?

Typically you build a LIF volume in an ordinary UNIX file using
the LIF utilities: lifinit, lifcp, lifls, etc.  The following 
script builds a bootable LIF for offline diagnostics:

#! /bin/ksh -x
LIF_FILE=uxbootlf
/bin/rm -f $LIF_FILE

lifinit `./iplopt ISL` -v8000000 -d32 -nL2DIAG -K2 -s4096 $LIF_FILE

lifcp -r -T-12800  -K2 ISL             $LIF_FILE:ISL
lifcp -r -T-12289  -K2 AUTO            $LIF_FILE:AUTO
lifcp -r -T-12928  -K2 HPUX            $LIF_FILE:HPUX
lifcp -r -T-12960  -K2 ODE             $LIF_FILE:ODE
lifcp -r -T-12277  -K2 MAPFILE         $LIF_FILE:MAPFILE
lifcp -r -T-12280  -K2 SYSLIB          $LIF_FILE:SYSLIB
lifcp -r -T-12276  -K2 SLMOD           $LIF_FILE:SLMOD
liffcp -r -T-12279  -K2 LASIDIAG        $LIF_FILE:LASIDIAG
lifcp -r -T-12279  -K2 L2DIAG          $LIF_FILE:L2DIAG
lifcp -r -T-12279  -K2 MAPPER          $LIF_FILE:MAPPER 

Notice that there are different file types specified by the "-T"
switch to lifcp.  The types for ISL, AUto (and the rest, for that
matter) are important.

ISL must be the first thing in the lif.

> > HPUX know about the hpux file systems, and is able to find /hp-ux,
> > /stand/vmunix, or /linux-kernel or any other file within the 
> > file system.  To use this as a method of booting Linux, Linux
> > may need to be taught about hte hpux file system.  Or at least
> > somehow know how to find another partition.
> 
> That shouldn't be too difficult; I'm told HPUX uses BSD 4.2 filesystems,
> which I think we have drivers for already.

I believe the HPUX HFS is basically the BSD fast file system.  Obviously
the JFS, which is the Veritas  journalled file system is different.
I believe 10.3 (which was never released for workstations) and 11.0
are the only versions that know how to boot from JFS.

> 
> Thanks for the pointers.
> 

Anything I can do to help.

	-Bill

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
