Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12508.mail.yahoo.com (web12508.mail.yahoo.com [216.136.173.200])
	by dsl2.external.hp.com (Postfix) with SMTP id 6992C4845
	for <parisc-linux@lists.parisc-linux.org>; Thu,  2 Oct 2003 17:38:02 -0600 (MDT)
Message-ID: <20031002233801.23113.qmail@web12508.mail.yahoo.com>
Date: Thu, 2 Oct 2003 16:38:01 -0700 (PDT)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] L2000/N4000 smp devices/boot compare??
To: Joel Soete <soete.joel@tiscali.be>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <3F5CB6FB0000C2D7@ocpmta1.freegates.net>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-413995158-1065137881=:22889"
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

--0-413995158-1065137881=:22889
Content-Type: text/plain; charset=us-ascii

Joel,
 
First off, since the N, L, and A class are of the same generation of machines they are similar in some respects.  Different in others.  The L1000 and L2000 have a system card unique to that set of machines.  Being that as it is, the L1000/2000 probably use a different I/O interface chip.  The L1500 and L3000 are in essence an N Class system card cut in half and therefore use the same I/O interface as the N.  The GSP in the L Class resides in the PCI card cage with the GSP in the N Class is a seperate card attaching directly to the system card via the hot swap disk backplane.  The extra unknown system buses probably reside on the GSP of the N Class.  That would be my educated guess of what the unknown system buses are.  The N has two IKEs since it has both a left and a right PCI card cage attached directly to the system board.
 
Derek

Joel Soete <soete.joel@tiscali.be> wrote:
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


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

---------------------------------
Do you Yahoo!?
The New Yahoo! Shopping - with improved product search
--0-413995158-1065137881=:22889
Content-Type: text/html; charset=us-ascii

<DIV>Joel,</DIV>
<DIV>&nbsp;</DIV>
<DIV>First off, since the N, L, and A class are of the same generation of machines they are similar in some respects.&nbsp; Different in others.&nbsp; The L1000 and L2000 have a system card unique to that set of machines.&nbsp; Being that as it is, the L1000/2000 probably use a different I/O interface chip.&nbsp; The L1500 and L3000 are in essence an N Class system card cut in half and therefore use the same I/O interface as the N.&nbsp; The GSP in the L Class resides in the PCI card cage with the GSP in the N Class is a seperate card attaching directly to the system card via the hot swap disk backplane.&nbsp; The extra unknown system buses probably reside on the GSP of the N Class.&nbsp; That would be my educated guess of what the unknown system buses are.&nbsp; The N has two IKEs since it has both a left and a right PCI card cage attached directly to the system board.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Derek</DIV>
<DIV><BR><B><I>Joel Soete &lt;soete.joel@tiscali.be&gt;</I></B> wrote:</DIV>
<BLOCKQUOTE class=replbq style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">Hi all,<BR><BR>Sorry if annoying with smp but I have an opportunity to test an hypothesis:<BR>2.4 64bits smp capability would work on a L2000 (because it works on a A500)<BR><BR>Yes it works (I just compile a kernel (while a 'top' showing me cc1 switching<BR>from <BR>pu1 to cpu2 to cpu1...) because I just have it for some hours).<BR><BR>And I compare devices found:<BR><BR>[...]<BR>model 9000/800/L2000-44<BR>[...]<BR>Searching for devices:<BR>Found devices:<BR>1. Rhapsody 440 (0) at 0xfffffffffffa0000 [160], versions 0x5c4, 0x0, 0x4<BR><BR>2. Rhapsody 440 (0) at 0xfffffffffffa6000 [166], versions 0x5c4, 0x0, 0x4<BR>3. Astro BC Runway Port (12) at 0xfffffffffed00000 [0], versions 0x582,<BR>0x0, 0xb<BR>4. Elroy PCI Bridge (13) at 0xfffffffffed30000 [0/0], versions 0x782, 0x0,<BR>0xa<BR>5. Elroy PCI <BR>ridge (13) at 0xfffffffffed32000 [0/1], versions 0x782, 0x0,<BR>0xa<BR>6. Elroy PCI
 Bridge (13) at 0xfffffffffed34000 [0/2], versions 0x782, 0x0,<BR>0xa<BR>7. Elroy PCI Bridge (13) at 0xfffffffffed36000 [0/3], versions 0x782, 0x0,<BR>0xa<BR>8. Elroy PCI Bridge (13<BR>at 0xfffffffffed38000 [0/4], versions 0x782, 0x0,<BR>0xa<BR>9. Elroy PCI Bridge (13) at 0xfffffffffed3a000 [0/5], versions 0x782, 0x0,<BR>0xa<BR>10. Elroy PCI Bridge (13) at 0xfffffffffed3c000 [0/6], versions 0x782, 0x0,<BR>0xa<BR>11. Elroy PCI Bridge (13) at 0xf<BR>fffffffed3e000 [0/7], versions 0x782, 0x0,<BR>0xa<BR>12. Memory (1) at 0xfffffffffed08000 [8], versions 0x95, 0x0, 0x9<BR>CPU(s): 2 x PA8500 (PCX-W) at 440.000000 MHz<BR>SBA found Astro 2.1 at 0xfffffffffed00000<BR>[...]<BR><BR><BR>[...]<BR>model 9000/800/N4000-55<BR>[...<BR><BR>Searching for devices...<BR>Found devices:<BR>1. Memory (1) at 0xfffffffffedc0000 [192], versions 0x90, 0x0, 0x9<BR>2. IKE I/O Bus Converter Merced Port (7) at 0xfffffffffed00000 [0], versions<BR>0x803, 0x0, 0xc<BR>3. Elroy PCI Bridge (13) at 0xffffffffbffe000
 [0/0], versions 0x782, 0x0,<BR>0xa<BR>4. Elroy PCI Bridge (13) at 0xffffffffbffe2000 [0/1], versions 0x782, 0x0,<BR>0xa<BR>5. Elroy PCI Bridge (13) at 0xffffffffbffe4000 [0/2], versions 0x782, 0x0,<BR>0xa<BR>6. Elroy PCI Bridge (13) at 0xffffffffbffe8000 [0/4], versions 0x782, 0x0,<BR>0xa<BR>7. Elroy PCI Bridge (13) at 0xffffffffbffea000 [0/5], versions 0x782, 0x0,<BR>0xa<BR>8. Elroy PCI Bridge (13) at 0xffffffffbfff0000 [0/8], versions 0x782, 0x0,<BR>0xa<BR>9. Elroy PCI Bridge (13) at 0xffffffffbfff4000 [0/10], versions 0x782, 0x0,<BR>0xa<BR>10. Elroy PCI Bridge (13) at 0xffffffffbfff8000 [0/12], versions 0x782, 0x0,<BR><BR>0xa<BR>11. IKE I/O Bus Converter Merced Port (7) at 0xfffffffffed40000 [1], versions<BR>0x803, 0x0, 0xc<BR>12. Elroy PCI Bridge (13) at 0xfffffffffece0000 [1/0], versions 0x782, 0x0,<BR>0xa<BR>13. Elroy PCI Bridge (13) at 0xfffffffffece4000 [1/2], versions 0x782, 0x0,<BR>0xa<BR>14. Elroy PCI Bridge (13) at 0xfffffffffece8000 [1/4], versions 0x782,
 0x0,<BR>0xa<BR>15. Elroy PCI Bridge (13) at 0xfffffffffecf0000 [1/8], versions 0x782, 0x0,<BR>0xa<BR>16. Elroy PCI Bridge (13) at 0xfffffffffecf4000 [1/10], versions 0x782, 0x0,<BR><BR>0xa<BR>17. Elroy PCI Bridge (13) at 0xfffffffffecf8000 [1/12], versions 0x782, 0x0,<BR><BR>0xa<BR>18. DEW BC Runway Port (7) at 0xfffffffffed24000 [36], versions 0x584, 0x0,<BR>0xc<BR>19. Unknown machine (0) at 0xfffffffffed25000 [37], versions 0x5d3, 0x0,<BR>0x0<BR>20. DEW BC Runway Port (7) at 0xfffffffffed2c000 [44], versions 0x584, 0x0,<BR>0xc<BR>21. Unknown machine (0) at 0xfffffffffed2d000 [45], versions 0x5d3, 0x0,<BR>0x0<BR><BR>CPU(s): 2 x PA8600 (PCX-W+) at 550.000000 MHz<BR>SBA found Ike rev 2 at 0xfffffffffed00000<BR>SBA found Ike rev 2 at 0xfffffffffed40000<BR>[...]<BR><BR>(trust me it exactly the same kernel on the same sys disk)<BR><BR>And so notice some differences (may be some one h<BR>ve no matter, please advise):<BR>on the L2k it first discver CPUs:<BR>1. Rhapsody 440 (0) at
 0xfffffffffffa0000 [160], versions 0x5c4, 0x0, 0x4<BR>2. Rhapsody 440 (0) at 0xfffffffffffa6000 [166], versions 0x5c4, 0x0, 0x4<BR><BR>on the N4k latter:<BR>18. DEW BC Runway Port (7) at 0xfffffffffed24000 [36], versions 0x584, 0x0,<BR>0xc<BR>19. Unknown machine (0) at 0xfffffffffed25000 [37], versions 0x5d3, 0x0,<BR>0x0<BR>20. DEW BC Runway Port (7) at 0xfffffffffed2c000 [44], versions 0x584, 0x0,<BR>0xc<BR>21. Unknown machine (0) at 0xfffffffffed2d000 [45], versions 0x5d3, 0x0,<BR>0x0<BR><BR>and there are 'Unknown machine'?<BR><BR>But most _important_ (imho): SBA type and/or number;<BR>on the L2k _ONE_<BR>3. Astro BC Runway Port (12) at 0xfffffffffed00000 [0], versions 0x582,<BR>0x0, 0xb<BR><BR>on the N4k _TWO_<BR>2. IKE I/O Bus Converter Merced Port (7) at 0xfffffffffed00000 [0], versions<BR>0x803, 0x0, 0xc<BR>[...]<BR>11. IKE I/O Bus Converter Merced Port (7) at 0xfffffffffed40000 [1], versions<BR>0x803, 0x0, 0xc<BR><BR>And I trust that it is not the number of SBA which is most
 important difference<BR>but well the type because iirc Grant mentioned that this is the same pb<BR>on L3000 on which there are only one IKE type of SBA?<BR><BR>Am i wrong/right?<BR><BR>Is there any additional info about this SBA?<BR><BR>Thanks in advance for all advises,<BR>Joel<BR><BR><BR><BR><BR>-------------------------------------------------------------------------<BR>L'Internet rapide, c'est pour tout le monde. Tiscali ADSL, 19,50 Euro<BR>pendant 3 mois! http://reg.tiscali.be/default.asp?lg=fr <BR><BR><BR>_______________________________________________<BR>parisc-linux mailing list<BR>parisc-linux@lists.parisc-linux.org<BR>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux</BLOCKQUOTE><p><hr SIZE=1>
Do you Yahoo!?<br>
<a href="http://shopping.yahoo.com/?__yltc=s%3A150000443%2Cd%3A22708228%2Cslk%3Atext%2Csec%3Amail">The New Yahoo! Shopping</a> - with improved product search
--0-413995158-1065137881=:22889--
