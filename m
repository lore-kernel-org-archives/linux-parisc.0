From: Richard Henderson <rth@redhat.com>
Subject: Re: [parisc-linux] gcc-3.[02] alignment problem
Date: Tue, 16 Jul 2002 13:21:08 -0700
Message-ID: <20020716132108.B5966__28000.226050108$1416621533$gmane$org@redhat.com>
References: <200207161701.g6GH1D03023385@hiauly1.hia.nrc.ca> <20020716172255.GM8724@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@parisc-linux.org, gcc@gcc.gnu.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20020716172255.GM8724@tausq.org>; from randolph@tausq.org on Tue, Jul 16, 2002 at 10:22:55AM -0700
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Tue, Jul 16, 2002 at 10:22:55AM -0700, Randolph Chung wrote:
>         __u32   tcpdiag_cookie[2]; 
> #define TCPDIAG_NOCOOKIE (~0U)
> };
> 
> the code goes on to do:
>         *((struct sock **)&r->id.tcpdiag_cookie) = sk;
> and
>             sk != *((struct sock **)&req->id.tcpdiag_cookie[0]))

This is absolutely awful.

> the "vomit grade hack" alan mentioned in another post is that in our
> tree, we have:
> 
> struct tcpdiag_sockid
> {
>         __u16   tcpdiag_sport;
>         __u16   tcpdiag_dport;
>         __u32   tcpdiag_src[4];
>         __u32   tcpdiag_dst[4];
>         __u32   tcpdiag_if;
> #if defined (__hppa__) && defined (__LP64__)
>         char * parisc_hack_to_align_tcpdiag_cookie;
> #endif
>         __u32   tcpdiag_cookie[2];

An only marginally better fix is

	__u32 tcpdiag_cookie[2] __attribute__((aligned(sizeof(void*))));

Note that this should be unconditional so that the other
64-bit ports don't take an alignment trap here too.

A much nicer fix would be to, gasp, use a union.



r~
