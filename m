Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D3FD4A19
	for <parisc-linux@parisc-linux.org>; Fri, 23 Feb 2001 02:29:29 -0700 (MST)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.1.50.190])
	by atlrel1.hp.com (Postfix) with ESMTP id B0244577
	for <parisc-linux@parisc-linux.org>; Fri, 23 Feb 2001 04:29:28 -0500 (EST)
Received: from chrysl (chrysl.fc.hp.com [15.1.54.200])
	by ldl.fc.hp.com (Postfix) with ESMTP id 61A075A9A5
	for <parisc-linux@parisc-linux.org>; Fri, 23 Feb 2001 02:29:28 -0700 (MST)
Received: from willy by chrysl with local (Exim 3.12 #1 (Debian))
	id 14WEXY-0006gB-00
	for <parisc-linux@parisc-linux.org>; Fri, 23 Feb 2001 02:29:28 -0700
To: parisc-linux@parisc-linux.org
Message-Id: <E14WEXY-0006gB-00@chrysl>
From: Matthew Wilcox <willy@ldl.fc.hp.com>
Date: Fri, 23 Feb 2001 02:29:28 -0700
Subject: [parisc-linux] Documentation wanted
List-ID: <linux-parisc.vger.kernel.org>

Looking for something to do?  I ran `make checkhelp' and the following
undocumented CONFIG options are our fault.  If you'd like to write
some help and send diffs against Configure.help to the list, that'd
be appreciated.

Use power LED as a heartbeat
CONFIG_HEARTBEAT
  No help for CONFIG_HEARTBEAT

/proc/hardware support
CONFIG_PROC_HARDWARE
  No help for CONFIG_PROC_HARDWARE

Support for Lasi/Dino PS2 port
CONFIG_GSC_PS2
  No help for CONFIG_GSC_PS2

HIL keyboard support
CONFIG_HIL
  No help for CONFIG_HIL

serial port on GSC support
CONFIG_SERIAL_GSC
  No help for CONFIG_SERIAL_GSC

Lasi ethernet
CONFIG_LASI_82596
  No help for CONFIG_LASI_82596

Generic STI frame buffer device support
CONFIG_FB_STI
  No help for CONFIG_FB_STI
