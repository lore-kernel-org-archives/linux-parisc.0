Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA24971
	for <parisc-linux@puffin.external.hp.com>; Wed, 12 Jul 2000 12:38:02 -0600
Message-Id: <200007121835.OAA04401@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Internal compiler error
To: grundler@cup.hp.com (Grant Grundler)
Date: Wed, 12 Jul 2000 14:35:08 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <200007121826.LAA14363@milano.cup.hp.com> from "Grant Grundler" at Jul 12, 2000 11:26:37 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Grant,

Is this patch in your tree?

2000-06-26  J. David Anglin  <dave@hiauly1.hia.nrc.ca>

        * c-typeck.c (digest_init): Return error_mark_node node when
	TREE_TYPE (init)  == error_mark_node.

The problem looks similar to the one the above patch addressed.

Dave (jda)

> 
> Dave (dhd),
> Since you expressed an interest in compiler bugs:
> 
> ...
> make[1]: Leaving directory `/linux/grundler/linux-2.3/arch/parisc/hpux'
> hppa-linux-gcc -I/linux/grundler/linux-2.3/include  -D__KERNEL__ -I/linux/grundler/linux-2.3/include -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -fno-strict-aliasing -ffunction-sections -D__linux__ -pipe -fno-strength-reduce  -DUTS_MACHINE='"parisc"' -c -o init/version.o init/version.c
> dino.c: In function `dino_common_init':
> dino.c:675: incompatible type for argument 2 of `list_add'
> dino.c:675: Tree check: expected class 't', have 'x' (error_mark)
> dino.c:675: Internal compiler error in `expand_inline_function', at integrate.c:678
> Please submit a full bug report.
> See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.
> make[3]: *** [dino.o] Error 1
> make[3]: Leaving directory `/linux/grundler/linux-2.3/drivers/gsc'
> ...
> 
> I'm changing code in several files in order to build an I/O tree of hp_devices
> much like pci does...the problem above was due to one of my changes:
> 
> ...
> STATIC struct list_head dino_list;
> ...
> 
>         list_add(&dino_dev->dino_hba.hba_dev->global_list, dino_list);
> 
> 
> Missing a '&' in front of dino_list and the compiler really
> didn't like that. I don't have a big problem with the compiler
> "oops"ing here since it correctly identified the problem.
> 
> cheers,
> grant
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 
> 


-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
