From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] is this a known hppa64-linux-ld bug?
Date: Sat, 11 Sep 2004 18:37:28 -0400 (EDT)
Message-ID: <200409112237.i8BMbT3Y006469@hiauly1.hia.nrc.ca>
References: <1094910543.1714.5.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: James.Bottomley@SteelEye.com (James Bottomley)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1094910543.1714.5.camel@mulgrave> from "James Bottomley" at Sep
	11, 2004 09:48:56 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > does anybody have a suggestion for a workaround? 
> 
> I'm glad you didn't say "good" work around.  How about just building the
> stub ourselves:
> 
> 3:	ldil	L%2b,%r19
> 	ldo	R%2b(%r19),%r19
> 	bv,n	0(%r19)
> 
> This is certainly more efficient than the linker could ever do since we
> know that even on LP64 the kernel lies under 4GB.

If the branch always uses the same space register, you can shorten the
above sequence to something like:

3:	ldil	L%2b,%r19
	be,n	R%2b(%sr4,%r19)

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
