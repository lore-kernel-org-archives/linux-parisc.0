Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from blaprocopc08.bausch.com (unknown [161.242.9.34])
	by dsl2.external.hp.com (Postfix) with SMTP id 3C174482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Dec 2002 12:54:17 -0700 (MST)
Message-ID: <B0E6075E55C7D6119DDE0002A53F8BCE0DE45B@blmsrocopc07.bausch.com>
From: "Buechler, Mark R" <Mark_R_Buechler@bausch.com>
To: "'grundler@dsl2.external.hp.com'" <grundler@dsl2.external.hp.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Date: Mon, 30 Dec 2002 14:54:08 -0500
Subject: RE: [parisc-linux] A3308 fibre SCSI bridge support
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

The only place it shows up is in /proc/scsi/qla2200/1. The target id is 18
(WWN: 50060b000005cc76 I assume since it starts with "50").

-------------------------------------------------------------

QLogic PCI to Fibre Channel Host Adapter for ISP22xx:
        Firmware version:  2.02.03, Driver version 6.01.00
Entry address = c481a060
HBA: QLA2200 , Serial# B56623
Request Queue = 0x3a2c000, Response Queue = 0x3a34000
Request Queue count= 128, Response Queue count= 64
Total number of active commands = 0
Total number of interrupts = 80
Total number of IOCBs (used/max) = (0/600)
Total number of queued commands = 0
    Device queue depth = 0x10
Number of free request entries = 47
Number of mailbox timeouts = 0
Number of ISP aborts = 0
Number of loop resyncs = 0
Number of retries for empty slots = 0
Number of reqs in pending_q= 0, retry_q= 0, done_q= 0, scsi_retry_q= 0
Host adapter:loop state= <READY>, flags= 0x8a0a13
Dpc flags = 0x0
MBX flags = 0x0
SRB Free Count = 4096
Port down retry = 008


SCSI Device Information:
scsi-qla1-adapter-node=200000e08b22cf63;
scsi-qla1-adapter-port=210000e08b22cf63;
scsi-qla1-target-0=20000060b02ac26c;
scsi-qla1-target-1=2100002037843e57;
scsi-qla1-target-2=21000020378437c0;
scsi-qla1-target-3=21000004cf0ef21a;
scsi-qla1-target-4=21000004cf2248d0;
scsi-qla1-target-5=210000203784354b;
scsi-qla1-target-6=2100002037669132;
scsi-qla1-target-7=2100002037843560;
scsi-qla1-target-8=2100002037843cd9;
scsi-qla1-target-9=50060b000005d7b3;
scsi-qla1-target-10=210000203784498c;
scsi-qla1-target-11=21000004cf1b3830;
scsi-qla1-target-12=21000004cf2250b5;
scsi-qla1-target-13=2100002037843e36;
scsi-qla1-target-14=2100002037e7184c;
scsi-qla1-target-15=2100002037843c3c;
scsi-qla1-target-16=210000203766907b;
scsi-qla1-target-17=21000020371ac091;
scsi-qla1-target-18=50060b000005cc76;

SCSI LUN Information:
(Id:Lun)
( 1: 0): Total reqs 5, Pending reqs 0, flags 0x0, 1:0:02,
( 2: 0): Total reqs 5, Pending reqs 0, flags 0x0, 1:0:03,
( 3: 0): Total reqs 5, Pending reqs 0, flags 0x0, 1:0:04,
( 4: 0): Total reqs 5, Pending reqs 0, flags 0x0, 1:0:05,
( 5: 0): Total reqs 5, Pending reqs 0, flags 0x0, 1:0:06,
( 6: 0): Total reqs 5, Pending reqs 0, flags 0x0, 1:0:07,
( 7: 0): Total reqs 5, Pending reqs 0, flags 0x0, 1:0:08,
( 8: 0): Total reqs 5, Pending reqs 0, flags 0x0, 1:0:09,
(10: 0): Total reqs 5, Pending reqs 0, flags 0x0, 1:0:0c,
(11: 0): Total reqs 5, Pending reqs 0, flags 0x0, 1:0:0d,
(12: 0): Total reqs 5, Pending reqs 0, flags 0x0, 1:0:0e,
(13: 0): Total reqs 5, Pending reqs 0, flags 0x0, 1:0:0f,
(14: 0): Total reqs 5, Pending reqs 0, flags 0x0, 1:0:10,
(15: 0): Total reqs 5, Pending reqs 0, flags 0x0, 1:0:11,
(16: 0): Total reqs 5, Pending reqs 0, flags 0x0, 1:0:12,
(17: 0): Total reqs 5, Pending reqs 0, flags 0x0, 1:0:13,

-----Original Message-----
From: grundler@dsl2.external.hp.com
[mailto:grundler@dsl2.external.hp.com]
Sent: Monday, December 30, 2002 2:44 PM
To: Buechler, Mark R
Cc: 'parisc-linux@lists.parisc-linux.org'
Subject: Re: [parisc-linux] A3308 fibre SCSI bridge support


On Mon, Dec 30, 2002 at 10:13:24AM -0500, Buechler, Mark R wrote:
> Configuring the MUX isn't a problem.

ok.

> What I'd like to do is access the SCSI
> devices connected to the MUX from Linux. From a Linux host I see the MUX
as
> a single target.

Can you copy the output here?
I'm curious how it's reported.

> I wouldn't think any changes would be necessary for the FC
> driver but rather a separate driver would exist that scans for the MUX and
> uses the Linux sg driver to communicate with it.

the sg driver is a passthru interface and doesn't present a "random
access mass storage device" view. sg would be used to configure
the MUX and sd to access the devices behind it.

My point was the existing FC interface drivers already present FC
storage devices (eg disks or arrays) via "sd" driver and don't know how
to talk to devices that aren't "transperent" (ie invisible nodes in the
FC fabric).










EMAIL DISCLAIMER 

Please Note: The information contained in this message may be privileged and
confidential, protected from disclosure, and/or intended only for the use of
the individual or entity named above. If the reader of this message is not
the intended recipient, or an employee or agent responsible for delivering
this message to the intended recipient, you are hereby notified that any
disclosure, distribution, copying or other dissemination of this
communication is strictly prohibited. If you received this communication in
error, please immediately reply to the sender, delete the message and
destroy all copies of it.

Thank You
