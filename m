Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <20021006062654.76EC24829@dsl2.external.hp.com>
Date: Sun,  6 Oct 2002 00:26:54 -0600 (MDT)
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] SANE "just works"
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

Hi all,

I had a chance to hook up a very old HP ScanJet IIcx (8-bit color, scsi)
scanner to my C3000 and it "just worked". Used GIMP to clean up a scratched
photo of my daughter from 1997 and overall was amazed it all worked.
Only needed to "apt-get install sane gimp" and then read the Intro
pages at:
	http://www.mostang.com/sane/lj98/

Only problem (that I don't have any data for) is gimp perpetually
segfaulting after I exited. The image I edited was properly saved.
"kill -9" stopped the segfaulting.

Just need to find a better scanner now...8-bit color isn't anywhere
near satisfactory.

grant
