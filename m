Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail12.speakeasy.net [216.254.0.212])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8DB6A48A9
	for <parisc-linux@parisc-linux.org>; Tue, 16 Jul 2002 11:19:06 -0600 (MDT)
Date: Tue, 16 Jul 2002 10:22:55 -0700
From: Randolph Chung <randolph@tausq.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org, gcc@gcc.gnu.org
Subject: Re: [parisc-linux] gcc-3.[02] alignment problem
Message-ID: <20020716172255.GM8724@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <200207161701.g6GH1D03023385@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200207161701.g6GH1D03023385@hiauly1.hia.nrc.ca>
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

In reference to a message from John David Anglin, dated Jul 16:
> > These messages are coming from the assembler (remove "-pipe").  The
> > first is from "std %r4,44(%r3)".  The offset "44" is not correct for
> > a store double.  This is probably a problem with pointer arithmetic
> > in the source.
> 
> Check the definition of RTA_ALIGNTO in linux/rtnetlink.h.

ah, this is not it, but i see what it is now.

include/linux/tcp_diag.h defines:

struct tcpdiag_sockid
{
        __u16   tcpdiag_sport;
        __u16   tcpdiag_dport;
        __u32   tcpdiag_src[4];
        __u32   tcpdiag_dst[4];
        __u32   tcpdiag_if;
        __u32   tcpdiag_cookie[2]; 
#define TCPDIAG_NOCOOKIE (~0U)
};

the code goes on to do:
        *((struct sock **)&r->id.tcpdiag_cookie) = sk;
and
            sk != *((struct sock **)&req->id.tcpdiag_cookie[0]))

even tho tcpdiag_cookie looks like it can be 64-bit aligned in the
struct, it appears that it isn't.... 

the "vomit grade hack" alan mentioned in another post is that in our
tree, we have:

struct tcpdiag_sockid
{
        __u16   tcpdiag_sport;
        __u16   tcpdiag_dport;
        __u32   tcpdiag_src[4];
        __u32   tcpdiag_dst[4];
        __u32   tcpdiag_if;
#if defined (__hppa__) && defined (__LP64__)
        char * parisc_hack_to_align_tcpdiag_cookie;
#endif
        __u32   tcpdiag_cookie[2];
#define TCPDIAG_NOCOOKIE (~0U)
};

why is the offset of tcpdiag_cookie[0] 44 and not 40?

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
