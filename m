Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id B3A9A4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 09:27:15 -0600 (MDT)
Received: from sal.ucc.ie (sal.ucc.ie [143.239.201.201])
	by csmail.ucc.ie (8.11.3/8.11.3/SuSE Linux 8.11.1-0.5) with ESMTP id h3GFRF606505
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 16:27:15 +0100
Date: Wed, 16 Apr 2003 16:27:13 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0304161625010.28370-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Presicionbook ioscan
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

Hi PA,

I asked some other (new) owners of Presicionbooks to give me the output
of 'ioscan -f'. Here you go ...


---------- Forwarded message ----------
Date: Wed, 16 Apr 2003 11:22:37 -0400
From: Danny Duval
To: xam
Subject: re: Question from eBay Member


Class       I  H/W Path    Driver      S/W State   H/W Type     Description
============================================================================
bc          0              root        CLAIMED     BUS_NEXUS
bc          1  8           bc          CLAIMED     BUS_NEXUS    Pseudo Bus
Converter
ba          0  8/0         GSCtoPCI    CLAIMED     BUS_NEXUS    GSCtoPCI
Bridge
unknown    -1  8/0/1/0                 UNCLAIMED   UNKNOWN      PCI IDE
(10950643)
tty         1  8/0/63      asio0       CLAIMED     INTERFACE    Built-in
RS-232C
ba          1  8/16        bus_adapter CLAIMED     BUS_NEXUS    Core I/O
Adapter
ext_bus     1  8/16/0      CentIf      CLAIMED     INTERFACE    Built-in
Parallel Interface
audio       0  8/16/1      audio       CLAIMED     INTERFACE    Built-in
Audio
tty         0  8/16/4      asio0       CLAIMED     INTERFACE    Built-in
RS-232C
ext_bus     0  8/16/5      c720        CLAIMED     INTERFACE    Built-in
SCSI
target      0  8/16/5.0    tgt         CLAIMED     DEVICE
disk        0  8/16/5.0.0  sdisk       CLAIMED     DEVICE       ADTX
AXSITS2532R 014C
target      1  8/16/5.1    tgt         CLAIMED     DEVICE
disk        1  8/16/5.1.0  sdisk       CLAIMED     DEVICE       ADTX
AXSITS2532R 014C
target      2  8/16/5.7    tgt         CLAIMED     DEVICE
ctl         0  8/16/5.7.0  sctl        CLAIMED     DEVICE       Initiator
lan         0  8/16/6      lan2        CLAIMED     INTERFACE    Built-in LAN
ps2         0  8/16/7      ps2         CLAIMED     INTERFACE    Built-in
Keyboard/Mouse
pc          0  8/16/10     fdc         CLAIMED     INTERFACE    Built-in
Floppy Drive
graphics    0  8/24        graph3      CLAIMED     INTERFACE    Graphics
processor   0  62          processor   CLAIMED     PROCESSOR    Processor
memory      0  63          memory      CLAIMED     MEMORY       Memory
