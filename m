Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2A3154841
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Nov 2003 21:12:48 -0700 (MST)
Date: Sat, 8 Nov 2003 04:12:44 +0000 (GMT)
From: "M. Grabert" <xam@cs.ucc.ie>
To: James Bottomley <James.Bottomley@steeleye.com>
Cc: Paul Bame <bame@riverrock.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Allow palo partition to be mounted as ext2
In-Reply-To: <1068254037.2120.93.camel@mulgrave>
Message-ID: <Pine.LNX.4.58.0311080401180.19538@sal.ucc.ie>
References: <1068254037.2120.93.camel@mulgrave>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Sat, 7 Nov 2003, James Bottomley wrote:

> It can be a bit of a pain having both a palo partition and a /boot
> partition on the root disc (and both < 2GB), so this patch allows the
> palo partition to be mounted as an ordinary ext2/ext3 filesystem
> (ideally as /boot).

Well, not if you have read the FAQ ;)
But I agree, I recently assisted someone (via IRC) reinstalling
his 712, because he forgot to create a F0 partition, but he
created a /boot in the first 2GB.

> It does this by creating an ext2/3 filesystem in the palo partition but
> leaving a hole for the iplboot program (by telling the filesystem the
> blocks are bad).  The kernels can be booted from this filesystem by
> specifying 0/ as the partition as usual.

I don't know much ext2/3 details, but is there a way that a fsck
could mess things up? Eg. not an ordinary fsck, but if the user
runs it manually with special options?

I suppose the same technique could be also used for other filesystems
palo supports (in the future).

> Attached is a preliminary patch for you to see what you think.
>
> Ultimately, it should mean we can get palo to operate much more like
> grub (using a palo.conf file within the palo partition itself for
> instance).

That would be a logical consequence.

Very nice!


Keep up the good work,
  Max
