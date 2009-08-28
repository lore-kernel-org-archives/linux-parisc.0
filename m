From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: unaligned accesses in apply_relocate_add
Date: Fri, 28 Aug 2009 14:58:22 -0400 (EDT)
Message-ID: <20090828185823.16D694E4F@hiauly1.hia.nrc.ca>
References: <20090828184201.GA14548@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: artem.alimarine@stromasys.com, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090828184201.GA14548@lackof.org> from "Grant Grundler" at Aug 28, 2009 12:42:01 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Wed, Aug 26, 2009 at 04:41:20PM +0200, Artem Alimarine wrote:
> > One point is that in the function apply_relocate_add a 4-byte aligned  
> > address is created:
> >
> > 627                dot = (Elf64_Addr)loc & ~0x03;
> > 628                loc64 = (Elf64_Xword *)loc;
> >
> > and used as a 64-bit location
> >
> > 711                case R_PARISC_DIR64:
> > 712                        /* 64-bit effective address */
> > 713                        *loc64 = val + addend;
> > 714                        break;
> >
> > So, 8-byte word is read with a 4-byte alignment.
> 
> Perhaps this is expected to be an 8byte address pointing at a 4-byte word?
> (and it's a bug that ist's not)

No, R_PARISC_DIR64 is a 64-bit reloacation.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
