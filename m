Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id SAA31821
	for <parisc-linux@puffin.external.hp.com>; Tue, 19 Oct 1999 18:15:07 -0600
Date: Tue, 19 Oct 1999 16:24:49 -0400 (EDT)
From: Christopher Beard <chris@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.10.9910191607110.10378-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] So you wanna get to a prompt, eh?
List-ID: <linux-parisc.vger.kernel.org>


I've spent most of the afternoon working on the patches sent in by Thomas
Bogendoerfer, and have extended them to get the kernel working and to a
functional sash prompt. 

Instead of waiting on prumpf and others to finish commiting their code
(which I'm told conflicts with these changes), and not wanting to scramble
the CVS,  I'm going to post a tarball of my kernel tree at:

ftp://puffin.external.hp.com/pub/parisc/src/parisc-linux-src-19991019.tar.gz

And for those you out there who are interested in helping us test the
kernel, I've also posted a functional kernel image, for you try. You can
find it at:

ftp://puffin.external.hp.com/pub/parisc/binaries/kernels/Image-19991019-workingsash

And not wanted to leave much as an excercise for the reader, I've also
posted the ramdisk that I used, which has been extended to include
/dev/console, etc.
 
ftp://puffin.external.hp.com/pub/parisc/binaries/ramdisks/ramdisk.bin-19991019-workingsash

See http://www.thepuffingroup.com/parisc/recipe.html for Grant Grundler's
recipe, which includes a section on how to boot you PA-RISC box with one of
our kernel images.

Chris
