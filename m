Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id JAA16125
	for <parisc-linux@puffin.external.hp.com>; Sat, 27 Jan 2001 09:36:49 -0700
Message-Id: <200101271639.LAA07330@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Usage of __attribute__?
To: jsm@udlkern.fc.hp.com (John Marvin)
Date: Sat, 27 Jan 2001 11:39:25 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@puffin.external.hp.com
In-Reply-To: <200101270948.CAA00365@udlkern.fc.hp.com> from "John Marvin" at Jan 27, 2001 02:48:49 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

John,

I think you should forward this question to gcc@gcc.gnu.org.

> As part of my effort to fix the alignment problems in libpthread, I am
> creating a type with the aligned attribute. However, I discovered
> something strange, which I don't know if it is a bug, or is the expected
> behaviour (i.e. I am doing something wrong/don't understand how
> __attribute__ works).
> 
> If I directly declare the type as follows:
> 
>     typedef int _lt_spinlock_t __attribute__((aligned(16)));
> 
> then EVERY int that follows has the aligned 16 attribute, e.g. just
> declaring "int tmp;" gives tmp a 16 byte alignment. So, is that what
> you would expect from my above declaration?
> 
> I worked around the problem by declaring the type in two steps:
> 
>     typedef int _spin16;
>     typedef _spin16 _lt_spinlock_t __attribute__((aligned(16)));
> 
> Is there a way of combining the above two into one declaration,
> without having the undesired side effect of making every int
> aligned to a 16 byte boundary?
> 
> John Marvin
> jsm@fc.hp.com
> 
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 


-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
