Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric.uwo.ca (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with SMTP id C6D98482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Jun 2001 13:52:16 -0600 (MDT)
Date: Thu, 28 Jun 2001 15:52:13 -0400 (EDT)
From: Chris Snow <chris@baldric.uwo.ca>
To: "y.   han" <yhan@uwo.ca>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Kernel images for rbootd
In-Reply-To: <Pine.SOL.4.21.0106281457180.23217-100000@panther.uwo.ca>
Message-ID: <Pine.LNX.4.33.0106281549180.29792-100000@baldric.uwo.ca>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 28 Jun 2001, y.   han wrote:

> Well, we came across another question after several steps.
> 1. what is the kernel image? we downloaded the nfsroot-20001009.tar.gz, is
> this the kernel image?

No that is the image for the NFS root filesystem.

There are some kernel images in:
/pub/parisc/binaries/kernels on puffin.external.hp.com but they are pretty
old ("vmlinux-*" files) so you might want to get the source code and
compile your own.  There are instructions for this on the website.


> 2. shall we copy this file into /export/hp/rbootd directory and gunzip and
> tar it?

No you want to untar it into a directory that is accesible by NFS.
(Assuming you want to have an NFS root filesystem).


     Chris

------------------------------
Yoda: Fear is the path to the dark side. Fear leads to anger. Anger
leads to hate. Hate leads to suffering. I sense much fear in you.
