Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5F4A24841
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Sep 2001 14:36:04 -0600 (MDT)
Received: from www2.scram.de (www2.scram.de [195.226.127.84])
	by mail.scram.de (8.11.0/8.11.0) with ESMTP id f8QKa2i17009
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Sep 2001 22:36:02 +0200 (CEST)
Date: Wed, 26 Sep 2001 22:34:31 +0200 (CEST)
From: Jochen Friedrich <jochen@scram.de>
To: Jurij Smakov <jurij@lokmail.net>
Subject: Re: [parisc-linux] The 720/50 saga continues... 
In-Reply-To: <200109261721.NAA01262@mail.lokmail.net>
Message-ID: <Pine.NEB.4.33.0109262154470.16939-100000@www2.scram.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
ReSent-Message-ID: <Pine.NEB.4.33.0109262235580.16939@www2.scram.de>

Hi Jurij,

> down_read(&mm->mmap_sem);
> vma = find_vma_prev(mm, address, &prev_vma);
>

I was roughly thinking about something like this (completely untested!!!):

case 18:
if (in_interrupt() || !mm)
        goto pagefault; /* shouldn't happen */

/* FIXME: do propper locking here */

pgd = pgd_offset(mm, address);        /* page directory */
if (pgd_none(pgd) || pgd_bad(pgd))
        goto pagefault; /* expandable stack etc */

pmd = pmd_offset(pgd, address);       /* middle page directory */
if (pmd_none(pmd) || pmd_bad((pmd))
        goto pagefault; /* expandable stack etc */

pte = pte_offset(pmd, address);       /* page table entry */
if (pte_none(pte))
        goto pagefault; /* expandable stack etc */

if (!pte_present(pte))  /* is this test sufficient? */
        goto pagefault; /* page not loaded */

acc_type = parisc_acctyp(code,regs->iir);

if ((acc_type & VM_WRITE) && (!(pte_write(pte))))
	goto pagefault; /* Write protected access */

if ((acc_type & VM_READ) && (!(pte_read(pte))))
	goto pagefault; /* Read protected access */

if ((acc_type & VM_EXEC) && (!(pte_exec(pte))))
	goto pagefault; /* Exec protected access */

/* fall through to case 28 */

Does this make sense?

Cheers,
Jochen
