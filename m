Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pilchuck.reedmedia.net (pilchuck.reedmedia.net [209.166.74.74])
	by dsl2.external.hp.com (Postfix) with ESMTP id 68B5D4870
	for <parisc-linux@lists.parisc-linux.org>; Wed, 20 Feb 2002 19:21:28 -0700 (MST)
Date: Wed, 20 Feb 2002 18:21:24 -0800 (PST)
From: "Jeremy C. Reed" <reed@reedmedia.net>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Is there a hard-drive image for PA-RISC Linux
 0.9.3?
In-Reply-To: <3C7456F0.809@earthlink.net>
Message-ID: <Pine.LNX.4.43.0202201818570.30896-100000@pilchuck.reedmedia.net>
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

On Wed, 20 Feb 2002, Bryan W. Headley wrote:

> > Isn't it possible to use 'dd if=palinux.iso of=/dev/sda' and end up with a
> > "CD on a disk"? Or somethign similar? Would require a disposable 1G SCSI
> > drive, but it'd at least work...

I didn't think that this was possible, but I can give it a try.

> Assuming no "reasonable assumptions" made by the boot ROM precludes it
> ("iso9660 on a disc? No.") Worst case is mount the iso image on another
> linux box, and use nfsroot/rboot. Personally, I'd just find a friend
> with a CD burner and write on CD/R media. Lot less cantankerous, believe me!

Wel, I have the CD burner; I just don't have a SCSI CD drive for my HP 710 :)

   Jeremy C. Reed
   http://www.reedmedia.net/
