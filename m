Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E1EB24848
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Mar 2002 09:24:40 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16mzw4-0001DQ-00; Mon, 18 Mar 2002 16:24:36 +0000
Date: Mon, 18 Mar 2002 16:24:36 +0000
From: Matthew Wilcox <willy@debian.org>
To: joel.soete@freebel.net
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] STI without PCI
Message-ID: <20020318162436.N21765@parcelfarce.linux.theplanet.co.uk>
References: <1016466919.3c960de7350ce@webmail.tiscalinet.be> <20020318155833.M21765@parcelfarce.linux.theplanet.co.uk> <1016468351.3c96137f696f0@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1016468351.3c96137f696f0@webmail.tiscalinet.be>; from joel.soete@freebel.net on Mon, Mar 18, 2002 at 05:19:11PM +0100
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

On Mon, Mar 18, 2002 at 05:19:11PM +0100, joel.soete@freebel.net wrote:
> SCSI device sda: 4194685 512-byte hdwr sectors (2148 MB)
> Partition check:
>  sda: unknown partition table
> scsi0: (4:0) Enabling Tag Command Queuing
> SCSI device sdb: 8388314 512-byte hdwr sectors (4295 MB)
>  sdb: unknown partition table
> 
> (well it works with k-2.4.18-pa4 from last this March 12 and I just restart to
> compile this new pa5 with previous .config to compare)

That's very strange.  Are you sure you have CONFIG_MSDOS_PARTITION=y in
your .config?  Otherwise, I gess there could be a problem with reading
the partition table off the disc... but that seems unlikely.

-- 
Revolutions do not require corporate support.
