Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp0.libero.it (smtp0.libero.it [193.70.192.33])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5AE5C48A3
	for <parisc-linux@lists.parisc-linux.org>; Thu, 16 Oct 2003 11:30:54 -0600 (MDT)
Date: Thu, 16 Oct 2003 19:29:40 +0200
Subject: Re: [parisc-linux] scsi problems on a 720
From: Riccardo Mottola <rollei@tiscalinet.it>
To: "cbeerse@lycos.nl" <cbeerse@lycos.nl>,
	parisc <parisc-linux@lists.parisc-linux.org>
Message-ID: <BBB4A223.97F5%rollei@tiscalinet.it>
In-Reply-To: <3F8E9798.7040306@lycos.nl>
Mime-version: 1.0
Content-type: text/plain; charset="US-ASCII"
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

on 10/16/03 3:05 PM, cbeerse@lycos.nl at cbeerse@lycos.nl wrote:

> I think it is due to the partitioning and formatting of the drive. The
> partition 
> table used on HP-UX differs (a lot) from the partition table used on linux.
> Therefor, an entire disk should be targeted for either linux or hp-ux. And let
> the respective OS do the initialization (partitioning and file-system).
<snip>
> 
> On linux, its `fdisk` or variants like `sfdisk` to do the partitioning. Then
> use 
> mkfs on each partition to create the filesystem. Or let the installer handle
> this.

But I did so. One disk is dedicated to HP-UX and one to linux.
I partitioned the one for linux entirely for linux (fdisk doesn't even
recognize the HP-UX partitioning scheme!)
I said I did a mediainit to prove that the disc has no damaged sectors and
that hp-ux accesses it correctly

-Ric
