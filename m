Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 324C7482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Jan 2002 10:54:01 -0700 (MST)
Date: Tue, 8 Jan 2002 17:44:20 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Jaap Boender <jaapb@kerguelen.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Installing from network
Message-ID: <20020108174420.GP25927@sleepie.demon.co.uk>
References: <200201081647.g08Gld801781@loranchet.kerguelen.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200201081647.g08Gld801781@loranchet.kerguelen.org>
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

On Tue, Jan 08, 2002 at 05:47:39PM +0100, Jaap Boender wrote:
> Hi,
> 
> I've got a 712/60, on which I'd like to install Linux. So, being of simple
> mind, I downloaded the palinux-0.9.3-base ISO image and set up DHCP so the
> 712 boots this file. This works quite well - up to a point. The image boots,
> and the installer starts; however, when it wants to install a kernel and
> drivers onto the hard drive, it hangs. I can restart the installer with Ctrl-C
> at this point, but I can't get past this point in the installation. 
> 
> Manually unpacking the drivers.tgz file from a shell gives the same result.
> 
> So, am I doing something wrong, or is it simply lack of memory (the box only
> has 16 Mb), or should I just boot another way? I'd appreciate any help.

You want to boot a file known as a lifimage, not the ISO.  The ISO is a
CD image.  If you burn a CD from the image you should find 'lifimage'
somewhere like

dists/woody/main/disks-hppa/current/lifimage

Alternatively you could grab that file from somewhere like

<http://http.us.debian.org/debian/dists/woody/main/disks-hppa/current/lifimage>

Personally I'd burn that ISO, or loopback mount it, and export it from
a server via http or nfs.

16MB is rather small though, so it might be that you won't be
successful without adding more memory.  I'd guess that it would run ok
once installed, but the installer needs 6MB for a ramdisk.  Make sure you
define a swap partition and that it is activated.

Richard
