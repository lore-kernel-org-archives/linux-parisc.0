Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8F380482E
	for <parisc-linux@parisc-linux.org>; Tue,  5 Mar 2002 15:40:33 -0700 (MST)
Received: from eiger.apptechsys.com (ats198.apptechsys.com [207.14.35.198])
	by mail.apptechsys.com (Postfix) with ESMTP id 1A8D57BC45
	for <parisc-linux@parisc-linux.org>; Tue,  5 Mar 2002 14:40:23 -0800 (PST)
Date: Tue, 5 Mar 2002 14:40:23 -0800 (PST)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: <parisc-linux@parisc-linux.org>
Message-ID: <Pine.LNX.4.33L2.0203051434270.6941-100000@eiger.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] SMP support
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

I am running debian-hppa on a J5000, and I am using the 2.4.17-32-smp
kernel.  It detects both processors at boot, and shows them both in
/proc/cpuinfo, but /proc/stat shows this

cpu  599904 33379482 34656795 68636319
cpu0 0 0 64 68636186
cpu1 599904 33379482 34656731 133

I interpret this to mean that everything is happening on cpu1 and cpu0 is
just sitting idle.  Is this a bug, or am I doing something wrong?

Also, I am unable to build any kernels myself.  I get a bunch of depmod
errors, like these

depmod: Unhandled relocation of type 74 for printk_Rsmp_dd132261
depmod: Unhandled relocation of type 74 for usb_deregister_Rsmp_c6f994d5

This is using the make-kpkg kernel_image command.

-- 
Love the sea?  I dote upon it -- from the beach.
