Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id D5C4F4829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Mar 2003 01:02:33 -0700 (MST)
Received: from sal.ucc.ie (sal.ucc.ie [143.239.201.201])
	by csmail.ucc.ie (8.11.3/8.11.3/SuSE Linux 8.11.1-0.5) with ESMTP id h2U82Ws14649
	for <parisc-linux@lists.parisc-linux.org>; Sun, 30 Mar 2003 09:02:32 +0100
Date: Sun, 30 Mar 2003 09:02:31 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.44.0303300852030.25173-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] RDI Tadpole Precisionbook and Linux/PA-RISC
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

Hi,

I just wonder whether somebody has experience in running Linux on
a Precisionbook (which is the equivalent to a B-Class machine according
to Tadpole). According to OpenPA.net it contains the following chips:

LASI ASIC, which features:
- NCR 53c710 8-bit single-ended SCSI-2
- Intel 82596CA 10Mb Ethernet controller
- WD 16C522 compatible parallel
- Harmony CD/DAT quality 16-bit audio
- NS 16550A compatible serial
Dino PCI bus-adaptor
Visualize EG (Graffiti) graphics with 2MB memory
1MB flash memory
Intel 82503 Ethernet transceiver, media auto-selection
CS4215 or AD1849 programmable CODECs
WD37C65C Floppy controller


As far as I can see the only thing that isn't supported on
Linux/PA-RISC right now is the floppy controller. The (IDE-)hard disks
shouldn't be a problem since they are attached to the NCR 53c710 via a
SCSI-IDE adapter.

Does anybody know whether it could/should/may/will/does run Linux?

Thanks in advance,

Max
