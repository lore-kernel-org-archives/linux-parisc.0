From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Working 2.6.24 debian testing kernels available
Date: Thu, 17 Apr 2008 11:16:49 -0500
Message-ID: <1208449009.3150.23.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

The latest testing kernel release (2.5.24-5) doesn't boot on parisc
because of problems in the 2.6.24.4 stable kernel on which it is based.
I've put a BinNMU version (2.6.24-5+b1) that adds the two missing
patches to get this kernel booting again in:

http://www.parisc-linux.org/~jejb/parisc_debs/

For those tracking this, the two debian bugs are:

http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=476285
http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=476292

James


