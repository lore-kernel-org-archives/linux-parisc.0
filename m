Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from xo.hp.is (xo.hp.is [194.105.242.199])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5D805482B
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Nov 2001 09:15:10 -0700 (MST)
Received: (from ra@localhost)
	by xo.hp.is (8.11.6/RA-8.11.6) id fA6GF8502773
	for parisc-linux@lists.parisc-linux.org; Tue, 6 Nov 2001 16:15:08 GMT
Date: Tue, 6 Nov 2001 16:15:08 +0000
From: Richard Allen <ra@hp.is>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011106161508.C1639@hp.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] B2000 :-)
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

Good news :-)

bofh:/etc/network# uname -a
Linux bofh 2.4.9-pa70 #1 Tue Nov 6 15:38:47 GMT 2001 parisc unknown

bofh:/etc/network# cat /proc/cpuinfo 
processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8600 (PCX-W+)
cpu MHz         : 400.000000
model           : 9000/785/B2000
model name      : Kazoo W+
hversion        : 0x00005d00
sversion        : 0x00000481
I-cache         : 512 KB
D-cache         : 1024 KB (WB)
ITLB entries    : 160
DTLB entries    : 160 - shared with ITLB
BTLB            : not supported
bogomips        : 799.53
software id     : 2011377660


The kernel snapshot from late October crashed on this machine.
Now all runs smooth :-)   (with serial console and no IDE connected)


-- 
Rikki.         --  HP Technical Support, RHCE, RHCX, HP-UX Certified Admin.
               --  Solaris 7 Certified Systems and Network Administrator.
Bell Labs Unix --  Reach out and grep someone.
Those who do not understand Unix are condemned to reinvent it, poorly.
