Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA26829
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Jan 2001 02:18:38 -0700
Date: Tue, 2 Jan 2001 01:03:48 -0800
Message-Id: <200101020903.BAA14334@pizda.ninka.net>
From: "David S. Miller" <davem@redhat.com>
To: grundler@cup.hp.com
CC: linux-kernel@vger.kernel.org, alan@lxorguk.ukuu.org.uk,
        parisc-linux@thepuffingroup.com
In-reply-to: <200101020811.AAA26525@milano.cup.hp.com> (message from Grant
	Grundler on Tue, 2 Jan 2001 00:11:57 -0800 (PST))
Subject: Re: [PATCH] move xchg/cmpxchg to atomic.h
References: <200101020811.AAA26525@milano.cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

   Date: 	Tue, 2 Jan 2001 00:11:57 -0800 (PST)
   From: Grant Grundler <grundler@cup.hp.com>

   Fundemental problem is parisc only supports one atomic operation
   (LDCW/LDCD) and uses spinlocks for all atomic operations including
   xchg/cmpxchg.

Using spinlocks for the implementation of xchg on SMP might be
problematic.

If you implement things like this, several subtle things might
break.  For example, there is code in a few spots (or, at least at one
time there was) which assumed the update of the datum itself is atomic
and uses this assumption to do lock-free read-only accesses of the
data.

If you require an external agent (f.e. your spinlock) because you
cannot implement xchg with a real atomic sequence, this breaks the
above assumptions.

It is very common to do things like:

producer(elem)
{
	elem->next = list->head;
	xchg(&list->head, elem);
}

consumer()
{
	local_list = xchg(&list->head, NULL);
	for_each(elem, local_list)
		do_something(elem);
}

In fact we had code excatly like this in the buffer cache at one
point in time.

Later,
David S. Miller
davem@redhat.com
