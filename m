Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel9.hp.com (atlrel9.hp.com [156.153.255.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id E2E66482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 13 Jan 2002 23:54:22 -0700 (MST)
Received: from udlkern.fc.hp.com (udlkern.fc.hp.com [15.1.52.48])
	by atlrel9.hp.com (Postfix) with ESMTP id 95491E00314
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jan 2002 01:54:21 -0500 (EST)
Received: (from jsm@localhost)
	by udlkern.fc.hp.com (8.9.3 (PHNE_18979)/8.9.3 SMKit7.01) id XAA06768
	for parisc-linux@lists.parisc-linux.org; Sun, 13 Jan 2002 23:54:21 -0700 (MST)
Date: Sun, 13 Jan 2002 23:54:21 -0700 (MST)
From: John Marvin <jsm@udlkern.fc.hp.com>
Message-Id: <200201140654.XAA06768@udlkern.fc.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] atomic_t
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

> >
> > But someone thought it was time to reset the counter. And if
> > it "never happened", then whoever is looking for 'v == 1' will
> > never see it.
>
> It's a race though; they can't guarantee to see it anyway.
>

Yes, it is a race in that you can't be guaranteed that you will ever see
the value equal to 1. But you should be guaranteed that it WAS reset.

For example:

    1) Initialize counter to 1.
    2) Increment counter by 1 each time event "X" occurs using
       atomic_add_return.
    3) Reset counter to 1 each time event "Y" occurs using atomic_set.
    4) Signal an error if the counter ever exceeds some threshold
       value, i.e. it is an error if too many "X" events occur without
       and intervening "Y" event.

In the above scenario you could not be guaranteed that you would ever see
the counter at one (or any particular value), but you could falsely
trigger the error condition if the resets were lost (by removing the
spinlocks from atomic_set).

John
