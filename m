Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA05664
	for <parisc-linux@puffin.external.hp.com>; Sat, 2 Sep 2000 23:18:13 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 3 Sep 2000 05:18:23 -0000
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Boot error on C200+
References: <39B1822A.4E8F20AB@uswest.net> <87em32l26m.fsf@linuxcare.com> <39B1B6D7.8898D3C6@uswest.net>
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 03 Sep 2000 01:16:46 -0400
In-Reply-To: Ryan Bradetich's message of "Sat, 02 Sep 2000 20:26:31 -0600"
Message-ID: <877l8ukqbl.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Ryan Bradetich <rbradetich@uswest.net> writes:

> > Note that GR20 is 0x37, which is the syscall number for fcntl(), which
> > confirms your earlier findings :-)
> 
> From arch/parisc/kernel/syscall.S
> 
>         ENTRY_NAME(sys_ioctl)
>         ENTRY_NAME(sys_fcntl)           /* 55 */
>         ENTRY_NAME(sys_socketpair)
> 
> 55 = 0x37 ....  I understand that....I don't see where GR20 is mapped to the
> the syscall number.... (Not really important that I know now... but curious)

A system call on PA-RISC Linux looks like this:

        be,l    0x100(%sr2,%r0),%sr0,%r31
        ldi     <syscall number>,%r20

(with six possible arguments in %r26 - %r21)

> From this statement, I assume it is a kernel problem and not a glibc
> problem ... since the kernel would perform the mapping?  I'll start digging
> around in the kernel and see what I can find.... any hints where to start?

I think the explanation regarding the TLB miss handlers is correct,
but I haven't tried on the C360 since it doesn't get to userland for
me :(

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
