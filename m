From: Randolph Chung <tausq@debian.org>
Subject: Re: [parisc-linux] gcc-3.[02] alignment problem
Date: Tue, 16 Jul 2002 20:19:57 -0700
Message-ID: <20020717031957.GE641__15330.1609484062$1416621533$gmane$org@tausq.org>
References: <200207161701.g6GH1D03023385@hiauly1.hia.nrc.ca> <20020716172255.GM8724@tausq.org> <20020716182408.W27706@parcelfarce.linux.theplanet.co.uk>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@parisc-linux.org, gcc@gcc.gnu.org
To: Matthew Wilcox <willy@debian.org>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <20020716182408.W27706@parcelfarce.linux.theplanet.co.uk>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> > why is the offset of tcpdiag_cookie[0] 44 and not 40?
> 
> 0	tcpdiag_sport
> 2	tcpdiag_dport
> 4	tcpdiag_src
> 20	tcpdiag_dst
> 36	tcpdiag_if
> 40	tcpdiag_cookie
> 
> hmm.. worth checking that dport is at offset 2, not offset 4?

oic, it's embedded inside another structure:

struct tcpdiagmsg
{
        __u8    tcpdiag_family;
        __u8    tcpdiag_state;
        __u8    tcpdiag_timer;
        __u8    tcpdiag_retrans;

        struct tcpdiag_sockid id;

        __u32   tcpdiag_expires;
        __u32   tcpdiag_rqueue;
        __u32   tcpdiag_wqueue;
        __u32   tcpdiag_uid;
        __u32   tcpdiag_inode;
};

that's why it's 44...

randolph
