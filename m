Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 472AE482E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Dec 2002 09:59:41 -0700 (MST)
Date: Wed, 18 Dec 2002 09:02:55 -0800
From: Randolph Chung <randolph@tausq.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.5 randomly kills applications with page faults
Message-ID: <20021218170254.GM19331@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <200212181637.gBIGb5r02708@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200212181637.gBIGb5r02708@localhost.localdomain>
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

> In debugging the problems, so far it has always been stack manipulation 
> instructions in the user level code causing this.  Further, on adding a 

ditto.... there's a note about this in the todo....

> register dump to the page fault debugging code, the reason is that the stack 
> pointer is way out of where it should be for a user process (around 0x4f000), 
> so I surmise it got clobbered on a rare return path from kernel to user.

> Does anyone have any additional information and pointers?  I'm trying to audit 
> entry.S to see if there is a little used path that can clobber the stack, but 
> my parisc assembly isn't the best...
> 

that's what i thought too, so i went through entry.S as well to see what
i can find. haven't found anything yet :(

i was able to get the kernel to die simply by having a program do
gettimeofday() in a loop with 2.5...  i would guess it's a case where we
have to do some work on the syscall return path (resched, softirq, etc)
that's clobbering things, but i don't know what it is.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
