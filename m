Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 88870482C
	for <parisc-linux@lists.parisc-linux.org>; Sat, 24 Nov 2001 08:14:47 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 167eVx-0001WG-00; Sat, 24 Nov 2001 15:14:45 +0000
Date: Sat, 24 Nov 2001 15:14:45 +0000
From: Matthew Wilcox <willy@debian.org>
To: Bernd Eckenfels <lists@lina.inka.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 715/50 does not find image on cd
Message-ID: <20011124151445.L1307@parcelfarce.linux.theplanet.co.uk>
References: <20011124160748.B18913@lina.inka.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011124160748.B18913@lina.inka.de>; from lists@lina.inka.de on Sat, Nov 24, 2001 at 04:07:48PM +0100
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

On Sat, Nov 24, 2001 at 04:07:48PM +0100, Bernd Eckenfels wrote:
> I have attached an externel SCSI CD-ROM. On Power on, it finds two devices,
> the internal Quantum disk on scsi.6.0 and the CDROM on scsi.5.0. But it
> refuses to boot from the CD rom. I tried a 0.9 Debian Image and Original
> HP-UX 9.0 and 10.20 Disks.

firmware won't boot from all drives; try a different cdrom drive or netboot.

-- 
Revolutions do not require corporate support.
