From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] head.S: a small typo
Date: Thu, 28 Apr 2005 13:52:11 -0400 (EDT)
Message-ID: <200504281752.j3SHqBeE005408@hiauly1.hia.nrc.ca>
References: <42711789.8040408@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42711789.8040408@tiscali.be> from "Joel Soete" at Apr 28,
	2005 05:04:09 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> mmm is there importance in the order of:
> 	.align 128
> 	.text
> rfi_virt2real:

Yes, put the .align after the .text.  You want to align the following
text.

> But I mainly come back here with the fact that 64bit kernel works fine while
> its 32 bit twin panicing on same hw (b2k e.g.):
> (to test ggg patch I run again my stress loop during about 20h on b2k with
> the 64bit kernel without any pb ;-)
> 
> as far as I remember cffc() is only 32bit stuff so this patch would make

Yes.  You don't need it in 64-bit code.  Regarding cffc, GCC 4.0
has a fix as to when canonicalization is done.  In 4.0 and later,
canonicalization is only done when both sides of are function
pointers.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
