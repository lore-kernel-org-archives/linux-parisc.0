Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.cs.tu-berlin.de (mail.cs.tu-berlin.de [130.149.17.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4A5BB4840
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Feb 2002 17:29:46 -0700 (MST)
Received: from bolero.cs.tu-berlin.de (daemon@bolero.cs.tu-berlin.de [130.149.19.1])
	by mail.cs.tu-berlin.de (8.9.3/8.9.3) with ESMTP id BAA02317
	for <parisc-linux@lists.parisc-linux.org>; Fri, 1 Mar 2002 01:24:59 +0100 (MET)
From: Matthias Klose <doko@cs.tu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <15486.51802.168431.29867@gargle.gargle.HOWL>
Date: Fri, 1 Mar 2002 01:24:58 +0100
To: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] disk I/O error
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

ok, seems that the root fs is damaged after some locks and following
resets. For the reinstallation, which kernel should be used on a A500? 
I Tried 2.4.17-64-smp, 2.4.16-64-smp, 2.4.17-64 and
2.4.16-64. However, the machine locks up after three, maybe four days.
 
init-2.05a# ls -l /lib/libext2fs.so.2.4  
ls: /lib/libext2fs.so.2.4: Input/output error 
 
attempt to access beyond end of device 
08:06: rw=0, want=6803996040, limit=1999856 
attempt to access beyond end of device 
08:06: rw=0, want=7745165772, limit=1999856 
attempt to access beyond end of device 
/p/pari/libpari1-dev_2.1.3-1_hppa.deb 
Size: 1540332 
