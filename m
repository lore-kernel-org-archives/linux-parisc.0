Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id 857334829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Apr 2003 11:42:47 -0700 (MST)
Received: from xatlrelay2.atl.hp.com (xatlrelay2.atl.hp.com [15.45.89.191])
	by atlrel8.hp.com (Postfix) with ESMTP id 161761C01C78
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Apr 2003 13:42:47 -0500 (EST)
Received: from xatlbh3.atl.hp.com (xatlbh3.atl.hp.com [15.45.89.188])
	by xatlrelay2.atl.hp.com (Postfix) with ESMTP id 077E21C000A0
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Apr 2003 13:42:47 -0500 (EST)
Message-ID: <25C4C6009B5BD5118FF30003470BF7F503501C63@xboi04.boi.hp.com>
From: "FUHRMAN,SCOTT (HP-Boise,ex1)" <scott.fuhrman@hp.com>
To: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Date: Tue, 1 Apr 2003 13:42:40 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Sound on C3000
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

Hi,

Just wondering if anyone else has gotten sound to work on this box, and
if so, how.

I ham enjoying a C3000 (400MHz) machine running hppa Debian, with kernel
2.4.20-32.
Everything is working except the sound.  Sound server can start up, but
does not have a device to output to.  

I checked dmesg and /var/log/messages and did not see anything where the
sound device is being configured, but it looks as though it may be
suported from the info on parisc-linux.org.  The device is a 

AD1889 sound chip (Analog Devices) according to this page:

 http://hwdb.parisc-linux.org/view.php3?type=machine&name=C3000

Anyway, if anyone has had any success in this matter please do tell!


Thanks,
