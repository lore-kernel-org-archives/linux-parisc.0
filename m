From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] SM insn question?
Date: Sat, 9 Apr 2005 10:59:41 -0400 (EDT)
Message-ID: <200504091459.j39Exf78021844@hiauly1.hia.nrc.ca>
References: <20050409054314.GB19922@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050409054314.GB19922@colo.lackof.org> from "Grant Grundler" at
	Apr 8, 2005 11:43:14 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > According to programming notes on p427,
> 
> Joel,
> Which book/document are you referencing the page number for?
> 
> Are you referring to the programming note on page "F-5" of PA2.0
> Arch book (by Jerry Kane)?
> 
> If so, ISTR those contraints are only when clearing Q-bit (bit 3).
> We have such code in entry.S.
> 
> Messing with I-bit (bit 0) should be safe. 

It think the insns also have to be followed by 7 palindromic NOP
insns when the E-bit is changed (endian).

I thought it was clear that the segfaults were occuring because
a null pointer was being deferenced.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
