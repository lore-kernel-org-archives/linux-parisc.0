Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hadron.dyndns.org (ma-amesbury1e-100.mrrmnh.adelphia.net [68.168.107.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id C9C52484B
	for <parisc-linux@lists.parisc-linux.org>; Sun,  2 Feb 2003 19:02:57 -0700 (MST)
Received: from hadron.dyndns.org (LOCALHOST [127.0.0.1])
	by hadron.dyndns.org (8.12.7/8.12.7/Debian-2) with ESMTP id h1322qT5020910
	for <parisc-linux@lists.parisc-linux.org>; Sun, 2 Feb 2003 21:02:52 -0500
Received: (from asp@localhost)
	by hadron.dyndns.org (8.12.7/8.12.7/Debian-2) id h1322lob020909
	for parisc-linux@lists.parisc-linux.org; Sun, 2 Feb 2003 21:02:47 -0500
Date: Sun, 2 Feb 2003 21:02:47 -0500
From: "Aaron St. Pierre" <asp@ungod.com>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030203020247.GB1046@hadron>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] kernel compile
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

I have been trying to get linux-2.4.20-pa23 to work with my j2240. For
awhile now I thought it was the console, but it isn't it is the kernel.
Here are the steps I took: 

Got the box running with debian kernel 2.4.17-32, 
updated to 2.4.18-32, and everything was working fine. 
I took the config from 2.4.18-32 and
used that as my starting point for 2.4.20-pa23 
ran make dep and make vmlinux; made and installed the modules

The box just stops at the branching message. Let me note the console is
set properly. I posted here before but think I was ignored becuase 
it was assumed I hadn't read the faq. Please I have read the faq, I just
need help I would love to get this box working with a recent kernel and 
not have to depend on the packaged debian kernels. 

Thanks. 

-- 
Aaron St. Pierre			tel: 978.828.6177
asp@ungod.com

 Increased knowledge will help you now.  Have mate's phone bugged.
