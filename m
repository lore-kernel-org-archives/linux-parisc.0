Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pogo.mtv1.steeleye.com (host194.steeleye.com [66.206.164.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id 84500482E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Dec 2002 09:37:15 -0700 (MST)
Received: (from root@localhost)
	by pogo.mtv1.steeleye.com (8.9.3/8.9.3) id IAA05731
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Dec 2002 08:37:10 -0800
Received: from mulgrave (jejb@localhost)
	by localhost.localdomain (8.11.6/linuxconf) with ESMTP id gBIGb5r02708;
	Wed, 18 Dec 2002 10:37:05 -0600
Message-Id: <200212181637.gBIGb5r02708@localhost.localdomain>
To: parisc-linux@lists.parisc-linux.org
Cc: James.Bottomley@SteelEye.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 18 Dec 2002 10:37:05 -0600
From: James Bottomley <James.Bottomley@steeleye.com>
Subject: [parisc-linux] 2.5 randomly kills applications with page faults
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

I find when booting 2.5.51 up on a C380 that applications seem to take random 
page faults and die.  It seems that the more heavily an application does file 
accesses, the more likely it is to suffer from this.

In debugging the problems, so far it has always been stack manipulation 
instructions in the user level code causing this.  Further, on adding a 
register dump to the page fault debugging code, the reason is that the stack 
pointer is way out of where it should be for a user process (around 0x4f000), 
so I surmise it got clobbered on a rare return path from kernel to user.

Does anyone have any additional information and pointers?  I'm trying to audit 
entry.S to see if there is a little used path that can clobber the stack, but 
my parisc assembly isn't the best...

James
