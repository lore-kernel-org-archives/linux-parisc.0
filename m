From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA hang with PCI SERR or PARITY enabling
Date: Fri, 31 Jul 2009 10:46:53 -0400 (EDT)
Message-ID: <20090731144654.F3D374CFD@hiauly1.hia.nrc.ca>
References: <7d01f9f00907310235hb342840j14b7ccc3bcc01184@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: mroos@linux.ee, randolph@tausq.org, linux-parisc@vger.kernel.org
To: varenet@parisc-linux.org (Thibaut VARENE)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7d01f9f00907310235hb342840j14b7ccc3bcc01184@mail.gmail.com> from "Thibaut VARENE" at Jul 31, 2009 11:35:17 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Fri, Jul 31, 2009 at 8:28 AM, Meelis Roos <mroos@linux.ee> wrote:
> >
> > > Please see http://www.parisc-linux.org/faq/kernelbug-howto.html
> >
> > Well, I can not find anything about interpreting SER PIM data there?
> 
> Are you sure? There are basic explanations about the info we need. For instance:
> 
> "- The r02 register is the "return pointer" - it indicates the calling function
> - The IAOQ contents specify the address of the instruction where the
> fault occured."
> 
> Of course they are undecoded, that's why you need to be able to
> objdump the kernel.

I tried to download the kernel package, but it's gone from the debian
servers.  So, you will have to run objdump yourself.  Just do

hppa64-linux-gnu-objdump vmlinux-2.6.29-2-parisc64-smp | less

This will allow you to find the instruction where the fault occured.
Comparison of the instructions with the register dump should indicate
the cause of the hpmc.  Also search for the address contained in r02.
That should be the calling function in most cases.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
