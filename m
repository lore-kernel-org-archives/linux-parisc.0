Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA19250
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Dec 1999 10:11:26 -0700
Date: Thu, 30 Dec 1999 12:14:10 -0600 (CST)
From: <tom@piace.com>
To: Eric Schnoebelen <eric@cirr.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Thanks...alot 
In-Reply-To: <199912301653.KAA10459@opus.cirr.com>
Message-ID: <Pine.LNX.4.10.9912301207530.8282-100000@adam.piace.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

I was able to boot into single user mode, and edit the password file.  It
took a while to find a terminal program for my computer, that would let me
run vi correctly.  Thanks for all your help.

On Thu, 30 Dec 1999, Eric Schnoebelen wrote:

> 
> tom@piace.com writes:
> - 	Does anyone know if hp has a development version of hpux like
> - sun has with solaris?  If not does anyone know of a way to reset the
> - password from the console.
> 
> 	Depending upon the OS version and the settings, you
> should be able to boot the system to single user mode, and reset
> the password.  I'm a bit out of practice, but if you ``boot
> isl'', and then enter `/hp-ux -is' (for 9.0x) or `/stand/vmunix
> -is' (for 10.20), you should be get a single user prompt,
> without having to enter a password (later OS versions may
> require the root password to enter single user mode.)
> 
> - 	My only other idea is to find a diff scsi card that I can put
> - into my other linux box, and try to mount the root partions, and edit the
> - password file.  
> 
> 	That probably won't work, as the filesystem used by
> HP-UX is just enough different that Linux won't be able to mount
> it..  If it's a 10.20 or later system, running LVM, Linux
> _realy_ won't know what to do with it..
> 
> --
> Eric Schnoebelen		eric@cirr.com		http://www.cirr.com
> 	Have you ever noticed that the people who are always trying 
> 	to tell you, "There's a time for work and a time for play," 
> 			never find the time for play.
> 
