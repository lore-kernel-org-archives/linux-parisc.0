Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from brave.mc.edu (brave.mc.edu [204.198.21.52])
	by dsl2.external.hp.com (Postfix) with ESMTP id CF6104829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 May 2003 14:45:42 -0600 (MDT)
Message-Id: <seb7d821.029@brave.mc.edu>
Date: Tue, 06 May 2003 15:43:08 -0500
From: "Stephen Travers" <STravers@mc.edu>
To: <parisc-linux@lists.parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] k100 help
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

Hi All,

I need help with my hp 9000/809 (k100).  I have tried installing linux =
with the lastest iso's from the parisc-linux website 6 times.  Through =
research on the mailing lists, i have changed the boot command line to use =
ttyB0 instead of the default ttyS0, but to no avail.

I have downloaded the "pdc" net install iso's from fr.parisc-linux.org.  =
This iso booted (after the ttyB0 change) and the familiar installation =
program loaded the "base system" onto my machine (it found the SCSI =
controlers, disks, and the 100TX network card).  After the base install =
finishes and the system reboots.  Its comes up with the message "this may =
be the last message you see" and it IS the last message i see.  It tells =
me to change my console...

This is where I need help!  How do I "change the console"?  I've tried =
using a standard dumb terminal and i've tried connecting the machine to a =
PC running MicroSoft's Hyperterm.  The machine won't display anything past =
that point.

If its a Kernel change, can i make it on any linux box, or do i need an =
HPPA box running linux to do it?

Thank you for ANY help you can offer me.

-stephen




---------------------------------------
Stephen Travers
Academic Support Spec.
stravers@mc.edu
601.925.3939
