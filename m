From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Debugging 64-bit kernel crashes involving
Date: Sat, 3 Mar 2007 20:05:21 -0500 (EST)
Message-ID: <200703040105.l2415MEE004514__39267.0391047888$1416624320$gmane$org@hiauly1.hia.nrc.ca>
References: <1172620930.3408.46.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: James.Bottomley@SteelEye.com (James Bottomley)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1172620930.3408.46.camel@mulgrave.il.steeleye.com> from "James
	Bottomley" at Feb 27, 2007 06:02:10 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

James,

> Based on the theory, I managed to reproduce the problem on ioz (you just
> have to increase N to be much greater than the number of CPUs you have)
> and tried a little fix, which seems to work for ioz.  Could you try this
> out on your a500?

I tried the change on my c3750.  It's survived four full GCC builds
and checks with no hung process in the libjava testsuite.  While this
might have happened before, the probability of this happening was low.
So, I think this change is a good one ;)

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
