From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gcj can't make shared libs on hppa
Date: Tue, 21 Feb 2006 19:05:50 -0500 (EST)
Message-ID: <200602220005.k1M05o1D006305__49500.3635100604$1416624584$gmane$org@hiauly1.hia.nrc.ca>
References: <200602212135.k1LLZiUn005694@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@parisc-linux.org,
 debian-hppa@lists.debian.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200602212135.k1LLZiUn005694@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Feb 21, 2006 04:35:43 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Right, it's a linker bug.  The following plabel is dropped from the
> shared library.
> 
> 0000000c R_PARISC_PLABEL32  .L_ZN2A1C1Ev0

I was too hasty in calling this a linker bug.  We end up with the
following relocations in the shared library as a result of the above
relocation in the object file:

00010f34 R_PARISC_PLABEL32  *ABS*+0x00010f46
00010f44 R_PARISC_IPLT     *ABS*+0x000009a8

The reason for the segmentation fault is the R_PARISC_IPLT isn't
being handled correctly and the indirect call to the constructor
for the library branches to the wrong location.

Carlos, do you have an opinion on how plabels that reference local
symbols in shared libraries should be handled?  This is what we have
in the A1.s file for .L_ZN2A1C1Ev0:

        .word   P%.L_ZN2A1C1Ev0
        .set    .L_ZN2A1C1Ev0,_ZN2A1C1Ev

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
