Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA27460
	for <parisc-linux@puffin.external.hp.com>; Wed, 12 Jul 2000 13:55:33 -0600
Received: from ottawa.linuxcare.com (HELO localhost) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 12 Jul 2000 19:57:06 -0000
Received: from dhd by localhost with local (Exim 3.12 #1 (Debian))
	id 13CSbj-0005dz-00
	for <parisc-linux@thepuffingroup.com>; Wed, 12 Jul 2000 15:55:47 -0400
To: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 12 Jul 2000 15:55:47 -0400
Message-ID: <8766qb86nw.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Problem with malloc(3)/sbrk(2)/brk(2)/something
List-ID: <linux-parisc.vger.kernel.org>

Hi,

This is a follow-up to my footnote about not being able to run the
'config.guess' shell script with ash (and some other stuff) on our
userland.  Basically I've found a minimal testcase for the problem,
which is that it's not possible to malloc() across a page boundary.

Beware that since we don't have a real page fault handler, this
program will crash your machine.  (Press TOC, and we'll take it from
there :-)

If you turn on debugging assertions in the malloc code you'll see that
it triggers this assertion:

  /* We always land on a page boundary */
  assert(((unsigned long)((char*)top(ar_ptr) + top_size) & (pagesz-1)) == 0);

I don't see sbrk() or brk() failing, so I'm not exactly sure why this
happens.  I suspect they are returning bogus values in this case.  If
someone knows that would be great although I expect to find the
problem soon (I may try to get strace going, since it will be very
useful for other similar problems).

#include <stdlib.h>
#include <stdio.h>

int main()
{
	/* get the first address */
	char *foo = malloc(16);

	/* now try to break a page boundary */
	char *target = (char *) ((unsigned long) (foo + 4095) & ~4095);

	size_t nbytes = target - foo;
	foo = malloc(nbytes);
	return 0;
}

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.
