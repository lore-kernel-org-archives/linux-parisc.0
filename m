Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Branch Prediction 
In-Reply-To: Message from "John David Anglin" <dave@hiauly1.hia.nrc.ca>
   of "Fri, 25 Oct 2002 13:17:32 EDT." <200210251717.g9PHHX2f029861@hiauly1.hia.nrc.ca>
References: <200210251717.g9PHHX2f029861@hiauly1.hia.nrc.ca> 
Date: Fri, 25 Oct 2002 23:11:38 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021026051138.248F24834@dsl2.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

"John David Anglin" wrote:
> Does anyone know which PA processors if any implement the BTS?

No clue. I had to read the PA2.0 arch book (page 6-15, "Branch 
Target Stack) to learn what this is and what it does.

Anyay, it would be interesting to know if HPUX's acc uses it.
ie did it's usage ever get validated for both systems that do
and don't implement BTS?

> I was also wondering about the ITLB P bit and what parisc-linux does
> with it.  The came up in regard to accelerating branches for calls
> and returns.

It sounds like parisc-linux does nothing with P-bit.
We could just always enable it if you think that's the right
thing to do for now. Looks like could be done by adding one more
insn to itlb_miss_common_20w in entry.S.


But to answer both questions, remind me to dig this up if
no answer gets posted by next Wednesday or so.

grant
