Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id KAA31685
	for <parisc-linux@puffin.external.hp.com>; Fri, 10 Dec 1999 10:47:49 -0700
Message-Id: <199912101749.MAA14555@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] a pretty big change
To: bame@fc.hp.com (Paul Bame)
Date: Fri, 10 Dec 1999 12:49:38 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: ulrich_strelow@yahoo.com, parisc-linux@thepuffingroup.com
In-Reply-To: <199912101715.KAA32234@debian.fc.hp.com> from "Paul Bame" at Dec 10, 99 10:15:57 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> 
> 
> Ulrich,
> 
> I apologize for suggesting you consider the
> r1 value 0xc0112000 by mistake, I meant the r2 value 0xc004a170.
> >From the r2 and iaoq values, it looks like create_buffers():
> 
> create_buffers+4C:              STW             r0,-116(r30)
>                 LDI             4096,r4
>                 SUB             r4,r8,r4
>                 COMIB,>         0,r4,create_buffers+0x00a0
>                 LDI             0,r3
>                 ZDEPI           -1,31,16,r5
>                 BL              get_unused_buffer_head,r2
>                 OR              r9,r0,r26
>                 MOVB,=,N        r28,r26,create_buffers+0x00a8	***** %r2
>                 STW             r3,20(r26)
> 
> Just called get_unused_buffer_head, which died on the indicated line:
> 
> get_unused_buffer_head+4C:      ADDIL           L%0x73000,r27
>                 LDO             -1(r20),r20 	; nr_unused_buffer_heads--
>                 LDW             232(r1),r3	; r3 = bh
>                 STW             r20,264(r4)	; nr_unused_buffer_heads--
>                 OR              r3,r0,r28	; return value = r3
>                 LDW             28(r3),r19	*** died here
>                 B               get_unused_buffer_head+0x00e0
>                 STW             r19,232(r1)
> 
> Since %r3 is zero at this moment, we die.  I think we are dying trying
> to execute 'unused_list = bh->b_next_free;' in get_unused_buffer_head()
> with bh = 0.  No idea why.

See my mail to the list on Nov. 30, "Re: [parisc-linux] Progress - Update".  xchg has clobbered unused_list.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
