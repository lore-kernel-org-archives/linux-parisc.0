Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dobit2.rug.ac.be (dobit2.rug.ac.be [157.193.42.8])
	by dsl2.external.hp.com (Postfix) with ESMTP id 63D344829
	for <parisc-linux@lists.parisc-linux.org>; Sun, 29 Sep 2002 15:17:32 -0600 (MDT)
Received: from eduserv.rug.ac.be (eduserv.rug.ac.be [157.193.40.29])
	by dobit2.rug.ac.be (8.11.1/8.11.1) with ESMTP id g8TLHNq00248
	for <parisc-linux@lists.parisc-linux.org>; Sun, 29 Sep 2002 23:17:23 +0200 (MEST)
Received: from localhost (fcorneli@localhost)
	by eduserv.rug.ac.be (8.11.1/8.11.1) with ESMTP id g8TLHM303396
	for <parisc-linux@lists.parisc-linux.org>; Sun, 29 Sep 2002 23:17:22 +0200 (MEST)
Date: Sun, 29 Sep 2002 23:17:22 +0200 (MEST)
From: Frank Cornelis <Frank.Cornelis@rug.ac.be>
To: <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.GSO.4.31.0209292306350.1357-100000@eduserv.rug.ac.be>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] firmware update using BOOTP
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

The FAQ
	7. How can I check if the PDC (firmware) revision is the latest ?
at
	http://www.parisc-linux.org/faq/index.html
says nothing about updating the firmware using BOOTP.
I think it should be put there since it works great and is very easy to
do. I just upgraded a 712 from 2.1 to 2.3 using BOOTP.
The text file included with the firmware patch only talks about using a
tape for updating...uch. Please can someone update that FAQ nr. 7?
Yes, I'm a newbie on PA-RISC, but it should not take _me_ that long... I
have to find everything myself...

OK, lifimage already boots, next is my root NFS ... terrible... :)

Frank.
