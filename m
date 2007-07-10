From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: [parisc-linux] Crashed on 2.6.22-rc7, Linus' tree
Date: Tue, 10 Jul 2007 09:01:02 -0400
Message-ID: <5b2e36650707100601s50fc0c62k551d387bd755b3cd__46957.9322649681$1416624411$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
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

Heya!  I'm running 2.6.22-rc7 from Linus' tree, and I occasionally get
the system dying like this.  I'm mostly surprised by the complete lack
of information in the crash, is there anything I can do to ask it to
give more when it dies?

 * INIT: version 2.86 reloading

************* SYSTEM ALERT **************
SYSTEM NAME: a500-gsp
DATE: 07/10/2007 TIME: 07:23:03
ALERT LEVEL: 7 = reserved

REASON FOR ALERT
SOURCE: 0 = unknown, no source stated
SOURCE DETAIL: 0 = unknown, no source stated   SOURCE ID: FF
PROBLEM DETAIL: 0 = no problem detail

LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       ON       FLASH         OFF       ON         ON
LED State: There was a system interruption that did not take the system down.
Check Chassis and Console Logs for error messages.

0x0000007000FF6292 000000F0 F0000000 - type  0 = Data Field Unused
0x5800087000FF6292 00006B06 0A071703 - type 11 = Timestamp 07/10/2007 07:23:03
A: ack read of this entry - X: Disable all future alert messages
Anything else skip redisplay the log entry
->Choice:Timeout!
*****************************************


-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
