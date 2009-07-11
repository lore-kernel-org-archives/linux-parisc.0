From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Wierd code in Entry.S
Date: Fri, 10 Jul 2009 20:30:51 -0400 (EDT)
Message-ID: <20090711003052.AF4554F19@hiauly1.hia.nrc.ca>
References: <20090711001227.A62D64FE0@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: James.Bottomley@HansenPartnership.com, grundler@parisc-linux.org,
	artem.alimarine@stromasys.com, linux-parisc@vger.kernel.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090711001227.A62D64FE0@hiauly1.hia.nrc.ca> from "John David Anglin" at Jul 10, 2009 08:12:26 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> The macro names really should be changed.  Looking at the code, I didn't
> realize that depi was a macro...

It looks to me like these macros can be deleted.  For example, the PA 1.x
depi mneumonic is equivalent to the PA 2.0 depwi mneumonic.  See Table
J-2 in PA 2.0 arch.  There's no need for the 64-bit versions.  The PA 1.x
mneumonics are still valid in PA 2.0 assembler.  However, I would suggest
that the PA 2.0 mneumonics be used in PA 2.0 specific code.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
