Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id C0C014868
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 20 Feb 2004 10:56:16 -0700 (MST)
Date: Fri, 20 Feb 2004 18:56:12 +0100
Message-ID: <402A4CA500006E8D@ocpmta2.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
To: "Matthew Wilcox" <willy@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] b2k scsi disk pb
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Matthew,

I trust that you could advise me about this pb:

on my b2k since I can run 2.6 (32bit with gcc-3.3 or 64bit with gcc-3.0)
i noticed from time to time such dmesg:
sym0:5:0: ABORT operation timed-out.
sym0:5:0: ABORT operation started.

sym0:5:0: ABORT operation timed-out.
sym0:5:0: ABORT operation started.
sym0:5:0: ABORT operation timed-out.
sym0:5:0: ABORT operation started.
sym0:5:0: ABORT operation timed-out.
sym0:5:0: ABORT operation started.
sym0:5:0: ABORT operation timed-out.
sym0:5:0: ABORT operation started.
sym0:5:0: ABORT operation timed-out.
sym0:5:0: ABORT operation started.
sym0:5:0: ABORT operation timed-out.
sym0:5:0: ABORT operation started.
sym0:5:0: ABORT operation timed-out.
sym0:5:0: ABORT operation started.
sym0:5:0: ABORT operation timed-out.
sym0:5:0: ABORT operation started.
sym0:5:0: ABORT operation timed-out.
sym0:5:0: ABORT operation started.
sym0:5:0: ABORT operation timed-out.
sym0:5:0: ABORT operation started.
sym0:5:0: ABORT operation timed-out.
sym0:5:0: ABORT operation started.
sym0:5:0: ABORT operation timed-out.
sym0:5:0: ABORT operation started.
sym0:5:0: ABORT operation timed-out.
sym0:5:0: ABORT operation started.
sym0:5:0: ABORT operation timed-out.
sym0:5:0: ABORT operation started.
sym0:5:0: ABORT operation timed-out.
sym0:5:0: DEVICE RESET operation started.
sym0:5:0: DEVICE RESET operation timed-out.
sym0:5:0: BUS RESET operation started.
sym0: SCSI BUS reset detected.
sym0: SCSI BUS has been reset.
sym0:5:0: BUS RESET operation complete.

and during this time the system naturaly hang.

scsi id 5 is the one of the working boot disk (a quantum model atlas5-9lvd)
and if there is well a second disk (a seagate model ST336704LC) it is not
used.

OTC with 2.4 and sym2 driver, I never noticed this behavior (even with recent
2.4.25-rc?-pa0 :) ), so I presume that there is no disk failure (and a dd
if=/dev/sda of=/dev/null bs=1024k reach to read fully the disk without any
error).

Any idea?

Thanks in advance,
    Joel



----------------------------------------------------------------------------------------
Tiscali ADSL: 19,50 €/mois, pendant 3 mois! L'Internet rapide, c'est pour
tout le monde.
http://reg.tiscali.be/default.asp?lg=fr
