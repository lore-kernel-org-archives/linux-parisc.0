Return-Path: <giorgio.brunoldi@fastwebnet.it>
Received: from ms001msg.fastwebnet.it (ms001msg.fastwebnet.it [213.140.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id EF65C4830
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 30 Mar 2004 12:37:33 -0700 (MST)
Received: from [2.4.224.81] (2.4.224.81) by ms001msg.fastwebnet.it (6.7.019)
	id 405863C600432A4F for parisc-linux@lists.parisc-linux.org;
	Tue, 30 Mar 2004 21:37:32 +0200
From: Giorgio Brunoldi <giorgio.brunoldi@fastwebnet.it>
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 30 Mar 2004 19:38:31 +0000
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Message-Id: <200403301938.31371.giorgio.brunoldi@fastwebnet.it>
Subject: [parisc-linux] Problem on a 735/125 with non-hp scsi disks
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi everybody,

I have two 375/125 machines which are not provided with floppy and cdrom.
Workstations have "official" HP-FWD-SCSI Hard Disks (which I know are not 
supported by Pa-Risc Linux) and neither floppy nor cdrom drive.

My first (and last) success was adapting an old SCSI Apple CD 600i (2x) and 
get the first installation CD boot from that peripheral. What I did was to 
disconnect the FWD SCSI cable from internal HDs and set the termination on 
that bus. After that I connected the Single Ended SCSI connector to an 
external box containing the CDRom.

I also have 2 spare SCSI HDs which are single ended and on which I'd like to 
install Linux:

IBM 0662-S12:	1.20 Gb Fast SCSI (50 Pin Connector)
IBM DFHS-S2W:	2.25 Gb Wide SCSI (68 Pin High Density Connector) 

To try both disks I detached the external CDRom drive and in the same way I 
connected an external box with HD inside. FWD SCSI connector is still 
terminated.

To test the 68 pin disk I used a 68 to 50 pin adapter.

In this way, during boot time, no SCSI disk is found during bus scan by the 
workstations. I set both HDs as ID 6 but I think I'm doing somwthing wrong.
I forgot to say the external box has 2 centronics 50 SCSI connectors; one is 
connected to the 50 High Density connector on the workstation, the other is 
terminated with a centronics passive terminator.

I tryied to figure out the correct jumper settings cross-referencing from HDs 
tech specifications and HP 375 manuals but maybe I didn't find the right 
configuration.

- Is there any of you guys who has succeded in installing Linux on this kind 
of disks?

- Can you please tell me which are the features I should check in jumper 
settings to activate/deactivate the "right functions" and make my systems 
work?

- I red somewhere that bootable HDs have to be provided with a proper boot 
record formatting to be revealed during bus-scan. Is it true?

Thank You Very Much for your help.

Giorgio (Italy) 
