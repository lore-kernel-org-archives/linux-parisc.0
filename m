Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 38DB04829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Nov 2002 10:31:42 -0700 (MST)
Message-Id: <200211261731.gAQHVZ4N021906@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: uaccess ya patch
To: tausq@debian.org
Date: Tue, 26 Nov 2002 12:31:35 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: jsoe0708@tiscali.be, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021126172213.GI19331@tausq.org> from "Randolph Chung" at Nov 26, 2002 09:22:13 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> > It was much more to mentionned that in asm extension of gcc for hppa it exists
> > also a way to address the second word (what I tried to find for a long) of
> > a long long via the 'R' prefix as here in '%R2' [is it what you want to say
> > 'will cause bad things'?]
> 
> maybe you are thinking of floating point registers? %r2 is general
> register number 2, i.e. the return pointer.  it is not what you want to
> store into memory.

The 'R' operand code selects the second half of a register pair.  So
'%R2' refers to the second half of operand 2 in the asm.  Look at
print_operand in pa.c to see the available codes for asms.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
