Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from brain.fop.ns.ca (u135n18.eastlink.ca [24.224.135.18])
	by dsl2.external.hp.com (Postfix) with ESMTP id 90C1B4840
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Nov 2003 17:37:58 -0700 (MST)
Date: Tue, 18 Nov 2003 20:38:00 -0400 (AST)
From: Steve Bromwich <lists@fop.ns.ca>
To: JjDunnjr@aol.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Boot-up challenges on a 715/75
In-Reply-To: <1e2.13b31f0d.2cebe9ab@aol.com>
Message-ID: <Pine.LNX.4.58.0311182035020.17277@brain.fop.ns.ca>
References: <1e2.13b31f0d.2cebe9ab@aol.com>
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

On Tue, 18 Nov 2003 JjDunnjr@aol.com wrote:

> Gentlepersons:
> Attempting to install Debian for HPPA on my 715/75 diskless workstation.
> Setup includes: 2 2gig Seagate drives, scsi, IDs set at 5 and 6
> an external TEAC  CD-R55S, scsi, ID set at 2

I believe HP machines use a 512 byte sector CD drives (with the standard
being 2048 byte). I'm not sure off-hand if the TEAC supports 512 byte
sectors. Your best bet may be to borrow a CD off a Sun machine, if you
have access to one.

Alternatively, you might have better luck doing a netboot, which I've used
with success before on a 715/75.

Cheers, Steve
