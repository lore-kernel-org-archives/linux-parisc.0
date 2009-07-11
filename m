From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Wierd code in Entry.S
Date: Fri, 10 Jul 2009 20:12:26 -0400 (EDT)
Message-ID: <20090711001227.A62D64FE0@hiauly1.hia.nrc.ca>
References: <1247241171.3936.18.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: grundler@parisc-linux.org, artem.alimarine@stromasys.com,
	linux-parisc@vger.kernel.org
To: James.Bottomley@HansenPartnership.com (James Bottomley)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1247241171.3936.18.camel@mulgrave.site> from "James Bottomley" at Jul 10, 2009 03:52:51 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Yes, looks like we've got a set of cockups in this file.  Apparently gas
> is evaluating depi as the macro DEPI, which seems to be correct for
> every other case in the file I've looked at except this one.

Yikes!  Macro and instruction mneumonics are case independent.  The
same issue applies to the EXTR and DEP macros.  It appears these macros
were intended to provide consistent PA 1.x and PA 2.0 mneumonics.
However, depwi isn't technically a valid PA 1.x instruction although
gas may not care.  This could present a problem for PA 1.x builds if
gas treats .level strictly.

The macro names really should be changed.  Looking at the code, I didn't
realize that depi was a macro...

> I suppose the whole file needs fixing ... preferably with a macro whose
> name isn't an instruction mnemonic.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
