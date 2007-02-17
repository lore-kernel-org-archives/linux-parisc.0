From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: call_init in libc6 2.3.6.ds1-11
Date: Sat, 17 Feb 2007 15:43:07 -0500 (EST)
Message-ID: <200702172043.l1HKh71P024335__35471.6398324401$1416624293$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440702171237p32753949i7ade700ee405cead@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702171237p32753949i7ade700ee405cead@mail.gmail.com>
	from "Carlos O'Donell" at Feb 17, 2007 03:37:36 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > While it's possible that DT_INIT and DT_FINI shouldn't point at function
> > descriptors, the above hack can't be right since DL_DT_INIT_ADDRESS is used
> > for calling init() from dl-init.c:
> >
> >       init_t init = (init_t) DL_DT_INIT_ADDRESS
> >         (l, l->l_addr + l->l_info[DT_INIT]->d_un.d_ptr);
> >
> >       /* Call the function.  */
> >       init (argc, argv, env);
> 
> We might have been lucky in that init () called another function which
> setup r19 for us before we accessed data. I agree completely that r19
> should be set to the r19 of the module before calling init(), even if
> it *is* or *isn't* a function descriptor.
> 
> I wrote dl-lookupcfg.h, and the code you see there is legacy. I
> carried it forward without understanding what it meant.

It may be that special care is needed for applications that are
statically linked.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
