From: "rubisher" <rubisher@scarlet.be>
Subject: Re: Yet another ccio fix idea?
Date: Fri, 14 Mar 2008 15:18:15 +0100
Message-ID: <JXQ52F$73841D7DFC78D351843BDFFF09DD7CE8@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "dave" <dave@hiauly1.hia.nrc.ca>,
	"James\.Bottomley" <James.Bottomley@HansenPartnership.com>,
	"soete\.joel" <soete.joel@scarlet.be>,
	"grundler" <grundler@parisc-linux.org>,
	"linux-parisc" <linux-parisc@vger.kernel.org>,
	"kyle" <kyle@parisc-linux.org>, "matthew" <matthew@wil.cx>,
	"rubisher" <rubisher@scarlet.be>
To: "dave" <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > > In this situation, the alignment of pdir's depends on how they
> > > were originally declared.  If declared as long long, GCC will give
> > > them 8 byte alignment, so the two words should always be in the
> > > same cache line.  On the otherhand, if the pdir is declared as
> > > a pair of 32-bit words, the pdir might span two cache lines.
> > 
> > It looks to me like pdirs should be 8 byte aligned and thus always
> > should lie in a cache line.
> > 
> > The following insn appears to put hints in the wrong place on
> > a 64-bit kernel since `pa' is then a 64-bit type:
> > 
> >         asm volatile("depw  %1,31,12,%0" : "+r" (pa) : "r" (hints));
> > 
> > The depw will operate on the left word.  Looks like it should be
> > 
> >         asm volatile("depw  %1,31,12,%R0" : "+r" (pa) : "r" (hints));
> > 
> As far as I never reach to boot a 64bit kernel on this box, I would like to
> test but am I facing to a gcc bug or did I again miss something:
> {standard input}: Assembler messages:
> {standard input}:97: Error: Field out of range [0..31] (68).
> {standard input}:97: Error: Invalid operands
> {standard input}:1199: Error: Field out of range [0..31] (68).
> {standard input}:1199: Error: Invalid operands
> make[3]: *** [drivers/parisc/ccio-dma.o] Error 1
> 
oops I need to better check why does it want to use fr:
     96 #APP
     97         depw  %r23,31,12,%fr4
     98 #NO_APP

   1198 #APP
   1199         depw  %r5,31,12,%fr4
   1200 #NO_APP

I will try to understand that next week.

r.
> (The original compile fine???)
> 
> > when __LP64__ is defined.  Think the same is true for the following
> > depw as well.
> > 
> Ok I will check in deep.
> 
> Tx,
>     r.
> > Dave
> > -- 
> > J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
> > National Research Council of Canada              (613) 990-0752 (FAX:
952-6602)
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > 
> > 
> ---
> Scarlet One, ADSL 6 Mbps + Telephone, from EUR 29,95...
> http://www.scarlet.be/
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
---
Scarlet One, ADSL 6 Mbps + Telephone, from EUR 29,95...
http://www.scarlet.be/

