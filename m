Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 09FEB4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Nov 2002 11:41:03 -0700 (MST)
Date: Tue, 26 Nov 2002 10:44:55 -0800
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: jsoe0708@tiscali.be, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: uaccess ya patch
Message-ID: <20021126184455.GK19331@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20021126172213.GI19331@tausq.org> <200211261731.gAQHVZ4N021906@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200211261731.gAQHVZ4N021906@hiauly1.hia.nrc.ca>
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

> > maybe you are thinking of floating point registers? %r2 is general
> > register number 2, i.e. the return pointer.  it is not what you want to
> > store into memory.
> 
> The 'R' operand code selects the second half of a register pair.  So
> '%R2' refers to the second half of operand 2 in the asm.  Look at
> print_operand in pa.c to see the available codes for asms.

oh, i see, somehow i thought %R2 == %r2...

i guess if a 64-bit number is always passed in a way that we can access
the first half as %1 and the second half as %1R then we can do away with
the masking.... 

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
