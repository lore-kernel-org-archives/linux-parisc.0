From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: vfork test case.
Date: Tue, 22 Jun 2010 14:44:18 -0400 (EDT)
Message-ID: <20100622184419.CCF1C5057@hiauly1.hia.nrc.ca>
References: <AANLkTimN025LJidxvbeHRApq2_0F6N1ir_dZoYBGSl3h@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	kyle@mcmartin.ca, James.Bottomley@hansenpartnership.com
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTimN025LJidxvbeHRApq2_0F6N1ir_dZoYBGSl3h@mail.gmail.com> from "Carlos O'Donell" at Jun 22, 2010 02:34:31 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > I looked at the hpux implementation and it doesn't create a frame.
> > Of course, the vfork syscall then must not clobber the return address,
> > etc.
> 
> Yes, the vfork syscall *must not* clobber r2, without a stack we have
> nowhere to save it. I'm pretty sure the kernel preserves r2 across a
> vfork. The next step is to verify that :-)

Actually, it's ok to save it in the __fork caller's frame at the standard
location.  r2 is always saved there by the callee.  The argument slots for
r26 thru r23 and the PIC register slot also can be used.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
