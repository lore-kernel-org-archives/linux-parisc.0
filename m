From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: atlas3 on hppa: unexpected reloc type
Date: Sun, 13 Jun 2004 22:32:04 -0400 (EDT)
Message-ID: <200406140232.i5E2W5Bg003075@hiauly1.hia.nrc.ca>
References: <20040613223358.GJ19250@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: rwhaley@cs.utk.edu,
 parisc-linux@lists.parisc-linux.org
To: tausq@debian.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040613223358.GJ19250@tausq.org> from "Randolph Chung" at Jun
	13, 2004 03:33:58 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > Thanks for the pointers.  From the document, I was able to add prefetch support
> > for PA-RISC 2.0 to ATLAS's header file. 
> 
> Cool! Be aware that, if atlas relies on being able to prefetch invalid
> addresses and have that not fault, then it will only work on some PA 
> processors (mostly pa20) and not all of them.

Are you sure this doesn't apply to all pa20 processors?  See page 6-11
in PA-RISC 2.0 Architecture book.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
