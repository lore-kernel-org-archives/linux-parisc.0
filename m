Return-Path: <hppa-linux@puffingroup.com>
Message-Id: <199902041101.MAA13345@be3334.schering.de>
From: "Strelow, Ulrich" <Ulrich.Strelow@Schering.DE>
To: hppa-linux@puffingroup.com
Date: Thu, 4 Feb 1999 11:59:00 +0100 
MIME-Version: 1.0
Content-Type: text/plain
Subject: [hppa-linux] Cross compile setup
Resent-Message-ID: <"vzIO_.0.Bs6.MWPks"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

     Hi,
     
     I am very interested that someone finally tries to do a native port
of 
     Linux for PA-RISC. At work I have an old HP 715/33 workstation (the

     *one* machine that is not supported by mk-linux) which I would like
to 
     run linux on.
     
     OSF has never managed to get the mach kernel booting on that box
and 
     my question about the problems were answered that is has something
to 
     do with the ethernet chip.
     
     Some months ago I tried to cross-compile the mach-kernel under 
     Linux-x86. For private purposes I have bought a SCSI-MOD-drive
which 
     serves as the data transfer media between my home PC running linux
and 
     the HP 715/33 at work.
     
     I was not very successful with that cross-compiled mach-kernel.
After  
     booting the only messages I saw were from the secondary boot
loader: 
     
     OSF Mach boot
     [/mach]: -a
     text (0x11000) at 0x11000
     data (0x92610) at 0x5
     
     Then the machine stops with the LEDs 123568 on which means "HPMC
due 
     to Bus Error".
     
     Unfortunately no one on the mklinux mailing list had any help for
that 
     problem (probably because the main developers were no longer
working 
     on/with mk-linux).
     
     So my question here is the following:
     
     Is the hppa-linux cross-compile setup for binutils and egcs 
     possible from linux-x86 ?  
     
     If yes I would like to take part on the project as an "early
pre-alpha 
     stage"-tester :) in case you need one.
     
     Ulrich
     ----------------------
     Ulrich Strelow <ulrich.strelow@schering.de or
ulrich_strelow@csi.com>
     Berlin, Germany
      

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
