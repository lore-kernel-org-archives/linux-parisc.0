Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 43E2D4829
	for <parisc-linux@parisc-linux.org>; Sun,  3 Nov 2002 20:45:16 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 188YAp-0003t7-00
	for parisc-linux@parisc-linux.org; Mon, 04 Nov 2002 03:45:11 +0000
Date: Mon, 4 Nov 2002 03:45:11 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20021104034511.G20749@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] merge status
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

yay, Linus accepted another patchbomb.

we're down to some 370k of diff vs his tree.  here's how it breaks down:

drivers/hil (pending discussion of where to move it, etc):
-rw-r--r--    1 willy    willy      127144 Nov  3 19:51 parisc-hil.diff

drivers/video (helge is discussing this with James Simmons):
-rw-r--r--    1 willy    willy      162128 Nov  3 19:49 parisc-video.diff

drivers/scsi (richard/rbrad/grant will take care of this):
-rw-r--r--    1 willy    willy       44026 Nov  3 20:18 parisc-scsi.diff

everything else (my responsibility):
-rw-r--r--    1 willy    willy       35109 Nov  3 20:18 tmp

Looking forward to the 2.5.46 merge ;-)

-- 
Revolutions do not require corporate support.
