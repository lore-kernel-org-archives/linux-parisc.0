Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from boispop1.bois.uswest.net (boispop1.bois.uswest.net [207.108.224.1])
	by dsl2.external.hp.com (Postfix) with SMTP id BF307482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Apr 2001 18:04:41 -0600 (MDT)
Received: from rbrad by beavis.ybsoft.com with local (Exim 3.20 #1 (Debian))
	id 14kam0-0001m0-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 03 Apr 2001 18:03:44 -0600
Date: Tue, 3 Apr 2001 18:03:44 -0600
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010403180344.A6792@beavis.ybsoft.com>
Reply-To: rbradetich@uswest.net
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: Ryan Bradetich <rbrad@beavis.ybsoft.com>
Subject: [parisc-linux] [PATCH] PDC cleanup and encapsulation
List-ID: <linux-parisc.vger.kernel.org>

Anyone see a problem with committing this patch?

- Ryan

----- Forwarded message from Ryan Bradetich <rbrad@beavis.ybsoft.com> -----

Envelope-to: root@amanda.ybsoft.com
From: "Ryan Bradetich" <rbrad@beavis.ybsoft.com>
To: parisc-linux@lists.parisc-linux.org
Reply-To: rbradetich@uswest.net
X-UIDL: 985854046.7659.154121.boispop1.bois.uswest.net
Subject: [parisc-linux] [PATCH] PDC cleanup and encapsulation
X-Mailman-Version: 1.1
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
X-BeenThere: parisc-linux@lists.parisc-linux.org

Hello parisc-linux hackers,

This is a fairly extensive patch which (almost) finishes the PDC cleanups I
have been working on.  The goal of this patch was to add kernel-docs and
encapsulate the firmware calls so the caller does not have to worry about
alignment issues, etc.

The last PDC/firware cleanup I have on my list is to rename asm/pdc.h
to firmware.h.  This will be a seperate patch after this patch has been
reviewed/approved/committed.

I have tested this patch on the following machines:
	- 712/80 using STI console
	- C200 32-bit kernel using serial console
	- A500 64-bit kernel using serial console

Since the majority of the changes are in firmware.c and pdc.h
I have included include those files in their entirity to make
them easier to read.

As always, feedback, concerns, and questions are welcome.

Thanks,

- Ryan

[patch snipped]
Origional message can be found at:

http://lists.parisc-linux.org/pipermail/parisc-linux/2001-March/012108.html
