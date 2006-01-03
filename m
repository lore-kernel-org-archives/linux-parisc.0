From: "Craig D. Lansing" <clansing@charter.net>
Subject: RE: [parisc-linux] J2240 - Almost there....
Date: Mon, 2 Jan 2006 21:01:05 -0500
Message-ID: <000501c61009$8ef37db0$3401a8c0@POGO>
References: <20060101063243.GA16296@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: "'Grant Grundler'" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060101063243.GA16296@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I finally got the getty to work on HP-UX.  Here's the ioscan -fk output:

Class       I  H/W Path      Driver      S/W State   H/W Type
Description
============================================================================
==
bc          0                root        CLAIMED     BUS_NEXUS    
bc          1  8             ccio        CLAIMED     BUS_NEXUS    I/O
Adapter
ba          0  8/0           GSCtoPCI    CLAIMED     BUS_NEXUS    PCI Bus
Bridge
 - GSCtoPCI
unknown    -1  8/0/3/0                   UNCLAIMED   UNKNOWN
PCI(10110019) 
-- 3
lan         1  8/0/4/0       fddi4       CLAIMED     INTERFACE    PCI FDDI
Adapt
er
tty         0  8/0/63        asio0       CLAIMED     INTERFACE    Built-in
RS-23
2C
ba          1  8/4           GSCtoPCI    CLAIMED     BUS_NEXUS    PCI Bus
Bridge
 - GSCtoPCI
ext_bus     0  8/4/19/0      c720        CLAIMED     INTERFACE    Ultra2
Wide SC
SI
target      0  8/4/19/0.5    tgt         CLAIMED     DEVICE       
disk        0  8/4/19/0.5.0  sdisk       CLAIMED     DEVICE       IBM
DDRS-3
9130WS
target      1  8/4/19/0.6    tgt         CLAIMED     DEVICE       
disk        1  8/4/19/0.6.0  sdisk       CLAIMED     DEVICE       IBM
DDRS-3
9130WS
target      2  8/4/19/0.7    tgt         CLAIMED     DEVICE       
ctl         0  8/4/19/0.7.0  sctl        CLAIMED     DEVICE       Initiator
lan         0  8/4/20/0      btlan3      CLAIMED     INTERFACE
PCI(10110019) 
-- Built-in #2
ba          2  8/12          bus_adapter CLAIMED     BUS_NEXUS    Core I/O
Adapt
er
ext_bus     2  8/12/0        CentIf      CLAIMED     INTERFACE    Built-in
Paral
lel Interface
audio       0  8/12/1        audio       CLAIMED     INTERFACE    Built-in
Audio

ext_bus     1  8/12/5        c720        CLAIMED     INTERFACE    Built-in
SCSI
target      3  8/12/5.2      tgt         CLAIMED     DEVICE       
disk        2  8/12/5.2.0    sdisk       CLAIMED     DEVICE       TOSHIBA
CD-ROM
 XM-5701TA
target      4  8/12/5.3      tgt         CLAIMED     DEVICE       
tape        0  8/12/5.3.0    stape       CLAIMED     DEVICE       HP
C1537A

target      5  8/12/5.7      tgt         CLAIMED     DEVICE       
ctl         1  8/12/5.7.0    sctl        CLAIMED     DEVICE       Initiator
ps2         0  8/12/7        ps2         CLAIMED     INTERFACE    Built-in
Keybo
ard/Mouse
bc          2  10            ccio        CLAIMED     BUS_NEXUS    I/O
Adapter
ba          3  10/4          GSCtoPCI    CLAIMED     BUS_NEXUS    PCI Bus
Bridge
 - GSCtoPCI
graphics    0  10/4/0/0      graph3      CLAIMED     INTERFACE
PCI(103c1005) 
-- 0
tty         1  10/4/63       asio0       CLAIMED     INTERFACE    Built-in
RS-23
2C
processor   0  32            processor   CLAIMED     PROCESSOR    Processor
processor   1  34            processor   CLAIMED     PROCESSOR    Processor
memory      0  49            memory      CLAIMED     MEMORY       Memory

-----Original Message-----
From: Grant Grundler [mailto:grundler@parisc-linux.org] 
Sent: Sunday, January 01, 2006 1:33 AM
To: Craig D. Lansing
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] J2240 - Almost there....

On Sat, Dec 31, 2005 at 11:21:06PM -0500, Craig D. Lansing wrote:
> Duh!!!  Can you tell that it has been a long time since I've had a "real"
> computer to play with?
> 
> Anyway, I now have a dual-boot (HP-UX 10 / Debian Linux) J2240.
> 
> Here's what SAM thinks is in the system:

"ioscan -fk" is the preferred output and I can
better understand what is in the box.
I don't understand what's really built-in or add-on
with the SAM output.

thanks,
grant

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
