Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from primare.xs4all.nl (primare.xs4all.nl [213.84.188.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D0C3482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  2 Feb 2002 07:18:27 -0700 (MST)
Received: (from djmuggs@localhost)
	by primare.xs4all.nl (8.11.6/8.11.1) id g12EIV826400
	for parisc-linux@lists.parisc-linux.org; Sat, 2 Feb 2002 15:18:31 +0100 (CET)
	(envelope-from djmuggs)
Date: Sat, 2 Feb 2002 15:18:31 +0100
From: DJ Tha Muggs <djmuggs@primare.xs4all.nl>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020202151831.B26371@primare.xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] CD-Rom installation troubles 785/C3000
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

I just started installing parisc-linux for the first time on my C3000.
I Hooked up an SE SCSI CD-Rom to the narrow connector on the back.

The systems sees the CD-Rom and also is booting fine from this CD-Rom.
After partitioning the Harddisk and mounting it, it is ready to install the kernel.
When i do this it asks me for the installation medium, this is my CD-Rom where i booted it from, but it is not able to find it.

I went into the shell mode and did a DMESG, but i was not able to find my SCSI cd-rom in there :(

Can anyone tell what goes wrong and tell me how to fix this?

Regards,

Cristian van Ee.
