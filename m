Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 734154829
	for <parisc-linux@parisc-linux.org>; Sat,  2 Nov 2002 08:57:27 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 1880eJ-0002Jr-00
	for parisc-linux@parisc-linux.org; Sat, 02 Nov 2002 15:57:23 +0000
Date: Sat, 2 Nov 2002 15:57:23 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20021102155723.I20749@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Placement of hil drivers
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

So it seems to me that all of drivers/hil (in the 2.5 tree) depends
on stuff in drivers/input.  Is there any reason it shouldn't be in
drivers/input/hil rather than drivers/hil?  Or is there an even better
place to put it?

I notice that we don't even have the option to select the HIL configure
options in 2.5 at the moment, which means nobody's testing on 715/Scorpio
and similar boxes.  This is a shame... my goal for 2.6 is to get to a 20k
diff vs Linus' tree.  Which reminds me, it's time for a 2.5 status report.
Coming right up..

-- 
Revolutions do not require corporate support.
