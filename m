From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] FW diag is broken?
Date: Sun, 1 Apr 2007 23:37:59 -0600
Message-ID: <20070402053759.GC20818__30307.5881828137$1416624332$gmane$org@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi,
gsyprf11.external.hp.com is having problems and the latest manifestation
is this very odd output from the console when trying to netboot the
PF_CHAW4350.frm in order to update firmware:

Main Menu: Enter command or menu > bo lan
Interact with IPL (Y, N, or Cancel)?> n

Booting... 
Network Station Address 00306e-2661a3
System IP Address 192.6.38.61
Server IP Address 192.6.38.60

Boot IO Dependent Code (IODC) revision 2

IPL error: bad LIF magic.

************* SYSTEM ALERT **************
SYSTEM NAME: rp2470c
DATE: 04/02/2007 TIME: 04:21:21
ALERT LEVEL: 6 = Boot possible, pending failure - action required

REASON FOR ALERT
SOURCE: 8 = I/O 
SOURCE DETAIL: 6 = disk   SOURCE ID: 0
PROBLEM DETAIL: 0 = no problem detail

LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       FLASH    FLASH         ON        ON         ON
LED State: Boot Failed.  Running non-OS code.  Non-critical error detected.
Check Chassis and Console Logs for error messages.

0x00000060860010B0 00000000 00000000 - type  0 = Data Field Unused
0x58000860860010B0 00006B03 02041515 - type 11 = Timestamp 04/02/2007 04:21:21
A: ack read of this entry - X: Disable all future alert messages
Anything else skip redisplay the log entry
->Choice:Timeout!
*****************************************

************* SYSTEM ALERT **************
SYSTEM NAME: rp2470c
DATE: 04/02/2007 TIME: 04:21:22
ALERT LEVEL: 6 = Boot possible, pending failure - action required

REASON FOR ALERT
SOURCE: 8 = I/O 
SOURCE DETAIL: 6 = disk   SOURCE ID: 0
PROBLEM DETAIL: 0 = no problem detail

LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       FLASH    FLASH         ON        ON         ON
LED State: Boot Failed.  Running non-OS code.  Non-critical error detected.
Check Chassis and Console Logs for error messages.

0x00000060860014F0 00000000 00000000 - type  0 = Data Field Unused
0x58000860860014F0 00006B03 02041516 - type 11 = Timestamp 04/02/2007 04:21:22
A: ack read of this entry - X: Disable all future alert messages
Anything else skip redisplay the log entry
->Choice:X
*****************************************

CAUTION: System Alerts have been disabled. This will re-enable with 
a re-boot or power-on of the system. To re-enable system alerts now, you
may use the AC (Alert Display Configuration) command.

************* SYSTEM ALERT **************
Alert messages are now disabled. Enter Commands Interface AC command 
to enable them again
*****************************************


------------------------------- cut here --------------------------

The firmware update image should be fine...both copies I have are the same.
I get the same error when trying to boot from disk - and I'm obviously
trying to boot from LAN above, not disk.

So I have to wonder if this is really a RAM HW failure that the powerup
selftests are not catching. Or maybe some other HW failure? Can anyone
make sense of the "SOURCE DETAIL: 6 = disk" when booting from network?


thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
