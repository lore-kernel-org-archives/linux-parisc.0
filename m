Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhenium.btinternet.com (rhenium.btinternet.com [194.73.73.93])
	by dsl2.external.hp.com (Postfix) with ESMTP id 918544831
	for <parisc-linux@lists.parisc-linux.org>; Sat, 23 Feb 2002 06:52:11 -0700 (MST)
Received: from host217-34-78-1.in-addr.btopenworld.com ([217.34.78.1] helo=liberator.zorg.org)
	by rhenium.btinternet.com with esmtp (Exim 3.22 #8)
	id 16ecav-0006nr-00
	for parisc-linux@lists.parisc-linux.org; Sat, 23 Feb 2002 13:52:09 +0000
Received: from there (hal [192.168.0.42])
	by liberator.zorg.org (8.9.3/8.8.7) with SMTP id NAA04205
	for <parisc-linux@lists.parisc-linux.org>; Sat, 23 Feb 2002 13:52:09 GMT
Message-Id: <200202231352.NAA04205@liberator.zorg.org>
Content-Type: text/plain;
  charset="iso-8859-1"
From: nsc <nsc@connectednet.co.uk>
To: parisc-linux@lists.parisc-linux.org
Date: Sat, 23 Feb 2002 13:52:10 +0000
MIME-Version: 1.0
Subject: [parisc-linux] Problem installing 0.9.3 on 715/100XC
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

Hi guys, I'm trying to install 0.9.3 on a 715/100XC and have run into a 
problem.

'sea scsi' shows I have:

scsi.6.0	SEAGATE ST32151N
scsi.2.0	TOSHIBA CD-ROM XM-3701TA

'sea ipl' shows the CD-ROM

So I issue 'boot scsi.2.0 ipl' and the get the following:

Attempting to boot.
Loading Initial Program Loader
ERROR: Cannot load IPL, error detected
Boot process failed. press <ESCAPE> to Continue

md5sums on the iso image check out and I've burned a couple of cd's just in 
case the first was dodgy.
The Toshiba CD-ROM is known to work and boots my SGI Indy just fine.

This machine has BootRom Version 1.1, could this be causing a problem?

Where do I go from here?

Thanks for any help,
Nathan.
