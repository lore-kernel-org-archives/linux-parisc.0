Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id EE3404841
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Nov 2003 09:14:15 -0700 (MST)
Date: Sat, 8 Nov 2003 11:09:19 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: James Bottomley <James.Bottomley@steeleye.com>
Cc: Paul Bame <bame@riverrock.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Allow palo partition to be mounted as ext2
Message-ID: <20031108160919.GD21080@systemhalted>
References: <1068254037.2120.93.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1068254037.2120.93.camel@mulgrave>
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

On Fri, Nov 07, 2003 at 07:13:55PM -0600, James Bottomley wrote:
> It can be a bit of a pain having both a palo partition and a /boot
> partition on the root disc (and both < 2GB), so this patch allows the
> palo partition to be mounted as an ordinary ext2/ext3 filesystem
> (ideally as /boot).
> 
> It does this by creating an ext2/3 filesystem in the palo partition but
> leaving a hole for the iplboot program (by telling the filesystem the
> blocks are bad).  The kernels can be booted from this filesystem by
> specifying 0/ as the partition as usual.
> 
> Attached is a preliminary patch for you to see what you think.
> 
> Ultimately, it should mean we can get palo to operate much more like
> grub (using a palo.conf file within the palo partition itself for
> instance).
> 
> The diffs are against the palo cvs tree.

Great work James! I like the addition of verbose to the command line.
This definately gets us a step closer to behaving or perhaps integrating
palo into grub. The only suggestion I have is that someone should
remember to update palo's debian/ files to reflect the fact that you
rely on 'e2fsprogs' for mke2fs. The computer scientist in me wants to
distinguish between failure cases when mke2fs exists and returns an
error code versus it doesn't exist on the $PATH (e.g. check if mke2fs
runs without params fist "/sbin/mke2fs -V").

c.
