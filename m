From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] -pie is broken on hppa
Date: Thu, 26 Jul 2007 17:13:07 -0400 (EDT)
Message-ID: <200707262113.l6QLD8ZB017056__4880.43001755631$1416624418$gmane$org@hiauly1.hia.nrc.ca>
References: <5b2e36650706110615g20d10f79ue2aa5b11b5fcb185@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 aurelien@aurel32.net
To: jbailey@raspberryginger.com (Jeff Bailey)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <5b2e36650706110615g20d10f79ue2aa5b11b5fcb185@mail.gmail.com>
	from "Jeff Bailey" at Jun 11, 2007 09:15:37 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> PIE's don't work on NPTL either, FWIW.

I did an apt-get upgrade today on one of my systems and noticed
that portmap is now segfaulting at the same spot as nscd (i.e.,
in _start).

I don't know much about the mechanics of pie applications but it
appears that the dynamic loader relocates them like shared libraries.
We don't seem to handle this correctly.

(gdb) break *0x1ad4
Breakpoint 1 at 0x1ad4
(gdb) r
Starting program: /sbin/portmap
Warning:
Cannot insert breakpoint 1.
Error accessing memory address 0x1ad4: Input/output error.

(gdb) disass 0x1ad4 0x1ae4
Dump of assembler code from 0x1ad4 to 0x1ae4:
0x00001ad4 <_init+1040>:        stw r0,-4(sp)
0x00001ad8 <_init+1044>:        stw rp,-14(sp)
0x00001adc <_init+1048>:        ldo 40(sp),sp
0x00001ae0 <_init+1052>:        stw sp,-4(sp)
(gdb) del 1
(gdb) r
The program being debugged has been started already.
Start it from the beginning? (y or n) y
Starting program: /sbin/portmap

Program received signal SIGSEGV, Segmentation fault.
0x41128af0 in ?? ()
(gdb) disass 0x41128ad4 0x41128b00
Dump of assembler code from 0x41128ad4 to 0x41128b00:
0x41128ad4:     stw r0,-4(sp)
0x41128ad8:     stw rp,-14(sp)
0x41128adc:     ldo 40(sp),sp
0x41128ae0:     stw sp,-4(sp)
0x41128ae4:     stw r19,-20(sp)
0x41128ae8:     stw r23,-38(sp)
0x41128aec:     addil L%4112b000,r19,r1
0x41128af0:     ldw -11c(r1),r26
0x41128af4:     ldw 0(r26),r26
0x41128af8:     addil L%4112b000,r19,r1
0x41128afc:     ldw -110(r1),r23
End of assembler dump.
(gdb) p/x $r19
$1 = 0x4112c694
(gdb) p/x $r1
$2 = 0x82257694

Note the offset in the addil insns and the PIC register value.  I see
this relocation with readelf:

00001aec  00000102 R_PARISC_DIR21L   000000f4   .interp + 3df0

This relocation can't be used in a relocatable executable.

We seem to now have a R_PARISC_DLTIND21L in Scrt1.o.  Possibly, portmap
just needs to be relinked.  On the otherhand, it appears to me that
binutils is broken and needs updating for pie.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
