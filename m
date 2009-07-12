From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Wierd code in Entry.S
Date: Sun, 12 Jul 2009 15:40:34 -0400 (EDT)
Message-ID: <20090712194035.DD080500D@hiauly1.hia.nrc.ca>
References: <20090711010513.38B824FE2@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: James.Bottomley@HansenPartnership.com, grundler@parisc-linux.org,
	artem.alimarine@stromasys.com, linux-parisc@vger.kernel.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090711010513.38B824FE2@hiauly1.hia.nrc.ca> from "John David Anglin" at Jul 10, 2009 09:05:12 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > It looks to me like these macros can be deleted.  For example, the PA 1.x
> > depi mneumonic is equivalent to the PA 2.0 depwi mneumonic.  See Table
> > J-2 in PA 2.0 arch.  There's no need for the 64-bit versions.  The PA 1.x
> > mneumonics are still valid in PA 2.0 assembler.  However, I would suggest
> > that the PA 2.0 mneumonics be used in PA 2.0 specific code.

Sorry, the macros can't be removed.  The PA 1.x mneumonics result in undefined
behavior in the most sign-significant 32 bits.  The should just be renamed.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
