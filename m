From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] interesting linker behaviour :)
Date: Tue, 21 Sep 2004 16:20:26 -0400 (EDT)
Message-ID: <200409212020.i8LKKQtS010621@hiauly1.hia.nrc.ca>
References: <20040921194939.GT22642@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040921194939.GT22642@tausq.org> from "Randolph Chung" at Sep
	21, 2004 03:49:39 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> for now i'm using the solution we are using for 64-bit code, which is to
> use a manually created long-branch stub (ldil/ldo/bv). since this is 
> anyway in a slow-path the performance hit is probably negligible.

As I suggested before, you can shorten (ldil/ldo/bv) to (ldil/be) if
if you know which space register to use in the be (in user space, %sr4
will always work since the address space is flat).

The linker doesn't insert stubs for the (ldil/be) sequence although
possibly it should.

The code sequence to handle 32-bit pc-relative offsets is going to
be longer than either of the above two sequences.  So, possibly you
would only want to go this route if the table is large.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
