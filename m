Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5B6564843
	for <parisc-linux@parisc-linux.org>; Sat,  6 Oct 2001 18:30:46 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15q1q8-0006vd-00
	for parisc-linux@parisc-linux.org; Sun, 07 Oct 2001 01:30:44 +0100
Date: Sun, 7 Oct 2001 01:30:44 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20011007013044.G3745@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] resources
List-ID: <linux-parisc.vger.kernel.org>

I just finished fixing up the iomem resources for system ram / rom +
kernel code & data.  I'm not sure the original author set them up right.
Here's the output on a C360:

00000000-3fffffff : System RAM                                                  
  00000000-000009ff : PDC data (Page Zero)                                      
  00100000-00279fff : Kernel code                                               
  0027a000-0035ff4b : Kernel data                                               
f0000000-f00fffff : System ROM                                                  

Is the `System ROM' supposed to be the `PDC Address Space'
mentioned in the PA 2.0 manual on page 3-2?If so, it should
presumably be f0000000-f0ffffff on 32-bit machines, and
f000000000000000-f0ffffffffffffff on 64-bit machines.

The L2k has a slightly bizarre output:

00000000-1ffffffff : System RAM                                                 
  00000000-000009ff : PDC data (Page Zero)                                      
  00100000-0032bfff : Kernel code                                               
  0032c000-0049ed7b : Kernel data                                               

should have two ranges -- 00000000-efffffff and 100000000 to 1ffffffff.
Going to debug that before committing.

-- 
Revolutions do not require corporate support.
