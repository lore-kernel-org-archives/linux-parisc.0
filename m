Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1B1684829
	for <parisc-linux@parisc-linux.org>; Fri, 27 Dec 2002 19:49:26 -0700 (MST)
Message-Id: <200212280249.gBS2nIPI002930@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] misaligned data
To: grundler@dsl2.external.hp.com (Grant Grundler)
Date: Fri, 27 Dec 2002 21:49:18 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20021228020104.C109D4829@dsl2.external.hp.com> from "Grant Grundler" at Dec 27, 2002 07:01:04 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

>         ldd 52(%r3),%r19		# line 2347 is misaligned.

> 	std %r25,52(%r3)		# also misaligned
> 
> Based on the math, looks like %r25 has the "seconds" field and %r19
> the microseconds.
> 
> Oh, only one definition and usage of tv_add().
> The offending field is "&cookie->c.expiration".
> cookie is type "sctp_signed_cookie_t". (include/net/sctp/structs.h)
> 
> /* The format of our cookie that we send to our peer. */
> typedef struct sctp_signed_cookie {
>         __u8 signature[SCTP_SECRET_SIZE];
> 	sctp_cookie_t c;
> } sctp_signed_cookie_t;
> 
> struct sctp_cookie mostly uses __u32 except for "struct timeval expiration".
> "struct timeval" is declared in include/linux/time.h.
> Not sure if it's safe to just pad "struct sctp_cookie" or if something
> else needs to be done.

I'd wonder more about the packed attribute on sctp_init_chunk_t and
sctp_inithdr_t.  What version of gcc?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
