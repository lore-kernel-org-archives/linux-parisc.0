Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id LAA08966
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Dec 1999 11:31:51 -0700
Message-Id: <199912011833.NAA17015@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Progress - Update
To: alan@lxorguk.ukuu.org.uk (Alan Cox)
Date: Wed, 1 Dec 1999 13:33:09 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de, mklein@dis.com,
        alan@lxorguk.ukuu.org.uk, sieler@allegro.com,
        parisc-linux@thepuffingroup.com
In-Reply-To: <E11tE6d-0008Lk-00@the-village.bc.nu> from "Alan Cox" at Dec 1, 99 06:03:39 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> > 
> > Furthermore we have to care for cases like:
> > 
> > 	var = 1;
> > x=0;
> > CPU0		CPU1
> > xchg(&var,x);	test_and_set_bit(0, &var);
> 
> Umm. Does anyone actually rely on that ? Im not sure the non x86 ports have
> that property

Also, we may need to flush the cache line for &var.  The coding in buffer.c
which caused the original panic in xchg looks dubiousin this regoard:

        /* Update the reuse list */
		tail->b_next_free = xchg(&reuse_list, NULL);
		reuse_list = bh;


-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
