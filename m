Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-1.cisco.com (sj-msg-core-1.cisco.com [171.71.163.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 19016482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 25 Oct 2001 18:04:00 -0600 (MDT)
Date: Thu, 25 Oct 2001 17:03:57 -0700 (PDT)
From: Christian Suder <csuder@cisco.com>
To: <dan@bigw.org>
Cc: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0110251652370.4601-100000@ipsbu-1.cisco.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] How to Boot CD on C110
List-ID: <linux-parisc.vger.kernel.org>

Dan,

I assume the CD drive is a 'normal' drive (50 pin SE), not something
exotic like a wide SCSI.

The correct device would be core.SCSI.2.0, however it's strange that
SEArch doesn't even see it. The ID needs to be unique across both the SE
and the FW SCSI. Did you double-check the termination ? The C110 I have
here does have term's on the internal cable, which is different from the
usual PC.

What brand is the CD drive, and does it work on a different machine ?

Anyhow, the fun begins *after* the installation, there seems to be some
issues with the FW SCSI that haven't been sorted out yet. I have severely
corrupted fs within less than an hour.... files with 0x0s amidst the text
e.g.

	Christian
