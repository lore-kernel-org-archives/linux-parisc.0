Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA03133
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Jan 2001 13:35:01 -0700
Message-Id: <200101022039.MAA27208@milano.cup.hp.com>
To: "David S. Miller" <davem@redhat.com>
Cc: linux-kernel@vger.kernel.org, alan@lxorguk.ukuu.org.uk,
        parisc-linux@thepuffingroup.com
Subject: Re: [PATCH] move xchg/cmpxchg to atomic.h 
In-reply-to: Your message of "Tue, 02 Jan 2001 01:03:48 PST."
             <200101020903.BAA14334@pizda.ninka.net>
Date: Tue, 02 Jan 2001 12:39:46 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


David,
Sorry for being dense - but I don't see the problem in using
a spinlock to implement xchg(). The example algorithm looks broken.
Or am I missing something obvious here?

"David S. Miller" wrote:
> It is very common to do things like:
> 
> producer(elem)
> {
> 	elem->next = list->head;
> 	xchg(&list->head, elem);
> }
> 
> consumer()
> {
> 	local_list = xchg(&list->head, NULL);
> 	for_each(elem, local_list)
> 		do_something(elem);
> }

producer() looks broken. The problem is two producers can race and
one will put the wrong value of list->head in elem->next.

I think prepending to list->head needs to either be protected by a spinlock
or be a per-cpu data structure. consumer() should be ok assuming the code
can tolerate picking up "late arrivals" in the next pass.
Or am I missing something obvious here?

It's worse if producer were inlined: the arch specific optimisers might
re-order the "elem->next = list->head" statement to be quite a bit more
than 1 or 2 cycles from the xchg() operation.

thanks,
grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253
