Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel8.hp.com (atlrel8.hp.com [156.153.255.206])
	by dsl2.external.hp.com (Postfix) with ESMTP id E8F4F482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 31 Dec 2001 15:46:56 -0700 (MST)
Received: from ldl.fc.hp.com (linux-bugs.fc.hp.com [15.1.50.190])
	by atlrel8.hp.com (Postfix) with ESMTP
	id 79B01E00407; Mon, 31 Dec 2001 17:46:55 -0500 (EST)
To: parisc-linux@lists.parisc-linux.org,
	J.E.J.Bottomely@HansenPartnership.com
Subject: Re: [parisc-linux] Palo and initial ramdisks 
In-Reply-To: Your message of "Sun, 30 Dec 2001 09:45:53 CST."
             <200112301545.fBUFjrE01927@localhost.localdomain>
References: <200112301545.fBUFjrE01927@localhost.localdomain> 
Date: Mon, 31 Dec 2001 15:46:54 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E16LBCo-0006v3-00@noam.fc.hp.com>
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

= Playing some more with modules and initial ramdisks, I noticed that palo only
= allows use of a ramdisk when the ramdisk is placed inside the palo partition 
= rather than being able to read one from the boot ext2 filesystem.
= 
= The attached patch is a simple hack allowing palo to read a ramdisk from the 
= boot ext2 filesystem.

Oops, thought that was implemented.  Thanks for the patch, I put it
in CVS and uploaded a new debian package.

	-P
