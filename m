Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rotapile (rotapile.winshop.com.au [210.8.124.204])
	by dsl2.external.hp.com (Postfix) with ESMTP id 33A1A4829
	for <parisc-linux@parisc-linux.org>; Fri, 20 Sep 2002 17:55:20 -0600 (MDT)
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
	by rotapile with esmtp (Exim 3.35 #1 (Debian))
	id 17sXc9-0001pP-00
	for <parisc-linux@parisc-linux.org>; Sat, 21 Sep 2002 09:55:13 +1000
Subject: Re: [parisc-linux] SMP kernel problems on a D350
From: Robert Stanford <rob@rotapile.com>
To: Parisc <parisc-linux@parisc-linux.org>
In-Reply-To: 
	<Pine.LNX.4.44.0209201608450.20374-100000@garibaldi.apptechsys.com>
References: 
	<Pine.LNX.4.44.0209201608450.20374-100000@garibaldi.apptechsys.com>
Content-Type: text/plain
Date: 21 Sep 2002 09:55:11 +1000
Message-Id: <1032566113.28402.20.camel@rotapile>
Mime-Version: 1.0
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

Well things seem to be getting better on my 580

k580:~# uname -a                            
Linux k580 2.4.19-pa18 #26 SMP Sat Sep 21 09:09:22 EST 2002 parisc
unknown

k580:~# apt-get update  
Get:1 http://ftp.au.debian.org unstable/main Packages [1962kB]
Get:2 http://ftp.au.debian.org unstable/main Release [82B]
Get:3 http://ftp.au.debian.org unstable/non-free Packages [50.0kB]
Get:4 http://ftp.au.debian.org unstable/non-free Release [86B]
Get:5 http://ftp.au.debian.org unstable/contrib Packages [47.8kB]
Get:6 http://ftp.au.debian.org unstable/contrib Release [85B]
Fetched 2060kB in 11m39s (2944B/s)
apt-get(181): unaligned access to 0x403ce08c at ip=0x4005e4f7
apt-get(181): unaligned access to 0xef20c024 at ip=0x4005e4fb
isr verification failed (isr: 00000000, sr7: 000000ac 
Unaligned handler failed, ret = 1

k580:~# /etc/init.d/samba start                                
Starting Samba daemons: nmbd smbdsmbd(175): unaligned access to
0x4001a2b8 at if

Robert Stanford
