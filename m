Return-Path: <hppa-linux@puffingroup.com>
From: Barrie Spence <barrie@calvin.demon.co.uk>
Message-Id: <199902032248.XAA01375@calvin.demon.co.uk>
Date: Wed, 3 Feb 1999 22:48:39 +0000 (   )
To: hppa-linux@puffingroup.com
Reply-to: barrie@calvin.demon.co.uk
In-Reply-To: <Pine.LNX.3.96.990202151755.12373E-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: [hppa-linux] Background h/w info [Re: Some planning issues.]
Resent-Message-ID: <"Qo-vD3.0.CE6.DkEks"@burrow.puffingroup.com>
List-Id: linux-parisc.vger.kernel.org

Some hardware background stuff (all from memory)

  PA1.0 systems were early s800 systems - proprietary bus 
  architectures, HP-IB disks, etc.

  PA1.1 - introduced with workstations and Nova class s800,
  etc.

  PA2.0 - 64bit processor - lastest workstations and servers.

s800 servers

  Proprietary HP-PB (NIO) bus (8x7, E, F, G, H, I, T, K).

  Newer machines have EISA (D-class)

  Newer machines have GSC/HSC (HP proprietary)

  Newest machines have PCI (V-class)


s700 series (generations are my terminology)

  Original 'snakes' (PA7000 ?)
    705 710 720 730 750

  Second generation (PA7100)
    735 755
    715/33 715/50 715/75
    725/50 725/75
    735/125 755/125

  Third generation (PA7100LC)
    712/60 712/60 712/100
    715/64 715/80 715/100 715/100XC
    725/100

  Fourth Generation (PA7200/PA7300?)
    C100/C110/C160L
    J...

  ... and then we get into the PA2.0 systems.
 

 s700 & s800 hardware commonality:

    - early PA1.1 systems - next to nothing

    - PA7100LC was used in 712's, 2nd generation 715's & E-series.

    - J-series workstations and K-series servers have more in common.
 
    - C-series workstations and D-series servers are similar.

    - newer stuff blurs more.

 s700 workstations in depth

    EISA bus until recently, transitioning to GSC/HSC and PCI.

    Core colour graphics in early machines should be the same.
    Graphics started to change with the introduction of the 
    712's and the second generation 715's. Mono graphics were
    default on 705s, optional on 720, 730, etc.
    
    Earlier workstations used HP-HIL for input devices (keyboard
    & mouse). PS/2 was available on 712s and second generation
    715's (also supported HIL).

    The early workstations used SE SCSI via an NCR (Symbios)
    controller. I think that is also true of the Fast Wide 
    Differential introduced in the 735's, etc.

    The original on-board 10Mbits/s ethernet uses an Intel 
    chipset. I think the newer 10/100 machines use a the
    DEC (Tulip?) hardware.

    The 712's and second generation 715's integrated more
    of the peripherals on fewer chips - this changes the
    second serial port, etc. 

Some opinions I'd like to voice early on:

s700 vs s800

  - they both use HP-PA, but until recently they are very 
    different beasts, so I doubt that we will be able to 
    do much with the older s800 machines for a while. A 
    D is very similar to a s700, but an older s800 is 
    very different. A s700 port shouldn't preclude s800 
    support, but this will only happen once we have a kernel
    which will run on a PA7100LC 71x, which might then have 
    a chance of running on an E-series (HP-PB bus) or 
    D-series.
    

HP-PA 1.0 vs 1.1 vs 2.0

  Let's forget PA1.0 systems - all workstations are PA1.1.

  PA2.0 is 64bit and will only cause complications, especially 
  in the area of peripheral support on the newer systems. Leave
  this for later.

My suggested goals:

   1/ support for the earliest workstations - including SCSI, 
      networking & graphics.

   1a/ support FWD SCSI.

   2/ support for PA7100LC workstations (712s, newer 715s)

   3/ then expand this to look at all the other hardware.

I can bring a 715/33 and a 712/80 to the party. If my next job
lets me live at home, I can probably also support some remote 
access to the machines (probably via ISDN).

I've got lots of (HP-internal) experience administering and supporting
this stuff, so feel free to ask.

Barrie

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
