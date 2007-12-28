From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: segv doing execv
Date: Thu, 27 Dec 2007 23:12:23 -0500
Message-ID: <119aab440712272012g3ff7c5c6n5e16437bc5dd6003@mail.gmail.com>
References: <119aab440712271425s8df1ed5i37749ad6c541f8ae@mail.gmail.com>
	 <200712272328.lBRNSI6s028957@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200712272328.lBRNSI6s028957@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Dec 27, 2007 6:28 PM, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> That's cool but how do does CodeSourcery actually fix the "kernel"?

By writing reproducible test cases and giving them to the the Linux kernel
vendor, who in turn gets their kernel engineers to fix the bug :-)

> > Not a clue. How did you capture the failure in the debugger?
>
> With a core dump!  Actually, I was hoping you might recognize the assembler
> code and understand what failed ;)

I don't recognize the assembler dump as any particularly important
sequence.

> I'm currently trying to use the debug libraries.  It seems gdb won't
> load the debug libraries when a failure occurs with non-debug libs.

Do you actually mean "stripped libraries" vs. "unstripped libraries?"

Cheers,
Carlos.
