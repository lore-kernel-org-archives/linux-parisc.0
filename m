From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: call_init in libc6 2.3.6.ds1-11
Date: Sun, 18 Feb 2007 14:07:31 -0500 (EST)
Message-ID: <200702181907.l1IJ7WFc017264__3937.02198421142$1416624299$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440702181047x5719075ey97f0f76f939dde90@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702181047x5719075ey97f0f76f939dde90@mail.gmail.com>
	from "Carlos O'Donell" at Feb 18, 2007 01:47:25 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On 2/18/07, Carlos O'Donell <carlos@systemhalted.org> wrote:
> > To be truthful I don't understand why we rummage around the relocs in
> > elf_machine_runtime_setup, we have the linkmap for the object we are
> > loading, there should be no need to do this.
> 
> I realized later, that DT_PLTGOT is the LTP, and we have no way to ask
> the linkmap the following questions:
> 
> 1. Where is the end of that objects PLT?
> 2. Where is the start of that objects GOT?
> 
> The only way to answer those questions is to look for the last reloc
> in the PLT and match the stub signature.

Is elf_machine_runtime_setup adjusting DT_PLTGOT?

This search seems horrific.  Shouldn't we add DT values for the
above?  There must be OS specific values that could be used.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
