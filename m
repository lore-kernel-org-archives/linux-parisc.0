Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.yifansoft.com (ns1.yifansoft.com [64.61.26.50])
	by dsl2.external.hp.com (Postfix) with SMTP id A546B4841
	for <parisc-linux@lists.parisc-linux.org>; Fri, 28 Jun 2002 16:19:22 -0600 (MDT)
From: "Chuck" <atkinsc@yifan.net>
To: <parisc-linux@lists.parisc-linux.org>
Date: Fri, 28 Jun 2002 17:19:27 -0500
Message-ID: <MDEAIMOKAJDADFOAOOJEKECICAAA.atkinsc@yifan.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] 735 and FW SCSI
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

I have a 735/125 and I'm trying to install parisc-linux using the 0.9.3 ISO
but it doesnt detect any of my harddisks.  It seems the kernel doesnt load
support for the FW SCSI controller which the disks are on.  It loads the
driver for the other scsi controller but not the FW SCSI controller.  Is
there any way I can get parisc-linux to recognize my FW SCSI controller for
the install?

Chuck
