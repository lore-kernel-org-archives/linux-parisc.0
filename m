Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8C383484E
	for <parisc-linux@lists.parisc-linux.org>; Sat, 26 Oct 2002 11:05:09 -0600 (MDT)
Message-Id: <200210261705.g9QH54Zx002355@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Branch Prediction
To: grundler@dsl2.external.hp.com (Grant Grundler)
Date: Sat, 26 Oct 2002 13:05:04 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021026051138.248F24834@dsl2.external.hp.com> from "Grant Grundler" at Oct 25, 2002 11:11:38 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> "John David Anglin" wrote:
> > Does anyone know which PA processors if any implement the BTS?
> 
> No clue. I had to read the PA2.0 arch book (page 6-15, "Branch 
> Target Stack) to learn what this is and what it does.

I did a quick hack to gcc yesterday to try it on the a500.  It
didn't seem to make any difference, so I think the PA-8500 doesn't
have a branch target stack.  I wonder if the PA-8700 in the rp2470
has it?  I suppose it also could be an add-on chip.

It's fairly easy to implement and the assembler already supports
the feature.  However, there might be issues with software compiled
without the feature not inter-operating with software compiled
with it.  For call-return acceleration, the safe solution of
pushing the return in the callee results in reduced performance.
You have to do the push in the call.  Maybe I will add this
as an option if there is actually some gear that has the option.

> Anyay, it would be interesting to know if HPUX's acc uses it.
> ie did it's usage ever get validated for both systems that do
> and don't implement BTS?
> 
> > I was also wondering about the ITLB P bit and what parisc-linux does
> > with it.  The came up in regard to accelerating branches for calls
> > and returns.
> 
> It sounds like parisc-linux does nothing with P-bit.
> We could just always enable it if you think that's the right
> thing to do for now. Looks like could be done by adding one more
> insn to itlb_miss_common_20w in entry.S.

I am guessing but I think setting it would help on machines with
dynamic prediction hardware.  There is probably a paper somewhere
on this on the HP site.  I tried to find info on the branch target
stack but didn't have any success.

My understanding is that pc-relative branches can be predicted
from examination of the code.  Indirect branches (e.g., call
returns) can't.  I don't know how the dynamic prediction hardware
works but I would think it wouldn't be there if it didn't
improve branch prediction.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
