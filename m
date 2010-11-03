From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPMC in lba_pat_out8 on rp3440
Date: Tue, 2 Nov 2010 23:19:20 -0400
Message-ID: <20101103031919.GA20990@hiauly1.hia.nrc.ca>
References: <20101031174018.GA26539@hiauly1.hia.nrc.ca> <20101102062623.GC14166@lackof.org>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101102062623.GC14166@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 02 Nov 2010, Grant Grundler wrote:

> > IIA Offset (back entry)      = 0x0000000040329438
> 
> Is this a kernel address...can you tell me what it matches?

The kernel address was shown in the analysis at the end of of the dump..

> Can you please also look up GR1?

I believe GR1 points into the DLT.  The code is loading the address
of lba_t32.  One can see this from the relocations for lba_pci.o.

> > 000000004031e3f0 <lba_pat_out8>:
> >     4031e3f0:   d7 9f 18 52     depwi,z -1,29,14,ret0
> >     4031e3f4:   53 5f 03 30     ldd 198(r26),r31
> >     4031e3f8:   db 39 0b f0     extrd,u r25,63,16,r25
> >     4031e3fc:   db 33 0b fe     extrd,u r25,63,2,r19
> >     4031e400:   0b 99 02 39     and r25,ret0,r25
> >     4031e404:   f3 39 11 4a     depd,z r25,53,54,r25
> >     4031e408:   0a 79 0a 39     add,l r25,r19,r25
> >     4031e40c:   0b 3f 0a 3f     add,l r31,r25,r31
> >     4031e410:   0f f8 12 00     stb r24,0(r31)
> >     4031e414:   0f 40 10 dc     ldd 0(r26),ret0
> >     4031e418:   2b 6d 00 00     addil L%1a000,dp,r1
> > ->  4031e41c:   0f 80 10 9f     ldw 0(ret0),r31
> >     4031e420:   50 3c 0f 10     ldd 788(r1),ret0
> >     4031e424:   e8 40 d0 00     bve (rp)
> >     4031e428:   0f 9f 12 80     stw r31,0(ret0)
> >     4031e42c:   00 00 00 00     break 0,0

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
