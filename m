Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id C4E724840
	for <parisc-linux@lists.parisc-linux.org>; Sun, 26 Oct 2003 07:06:20 -0700 (MST)
Message-ID: <3F9BD4DA.6020906@tiscali.be>
Date: Sun, 26 Oct 2003 14:06:18 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] gcc-hppa64 failled to install on my c110
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

Hi all,

I try to apt-get install gcc-hppa64 (having added <deb 
http://ftp.parisc-linux.org/ unofficial-debs/> entry in my sources.list)
on my c110 (a fresh debian/unstable install) but it fails with following 
message:
hpalin:/Debian-apt/Debian4hppa# apt-get install gcc-hppa64
Reading Package Lists... Done
Building Dependency Tree... Done
The following NEW packages will be installed:
   gcc-hppa64
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 16.1MB of archives.
After unpacking 39.0MB of additional disk space will be used.
Err http://ftp.parisc-linux.org unofficial-debs/ gcc-hppa64 1:3.2.3-0.1
   404 Not Found
Failed to fetch 
http://ftp.parisc-linux.org/./gcc-hppa64_3.2.3-0.1_hppa.deb  404 Not Found
E: Unable to fetch some archives, maybe run apt-get update or try with 
--fix-missing?

What do I wrong?
And gcc-hppa64_3.2.3-0.1_hppa.deb isn't anymore in  unofficial-debs, 
what do i miss?

Thanks in advance for help,
	Joel
