Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA26787
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Nov 1999 16:45:58 -0700
Message-Id: <199911252347.SAA01418@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Progress - Update
To: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de (Philipp Rumpf)
Date: Thu, 25 Nov 1999 18:47:19 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@lxorguk.ukuu.org.uk, Philipp.H.Rumpf@mathe.stud.uni-erlangen.de,
        sieler@allegro.com, parisc-linux@thepuffingroup.com
In-Reply-To: <19991125142433.P1009@mathe.stud.uni-erlangen.de> from "Philipp Rumpf" at Nov 25, 99 02:24:33 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> GR30 in our case.

GR30 (sp) appears ok.  It had a value of 0xc019e6c0 when the panic
in sem_exit occured.  The panic occured in this code:

        if ((q = current->semsleeping)) {
		if (q->prev)

The value for q (GR20) was 0xfffc5e6c.  Thus, the initialization of
the process task structure needs to be looked at.

I built another kernel without IPC.  In this one, the kernel panic'd
in get_unused_buffer_head.  This one occured because unused_list was
zero.  Again, it looks like there is an initialization problem somewhere.
I think others have reported this problem in the past.  It looks like:

bad address 0000001c (code 15)
Kernel panic: bad address

Here is the code:

static struct buffer_head * get_unused_buffer_head(int async)
{
        struct buffer_head * bh;

	recover_reusable_buffer_heads();
	if (nr_unused_buffer_heads > NR_RESERVED) {
		bh = unused_list;
		unused_list = bh->b_next_free;

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
