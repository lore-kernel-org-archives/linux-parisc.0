From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc (3.3.5) causing problems in our latest kernel.
Date: Sun, 3 Apr 2005 19:43:52 -0400 (EDT)
Message-ID: <200504032343.j33NhqX2019108@hiauly1.hia.nrc.ca>
References: <1112564457.5858.7.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: James.Bottomley@SteelEye.com (James Bottomley)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1112564457.5858.7.camel@mulgrave> from "James Bottomley" at Apr
	3, 2005 04:40:57 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> The problem is that the macros depend on clever optimisation using
> sizeof(*ptr) as an argument to an inline function.  The following
> program illustrates the issue:
> 
> extern void bad_function(void);
> 
> static inline void __test_width(char *var, int size) {
> 	switch (size) {	
> 	case 1:
> 	case 2:
> 	case 4:
> 	case 8:
> 		*var++ = 0;
> 		break;
> 	default:
> 		bad_function();
> 	}
> }

I think the optimization of switch statements is far from optimal.
I suspect that the optimization of if statements is better.  A similar
issue causes warning from __put_user in a 32-bit build.  Probably,
this should be a GCC PR.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
