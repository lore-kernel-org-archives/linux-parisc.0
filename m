Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7C18D483E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 21 Sep 2003 13:19:13 -0600 (MDT)
Date: Sun, 21 Sep 2003 15:16:53 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: dave.anglin@nrc-cnrc.gc.ca, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Found the r19 problem!
Message-ID: <20030921191653.GJ6963@systemhalted>
References: <20030921185531.GH6963@systemhalted> <200309211912.h8LJCd59011386@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200309211912.h8LJCd59011386@hiauly1.hia.nrc.ca>
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

On Sun, Sep 21, 2003 at 03:12:39PM -0400, John David Anglin wrote:
> Well that's why the restore is deleted.  So, the clobber must go
> and r19 must be preserved across the asm(...).  As I said, you can't
> clobber r19 when generating pic code.  It's treated as fixed register,
> so clobbering it can lead to undefined behavior.
> 
> If the syscall used r19, it could include a use of r19 in the asm.
> This would ensure the restore occurs before the syscall.

I'm going to stop writing r19 to the stack and tell gcc I'm using r4,
and then do a copy/copy to get r19 back.

c.
