Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ascomax.hasler.ascom.ch (ascomax.hasler.ascom.ch [139.79.135.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8A298484D
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Feb 2002 06:15:20 -0700 (MST)
Received: from srvmailgate1.hasler.ascom.ch (srvmailgate1.hasler.ascom.ch [139.79.135.89])
	by ascomax.hasler.ascom.ch (8.11.4/8.11.4) with ESMTP id g1MDFG404659
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Feb 2002 14:15:17 +0100 (MET)
To: parisc-linux@lists.parisc-linux.org
Message-ID: <OF24F42D74.714B6A40-ONC1256B68.00484869@hasler.ascom.ch>
From: "Thomas Schmid" <Thomas.Schmid@ascom.ch>
Date: Fri, 22 Feb 2002 14:15:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [parisc-linux] Failed Firmware Update...
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

well, after following some threads in this list about firmware updates,
I decided to update my 715 to the current 1.6, up from 1.1.

Update so far went OK, but when it tried to reboot, it complained about
a memory error and halted the system. Rebooting afterwards stopped
at the "LED"-level; it gave me a "HPMC Cache Error", a "High Priority
Machine Check Cache Error". And that was it, no monitor, no nothing....

- Question: The machine I (now) had was a 715/100XC; can it be that the
1.6 firmware update is not suitable for that variant of the 715/100 ?
- Is there still hope to revive the machine ? (without HP's support...)

A bit frustrated....
Thomas
