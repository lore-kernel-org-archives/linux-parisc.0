Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id AF4754845
	for <parisc-linux@lists.parisc-linux.org>; Thu,  2 Oct 2003 10:53:33 -0600 (MDT)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout1.tiscali.be with esmtp (Tiscali)
	id 1A56ho-0000dw-00
	for <parisc-linux@lists.parisc-linux.org>; Thu, 02 Oct 2003 18:53:32 +0200
Date: Thu, 2 Oct 2003 18:53:30 +0200
Message-ID: <3F5CB6FB0000C2D7@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] L2000/N4000 smp devices/boot compare??
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi all,

Sorry if annoying with smp but I have an opportunity to test an hypothesis:
2.4 64bits smp capability would work on a L2000 (because it works on a A500)

Yes it works (I just compile a kernel (while a 'top' showing me cc1 switching
from 
pu1 to cpu2 to cpu1...) because I just have it for some hours).

And I compare devices found:

[...]
model 9000/800/L2000-44
[...]
Searching for devices:
Found devices:
1. Rhapsody 440 (0) at 0xfffffffffffa0000 [160], versions 0x5c4, 0x0, 0x4

2. Rhapsody 440 (0) at 0xfffffffffffa6000 [166], versions 0x5c4, 0x0, 0x4
3. Astro BC Runway Port (12) at 0xfffffffffed00000 [0], versions 0x582,
0x0, 0xb
4. Elroy PCI Bridge (13) at 0xfffffffffed30000 [0/0], versions 0x782, 0x0,
0xa
5. Elroy PCI 
ridge (13) at 0xfffffffffed32000 [0/1], versions 0x782, 0x0,
0xa
6. Elroy PCI Bridge (13) at 0xfffffffffed34000 [0/2], versions 0x782, 0x0,
0xa
7. Elroy PCI Bridge (13) at 0xfffffffffed36000 [0/3], versions 0x782, 0x0,
0xa
8. Elroy PCI Bridge (13
 at 0xfffffffffed38000 [0/4], versions 0x782, 0x0,
0xa
9. Elroy PCI Bridge (13) at 0xfffffffffed3a000 [0/5], versions 0x782, 0x0,
0xa
10. Elroy PCI Bridge (13) at 0xfffffffffed3c000 [0/6], versions 0x782, 0x0,
0xa
11. Elroy PCI Bridge (13) at 0xf
fffffffed3e000 [0/7], versions 0x782, 0x0,
0xa
12. Memory (1) at 0xfffffffffed08000 [8], versions 0x95, 0x0, 0x9
CPU(s): 2 x PA8500 (PCX-W) at 440.000000 MHz
SBA found Astro 2.1 at 0xfffffffffed00000
[...]


[...]
model 9000/800/N4000-55
[...

Searching for devices...
Found devices:
1. Memory (1) at 0xfffffffffedc0000 [192], versions 0x90, 0x0, 0x9
2. IKE I/O Bus Converter Merced Port (7) at 0xfffffffffed00000 [0], versions
0x803, 0x0, 0xc
3. Elroy PCI Bridge (13) at 0xffffffffbffe000 [0/0], versions 0x782, 0x0,
0xa
4. Elroy PCI Bridge (13) at 0xffffffffbffe2000 [0/1], versions 0x782, 0x0,
0xa
5. Elroy PCI Bridge (13) at 0xffffffffbffe4000 [0/2], versions 0x782, 0x0,
0xa
6. Elroy PCI Bridge (13) at 0xffffffffbffe8000 [0/4], versions 0x782, 0x0,
0xa
7. Elroy PCI Bridge (13) at 0xffffffffbffea000 [0/5], versions 0x782, 0x0,
0xa
8. Elroy PCI Bridge (13) at 0xffffffffbfff0000 [0/8], versions 0x782, 0x0,
0xa
9. Elroy PCI Bridge (13) at 0xffffffffbfff4000 [0/10], versions 0x782, 0x0,
0xa
10. Elroy PCI Bridge (13) at 0xffffffffbfff8000 [0/12], versions 0x782, 0x0,

0xa
11. IKE I/O Bus Converter Merced Port (7) at 0xfffffffffed40000 [1], versions
0x803, 0x0, 0xc
12. Elroy PCI Bridge (13) at 0xfffffffffece0000 [1/0], versions 0x782, 0x0,
0xa
13. Elroy PCI Bridge (13) at 0xfffffffffece4000 [1/2], versions 0x782, 0x0,
0xa
14. Elroy PCI Bridge (13) at 0xfffffffffece8000 [1/4], versions 0x782, 0x0,
0xa
15. Elroy PCI Bridge (13) at 0xfffffffffecf0000 [1/8], versions 0x782, 0x0,
0xa
16. Elroy PCI Bridge (13) at 0xfffffffffecf4000 [1/10], versions 0x782, 0x0,

0xa
17. Elroy PCI Bridge (13) at 0xfffffffffecf8000 [1/12], versions 0x782, 0x0,

0xa
18. DEW BC Runway Port (7) at 0xfffffffffed24000 [36], versions 0x584, 0x0,
0xc
19. Unknown machine (0) at 0xfffffffffed25000 [37], versions 0x5d3, 0x0,
0x0
20. DEW BC Runway Port (7) at 0xfffffffffed2c000 [44], versions 0x584, 0x0,
0xc
21. Unknown machine (0) at 0xfffffffffed2d000 [45], versions 0x5d3, 0x0,
0x0

CPU(s): 2 x PA8600 (PCX-W+) at 550.000000 MHz
SBA found Ike rev 2 at 0xfffffffffed00000
SBA found Ike rev 2 at 0xfffffffffed40000
[...]

(trust me it exactly the same kernel on the same sys disk)

And so notice some differences (may be some one h
ve no matter, please advise):
on the L2k it first discver CPUs:
1. Rhapsody 440 (0) at 0xfffffffffffa0000 [160], versions 0x5c4, 0x0, 0x4
2. Rhapsody 440 (0) at 0xfffffffffffa6000 [166], versions 0x5c4, 0x0, 0x4

on the N4k latter:
18. DEW BC Runway Port (7) at 0xfffffffffed24000 [36], versions 0x584, 0x0,
0xc
19. Unknown machine (0) at 0xfffffffffed25000 [37], versions 0x5d3, 0x0,
0x0
20. DEW BC Runway Port (7) at 0xfffffffffed2c000 [44], versions 0x584, 0x0,
0xc
21. Unknown machine (0) at 0xfffffffffed2d000 [45], versions 0x5d3, 0x0,
0x0

and there are 'Unknown machine'?

But most _important_ (imho): SBA type and/or number;
on the L2k _ONE_
3. Astro BC Runway Port (12) at 0xfffffffffed00000 [0], versions 0x582,
0x0, 0xb

on the N4k _TWO_
2. IKE I/O Bus Converter Merced Port (7) at 0xfffffffffed00000 [0], versions
0x803, 0x0, 0xc
[...]
11. IKE I/O Bus Converter Merced Port (7) at 0xfffffffffed40000 [1], versions
0x803, 0x0, 0xc

And I trust that it is not the number of SBA which is most important difference
but well the type because iirc Grant mentioned that this is the same pb
on L3000 on which there are only one IKE type of SBA?

Am i wrong/right?

Is there any additional info about this SBA?

Thanks in advance for all advises,
    Joel




-------------------------------------------------------------------------
L'Internet rapide, c'est pour tout le monde. Tiscali ADSL, 19,50 Euro
pendant 3 mois! http://reg.tiscali.be/default.asp?lg=fr 
