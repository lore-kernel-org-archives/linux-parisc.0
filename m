From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] kernel module relocation bug
Date: Mon, 29 Nov 2004 19:08:31 -0500 (EST)
Message-ID: <200411300008.iAU08WAe010494@hiauly1.hia.nrc.ca>
References: <20041129235737.GQ6359@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041129235737.GQ6359@tausq.org> from "Randolph Chung" at Nov 29,
	2004 06:57:37 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> btw, Dave, pls correct me if i'm wrong:
> is it correct that the problem only occurs because we are producing a .o
> from multiple .o's? inside a single .o gcc should ensure that all
> branches can reach the beginning and end of that .o using a 17-bit
> relative branches, right?

If you don't use -ffunction-sections, gcc ensure that branches can reach
the beginning of an individual .o.  All bets are off if you use relinking
to combine .o's.

With -ffunction-sections, gcc guarantees that calls can reach the
beginning of a function plus some margin for the stub table.  The linker
inserts stubs on a per function basis.  This should work better with
relinking as the functions remain in their own sections.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
