Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id D485D4873
	for <parisc-linux@lists.parisc-linux.org>; Sun, 24 Aug 2003 14:39:37 -0600 (MDT)
Date: Sun, 24 Aug 2003 16:38:57 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20030824203857.GD17595@systemhalted>
References: <20030824191340.GG5304@charite.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030824191340.GG5304@charite.de>
Subject: [parisc-linux] Re: Added a new SCSI disk, hda became hdb
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

On Sun, Aug 24, 2003 at 09:13:40PM +0200, Ralf Hildebrandt wrote:
> Hi!
> 
> Today I added a new SCSI disk, and hda -- my bootdisk -- became hdb -- no
> matter which SCSI ID I chose for the new disk.
> 
> The old disk has ID 6, and I can do whatever I want, once I add the new
> disk, I cannot boot, since the kernel doesn't find it's rootfs on hda
> -- since it's hdb now.
> 
> How can I add a new physical disk as hdb ?

Put the disks in the reverse order?

An example is that any A500 or rp2430 labels the drives as 'scsia' and
'scsib', but linux finds them in the reverse order. When only one drive is
in 'scsia' it's sda, but when a second drive is added to 'scsib' the
order is reversed ('scsia' becomes sdb and 'scsib' becomes sda).

c.
