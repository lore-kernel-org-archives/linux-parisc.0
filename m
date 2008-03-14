From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Yet another ccio fix idea?
Date: Fri, 14 Mar 2008 11:35:10 -0400 (EDT)
Message-ID: <20080314153512.0AEAC4E6A@hiauly1.hia.nrc.ca>
References: <JXPOYU$E007A732ACC03B562E930344C50EC8E3@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: James.Bottomley@HansenPartnership.com, soete.joel@scarlet.be,
	grundler@parisc-linux.org, linux-parisc@vger.kernel.org,
	kyle@parisc-linux.org, matthew@wil.cx, rubisher@scarlet.be
To: rubisher@scarlet.be (rubisher)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <JXPOYU$E007A732ACC03B562E930344C50EC8E3@scarlet.be> from "rubisher" at Mar 14, 2008 09:30:30 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > The depw will operate on the left word.  Looks like it should be
> > 
> >         asm volatile("depw  %1,31,12,%R0" : "+r" (pa) : "r" (hints));

Sorry, the `R' to access the right half of pa is needed when generating
32-bit code.  The original form might be ok when generating 64-bit
code but I'd have to check the arch.  With 64-bit code, you might need
to use depd.  The other approach might be to change pa to u32.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
