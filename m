From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Runing small structs from functions.
Date: Thu, 10 Mar 2005 13:38:42 -0500 (EST)
Message-ID: <200503101838.j2AIcgqI018769@hiauly1.hia.nrc.ca>
References: <20050310170312.GM22872@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050310170312.GM22872@baldric.uwo.ca> from "Carlos O'Donell" at
	Mar 10, 2005 12:03:12 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Currently the changes in the LA code for glibc mean that _dl_fixup
> returns a small struct (function descriptor) to the trampoline.
> 
> Is it safe to assume that the small struct is always returned on ret0
> and ret1? I ran some test programs and that seemed to be the case.

This "should" work with 3.3 and later.  In previous versions, the
justification was wrong and possibly 5-8 byte structs were not
returned in ret0/ret1.  There is an incorrect code PR for a struct
with three shorts.  I believe this problem is fixed in GCC 4.0 and
later.  It would be safer if you explicitly pad the structs to 4
or 8 bytes.  I can't remember if old versions of GCC return 5-8
byte structs in ret0/ret1.  There was definitely a justification
problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
