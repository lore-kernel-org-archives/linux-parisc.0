Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 35D614A19
	for <parisc-linux@lists.parisc-linux.org>; Sat, 24 Feb 2001 01:26:51 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id TAA26212;
	Sat, 24 Feb 2001 19:26:42 +1100
Date: Sat, 24 Feb 2001 19:26:42 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Initial setup of the `glibc' in the target rootfile
    system
In-Reply-To: <3A976D8E.B7F9CF66@neuronet.pitt.edu>
Message-ID: <Pine.LNX.4.21.0102241923550.9315-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 24 Feb 2001, Rafael E. Herrera wrote:

> By the way, I don't intend to use this build for cross compile other
> packages, I just want to be able to install these in the nfs root. I
> build the cross compile version with a --prefix that puts it out of the
> way.

I use

/src/parisc/glibc/configure --prefix=/usr --build=i686-linux \
--host=hppa-linux --with-headers=/usr/tmp/build/linux/include \
--without-cvs --enable-add-ons

make install_root=/tftpboot/<machine_name> install
