Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA27253
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Nov 1999 01:26:59 -0700
Sender: phi@hpfrcu81.france.hp.com
Message-ID: <38311538.30826FC7@hpfrcu03.france.hp.com>
Date: Tue, 16 Nov 1999 09:26:32 +0100
From: Philippe Benard <phi@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: frowand@cup.hp.com
Cc: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        parisc-linux@thepuffingroup.com,
        Alex deVries <adevries@thepuffingroup.com>
Subject: Re: [parisc-linux] depi?
References: <Pine.LNX.4.10.9911150307300.7996-100000@vodka.thepuffingroup.com> <199911150736.XAA14959@opus.allegro.com> <19991115092549.G30917@mathe.stud.uni-erlangen.de> <383093DE.A8B73CE4@hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Frank Rowand wrote:
> 
> 
> This is just one of several recent messages dealing with the issues caused by
> locating the kernel at virtual address 0xc0000000 instead of 0x00000000.  I
> still don't understand why the kernel can't be at zero, even though several
> people have tried to explain it to me.  Can anyone provide a clear
> explanation?
> 

I asked this question (and provided examples) 4 or 6 monthes ago. I never got
answered, I asked for kernel VAS description for 32 and 64 bits, and I asked
for user process VAS too and yet got no answer.

If I understood correctly, the kernel is located there because it is where it
is on PC.

Sounds like linux is not more portable than any other propriaitary OS since
confined to PC architecture, a port beeing a mimic of PC if the target arch
can do it.

I'm not an HP-PA architecture fan, not orthogonal enough, but the architecture
is what is is and IMHO, due to our cache design (+tlb) that is a virtual
cache, the OS run in virtual mode (most of the time) except sometime, or
except for a given set of data structures, for those exceptional code and
data, the equivalently mapped is the easiest and cleanest solution (again due
to hppa, not in absolute). I think getting away from equiv map, and moving the
kernel text far in the kernel VAS is a source of lot of problems. On the other
hand keeping equiv map mean kernel text in low phys mem addr to be runable on
tiny WS machine like a C3000 with few megs of main memory up to a 8 node
servers with 256 Gb of main memory. (oops kidding we are talking 712 16 Meg
here :-)

Now if linux design can't survive the kernel TEXT relocation to low addr we
definitly are in a dead lock. I mean since I got no answer about kernel VAS
description the few thing I see here doesn't looks like it will run on hppa2.0
in wide mode, then all this effort of what so called 'porting' has to be
redone again for pa2.0 (or abandoned in favor of IA64?). The number of PA2.0
out there goes up and up and being able to run wide on those machine sounds
ledgit.

All thise is pure ignorance from me, 'may be' the current linux design with
kernel at 0xc0000000 make sense in a WIDE kernel but it is unclear to me....

As i said in a previous mail we have two choice here, mimic closely the PC up
to the endianism for instance, to be able to grab as much stuff as possible
from the PC world but ultimatly we will not be able to run PC-linux
executable, then being that close doesn't looks that important. On the other
hand being as close as HPUX (and HP dependend stuff like PDC) could allow to
be able to dual boot vmunix/vmlinux, to run hpux a.out onto vmlinux to
laverage current hp software (if any) etc... being close to hp design is
somewhat having the kernel in low phys addr.

Not sure what I'm saying is completly valid, this is just feeling...

Phi
