From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [RFC] Non-executable stack?
Date: Tue, 14 Sep 2004 15:36:01 -0400 (EDT)
Message-ID: <200409141936.i8EJa1Yq021565@hiauly1.hia.nrc.ca>
References: <20040912161009.GQ28659@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040912161009.GQ28659@tausq.org> from "Randolph Chung" at Sep
	12, 2004 12:10:09 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > Can we have a non-executable stack on PA?
> > 
> > Why or why not?
> 
> Do you mean on the architecture? Yes, you can. afaik, hpux has a 
> non-executable stack.

While a non-executable stack can be used on hpux, it's not the default.

GCC currently needs an executable stack for calling nested functions
on both linux and hpux.  See the trampoline macros in pa.h.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
