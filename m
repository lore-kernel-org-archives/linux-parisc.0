Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id ED28A4832
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Nov 2002 12:27:53 -0700 (MST)
Date: Wed, 13 Nov 2002 20:27:47 +0100
Subject: Re: [parisc-linux] Broken Cache Flushing in arch/parisc/kernel/signal.c.??
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v548)
Cc: Randolph Chung <randolph@tausq.org>,
	Ryan Bradetich <rbradetich@uswest.net>,
	parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <willy@debian.org>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <20021113122808.E30392@parcelfarce.linux.theplanet.co.uk>
Message-Id: <FDF661FC-F73D-11D6-B07E-0030656F07A2@esiee.fr>
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

Le mercredi, 13 nov 2002, =E0 13:28 Europe/Paris, Matthew Wilcox a =E9crit=
 :

> On Tue, Nov 12, 2002 at 11:52:34PM -0800, Randolph Chung wrote:
>> this is partly my fault, since i thought we have unbroken cache=20
>> flushing
>> and asked thibaut to check this in... now i see that the original =
code
>> flushes sr3 space, but flush_icache_range() flushes the kernel=20
>> space...
>> oops!
>>
>> perhaps we should just check the old code back in for now?
>
> Can we use
>   void flush_icache_user_range(struct vm_area_struct *vma,
>                         struct page *page, unsigned long addr, int =
len)
> ?  I'm not sure where we'd get the struct page from, though.

I reverted to the previous version until we find that out.
HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/=
