Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA15562
	for <parisc-linux@puffin.external.hp.com>; Tue, 17 Aug 1999 13:14:53 -0600
Message-Id: <199908171916.MAA24603@adlmail.cup.hp.com>
Subject: Re: [parisc-linux] sigsetreturn (was utssys?)
Date: Tue, 17 Aug 1999 12:20:07 -0700
From: Cary Coutant <cary@cup.hp.com>
To: "Matthew Wilcox" <Matthew.Wilcox@genedata.com>,
        <parisc-linux@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

>I also can't find a manual page for sigsetreturn() which I probably need
>to understand more deeply than utssys :-)

When the kernel passes control to a signal handler, it needs to set the 
stack up with a signal context structure and a return address that 
results in the restoration of that context when (and if) the signal 
handler returns. Since the normal BV instruction used for returns can't 
branch across space boundaries, the signal handler can't return directly 
to kernel space, so the kernel needs to supply a return address in user 
space that will implement the restoration of the interrupted context. 
This return address is the sigreturn() system call, found in libc. In 
order for the kernel to know the address of sigreturn, it needs to be 
told in advance; that's what sigsetreturn() does.

The call to sigsetreturn() has been moved around several times in the 
history of HP-UX. At one point, it was in the _start() routine in the C 
library, but that didn't get called for Fortran programs, so it was added 
to several of the signal routines, to make sure it got called before any 
signal handlers could be installed. Ultimately, I think it ended up in 
crt0, where it should have been all along.

Sigsetreturn() also supplies a "cookie" that the kernel can use to 
determine what the vintage is of the running program. For programs build 
for PA 1.0, for example, the cookie tells the kernel to deliver a shorter 
signal context record, since some of those early applications were 
actually dependent on the size and layout of the context record. Someone 
in OS land will probably have to supply you with the detailed meanings of 
the cookies used in this call, if it matters.

Cary Coutant
Runtime Architect
