Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust171.bre.cable.ntl.com [213.105.88.171])
	by dsl2.external.hp.com (Postfix) with ESMTP id A686D482A
	for <parisc-linux@parisc-linux.org>; Thu, 24 May 2001 04:43:28 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 61651B008; Thu, 24 May 2001 11:38:40 +0100 (BST)
Date: Thu, 24 May 2001 11:38:40 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Message-ID: <20010524113840.V8736@linuxcare.com>
References: <20010523231045.0DF9037CA8@carmen.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010523231045.0DF9037CA8@carmen.fc.hp.com>; from taggart@carmen.fc.hp.com on Wed, May 23, 2001 at 05:10:45PM -0600
Subject: [parisc-linux] Re: hppa64 cross compiler debs available
List-ID: <linux-parisc.vger.kernel.org>

On Wed, May 23, 2001 at 05:10:45PM -0600, Matt Taggart wrote:
> Hi hppa64 kernel users,
> 
> I have built unofficial hppa64-linux cross binutils/gcc debs for use in 
> compiling 64 bit kernels on hppa-linux. They are available at,
> 
> ftp://puffin.external.hp.com/pub/parisc/binaries/debian/unofficial-debs/
> 
> You need both,
> 
> binutils-hppa64_2.11.90.0.7-2.0.0.1_hppa.deb
> gcc-hppa64_3.0-0pre010427.0.0.1_hppa.deb

They depend on libc 2.2.3, so if I want to use them for building
the 64 bit kernel-images for boot-floppies to use, I need 2.2.3 on my
build system.  That probably means I need 2.2.3 on the root.bin.

Should I go down that road, or are we sticking with 2.2.1 for
initial install images?

Richard
