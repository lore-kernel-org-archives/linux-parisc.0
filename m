From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Should I read SHR[DW] as SHRP[DW] in parisc2.p
Date: Fri, 13 Aug 2004 20:27:12 -0400 (EDT)
Message-ID: <200408140027.i7E0RCRO001690@hiauly1.hia.nrc.ca>
References: <200408131754.29746.mszick@goquest.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 parisc-linux@parisc-linux.org
To: mszick@goquest.com (Michael S. Zick)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200408131754.29746.mszick@goquest.com> from "Michael S. Zick" at
	Aug 13, 2004 06:54:29 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

>   80:   d2 80 09 f4     shrpw r0,r20,16,r20
>   84:   d2 80 39 f0     extrw,u,= r20,15,16,r0
> 
> Then checking chapter 7 on 'shrpw' it very clearly
> states that this instruction effects only the right
> half of the registers. (no mention of left half)

It actually says for 'shrpw' that the leftmost 32 bits of the target
register (r20) are undefined.  If you had used a different target
register, r20 would not have been affected.

The condition in the 'extrw', "=", checks that all bits in the "word"
are zero.  The leftmost 32 bits in r20 are again undefined as a
result of the 'extrw' instruction.  However, they don't matter as the
target of the extrw is r0 (result discarded) and the condition test
only checks the rightmost 32 bits (word).

You need to be aware that a word is 32 bits and a double word 64 bits
in HP lingo.

The documentation is a bit vague when it comes to condition tests
when a result is discarded, but I believe that the test is done
before the result is discarded.  It doesn't make any sense to test
r0 which always reads as zero.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
