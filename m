Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 791D74A5F
	for <parisc-linux@parisc-linux.org>; Fri,  5 Oct 2001 18:43:14 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15pfYf-0006As-00
	for parisc-linux@parisc-linux.org; Sat, 06 Oct 2001 01:43:13 +0100
Date: Sat, 6 Oct 2001 01:43:13 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20011006014313.E3745@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] The continuing SMP problems
List-ID: <linux-parisc.vger.kernel.org>

I've tracked down one problem a little bit.  The L2k hangs with an SMP
kernel (even with only one CPU enabled) after:

Linux NET4.0 for Linux 2.4                                                      
Based upon Swansea University Computer Society NET3.039                         

What it's doing here is trying to run the keyboard_tasklet, which seems
to be disabled, so it reschedules it... ad infinitum.  More investigation
required, but I'm on the track, I think.

-- 
Revolutions do not require corporate support.
