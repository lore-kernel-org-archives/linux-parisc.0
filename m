Return-Path: <dave@hiauly1.hia.nrc.ca>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id D35184854
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 17 Dec 2003 17:32:10 -0700 (MST)
Message-Id: <200312180032.hBI0W7lH024663@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: dlopen failed on 'libthread_db.so.1' -
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Wed, 17 Dec 2003 19:32:07 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
In-Reply-To: <no.id> from "John David Anglin" at Dec 17, 2003 07:21:17 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> dave@gsyprf11:~/gdb-6.0-2/objdir/gdb$ nm gdb|grep ps_pglobal_lookup
> 000dc904 T ps_pglobal_lookup
> 
> Looks as if there is a problem with dlopen.

No, the problem is ps_pglobal_lookup isn't in gdb's dynamic symbol
table.  I'll have to figure out how this is done.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
