Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 40E3A48C8
	for <parisc-linux@parisc-linux.org>; Tue, 16 Jul 2002 11:24:10 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17UW3U-0001LT-00; Tue, 16 Jul 2002 18:24:08 +0100
Date: Tue, 16 Jul 2002 18:24:08 +0100
From: Matthew Wilcox <willy@debian.org>
To: Randolph Chung <randolph@tausq.org>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@parisc-linux.org, gcc@gcc.gnu.org
Subject: Re: [parisc-linux] gcc-3.[02] alignment problem
Message-ID: <20020716182408.W27706@parcelfarce.linux.theplanet.co.uk>
References: <200207161701.g6GH1D03023385@hiauly1.hia.nrc.ca> <20020716172255.GM8724@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020716172255.GM8724@tausq.org>; from randolph@tausq.org on Tue, Jul 16, 2002 at 10:22:55AM -0700
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

On Tue, Jul 16, 2002 at 10:22:55AM -0700, Randolph Chung wrote:
> include/linux/tcp_diag.h defines:
> 
> struct tcpdiag_sockid
> {
>         __u16   tcpdiag_sport;
>         __u16   tcpdiag_dport;
>         __u32   tcpdiag_src[4];
>         __u32   tcpdiag_dst[4];
>         __u32   tcpdiag_if;
>         __u32   tcpdiag_cookie[2]; 
> #define TCPDIAG_NOCOOKIE (~0U)
> };

> why is the offset of tcpdiag_cookie[0] 44 and not 40?

0	tcpdiag_sport
2	tcpdiag_dport
4	tcpdiag_src
20	tcpdiag_dst
36	tcpdiag_if
40	tcpdiag_cookie

hmm.. worth checking that dport is at offset 2, not offset 4?

-- 
Revolutions do not require corporate support.
