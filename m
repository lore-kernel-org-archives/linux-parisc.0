Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.cs.tu-berlin.de (mail.cs.tu-berlin.de [130.149.17.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id 901CA4834
	for <parisc-linux@lists.parisc-linux.org>; Sun,  6 Jan 2002 19:58:34 -0700 (MST)
Received: from bolero.cs.tu-berlin.de (doko@bolero.cs.tu-berlin.de [130.149.19.1])
	by mail.cs.tu-berlin.de (8.9.3/8.9.3) with ESMTP id DAA03783
	for <parisc-linux@lists.parisc-linux.org>; Mon, 7 Jan 2002 03:58:26 +0100 (MET)
From: Matthias Klose <doko@cs.tu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <15417.3793.688638.629130@gargle.gargle.HOWL>
Date: Mon, 7 Jan 2002 03:58:25 +0100
To: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] installation problems on an A500
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

Trying to install Debian on the machine:

- trying to boot from the network, I get:

Main Menu: Enter command or menu > bo pri
Interact with IPL (Y, N, or Cancel)?> y

Booting... 
Network Station Address 00306e-132574
System IP Address 192.168.42.183
Server IP Address 192.168.42.5

Boot IO Dependent Code (IODC) revision 2

IPL error: bad LIF magic.

************* SYSTEM ALERT **************
SYSTEM NAME: gsphppa
DATE: 01/07/2002 TIME: 02:24:50
ALERT LEVEL: 6 = Boot possible, pending failure - action required

REASON FOR ALERT
SOURCE: 8 = I/O 
SOURCE DETAIL: 6 = disk   SOURCE ID: 0
PROBLEM DETAIL: 0 = no problem detail

LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       FLASH    FLASH         ON        ON         ON
LED State: Boot Failed.  Running non-OS code.  Non-critical error detected.
Check Chassis and Console Logs for error messages.

0x00000060860010C0 00000000 00000000 - type  0 = Data Field Unused
0x58000860860010C0 00006600 07021832 - type 11 = Timestamp 01/07/2002 02:24:50
A: ack read of this entry - X: Disable all future alert messages

the changelog on the bootp/tftpboot server shows:

Jan  7 03:26:00 gate bootpd[25080]: recvd pkt from IP addr 0.0.0.0
Jan  7 03:26:00 gate bootpd[25080]: bootptab mtime: Mon Jan  7 03:25:27 2002
Jan  7 03:26:00 gate bootpd[25080]: reading new "/etc/bootptab"
Jan  7 03:26:00 gate bootpd[25080]: read 2 entries (2 hosts) from "/etc/bootptab"
Jan  7 03:26:00 gate bootpd[25080]: request from Ethernet address 00:30:6E:13:25:74
Jan  7 03:26:00 gate bootpd[25080]: found 192.168.42.183 (hppa)
Jan  7 03:26:00 gate bootpd[25080]: bootfile="/tftpboot/palinux"
Jan  7 03:26:00 gate bootpd[25080]: vendor magic field is 99.130.83.99
Jan  7 03:26:00 gate bootpd[25080]: sending reply (with RFC1048 options)
Jan  7 03:26:00 gate bootpd[25080]: setarp 192.168.42.183 - 00:30:6E:13:25:74
Jan  7 03:26:02 gate in.tftpd[28213]: connect from hppa.local
Jan  7 03:26:02 gate tftpd[28214]: tftpd: trying to get file: /tftpboot/palinux 

Tried this with the lifimage from woody/main (2001-12-19) and the
lifimage from parisc-linux.org (2001-12-26), checked md5sums after
downloading.

Yesterday, I borrowed an external CD-ROM and tried to boot from a
CD-ROM (burnt the ISO image). Now getting:

bo 0/0/2/0.3
Interact with IPL (Y, N, or Cancel)?> y

Booting... 
Failed to initialize.

ENTRY_INIT 
Status = -3

00000000 FFFFFFFD 00000000 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000 00000000 00000000 00000012 00000000 00000000 00000000 00000000 
00000000 454E4841 00000000 00000000 00000000 00000000 00000000 454E4841 
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000 00000400 00000000 00000000 00000000 00000000 00000000 00000000 

Failed to initialize.


Any hints how to start/continue?

Thanks, Matthias
