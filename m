Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 45736482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  6 Jun 2001 05:29:22 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 5C14BB007; Wed,  6 Jun 2001 12:25:45 +0100 (BST)
Date: Wed, 6 Jun 2001 12:25:45 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Jay Konrad <jkonrad@fonts.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Installing a C++ Compiler
Message-ID: <20010606122545.R25745@linuxcare.com>
References: <200106061156972.SM00210@bhopc40002>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200106061156972.SM00210@bhopc40002>; from jkonrad@fonts.de on Wed, Jun 06, 2001 at 11:54:12AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jun 06, 2001 at 11:54:12AM +0200, Jay Konrad wrote:
> Hi guys!
> 
> I have installed PA Linux 0.9 on my HP 712. Unfortunately, there is no telnet server. But I got the sources, so I would like to compile it. Unfortunately, gcc tells 
> me on installation that it depends on glibc6. When I try to install glibc6, it tells me it needs libdb2. If I try to install libdb2, it tells me it needs glibc6. I am at my 
> wits end at what to do. Anybody out there who can help a beginner??

telnetd exists in the debian archives.  If you have apt configured,
and are networked,  "apt-get install telnetd" should work for you.

My /etc/apt/sources.list looks like this:


deb http://beast:80/rel0.9/debian sid main
deb http://beast:80/rel0.9/more-packages/debian sid main

deb http://http.us.debian.org/debian/ unstable main non-free contrib
deb-src http://http.us.debian.org/debian/ unstable main non-free contrib
deb http://non-us.debian.org/debian-non-US unstable/non-US main contrib non-free
deb-src http://non-us.debian.org/debian-non-US unstable/non-US main contrib non-free


'beast' is my local server which is making the CD contents available
over http.  You want the last four lines, at least.

Then something like


apt-get update		# updates apt cache with available pkg details
apt-get install telnetd	# should "just work"


You can find telnetd_*_hppa.deb on a debian mirror under
/pub/mirrors/debian/pool/main/n/netkit-telnet if you just want to
grab a file, and then install with "dpkg -i telnetd....deb".

The pkgs that get installed initially are a little dated, and newer
ones are in more-packages on the CD.

BEWARE that when I installed e2fsprogs_1.20-1_hppa.deb from more-packages
the system wouldn't boot any more because e2fsck crashed.  I recovered
by reinstalling e2fsprogs_1.19-4_hppa.deb from the debian tree on the
CD.

You don't say how you are trying to install gcc, libdb2, etc, but
your problem can probably be solved either by apt-get which will
sort out the dependancies for you, or with dpkg -i, specifying multiple
.deb files are arguments.

Richard
