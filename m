Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail1.tiscali.be [212.35.2.121])
	by dsl2.external.hp.com (Postfix) with ESMTP id CB911482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Apr 2002 02:47:18 -0700 (MST)
To: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] "unaligned access to ... at ip=..." problem with evms and jfs
Message-ID: <1017913566.3cac20de230de@webmail.tiscalinet.be>
Date: Thu, 04 Apr 2002 11:46:06 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <1017854653.3cab3abdab486@webmail.tiscalinet.be> <20020403181337.GA3759@tausq.org>
In-Reply-To: <20020403181337.GA3759@tausq.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Quoting Randolph Chung <randolph@tausq.org>:

> > It seems harmless but not sure.
> 
> well.... in general this is not a problem, however....
> 
> Fleedwood found a bug in the unaligned handler last week. it doesn't
> handle the pre/post increment cases of load and store, and there may be
> some cases where these messages will indicate the cause of errors.
> 
> I'll look into fixing this, but it might take some time.
> 

Well I will be patient as till now (at least a month) evms seems to works
correctly :-)

> > I query the ml db and found similar problems (and its solution :_)
> )(reiserfs:
> > http://lists.parisc-linux.org/hypermail/parisc-linux/5862.html), but I
> do not
> > very well understand what I have to find the sources (_u32* ?).
> 
> it depends, you need to make sure all the memory accesses happen on
> natural boundaries...  (e.g. int on 4 byte boundaries, short on 2 byte
> boundaries, etc). From the ip reported by the unaligned message you
> should be able to trace back to the asm insn and function (if your
> objects are not stripped) that is causing the unaligned access.

Humm... in evms (not yet investigate jfs) I notice that 4-byte variables are
pass to function parameters actualy 2-byte without casting. Could this be a reason?

> 
> randolph
> -- 
>    @..@                                         http://www.TauSq.org/
>   (----)
>  ( >__< )
>  ^^ ~~ ^^
> 
> 

Thanks for explanation,
    Joel

-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
