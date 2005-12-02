From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: Strange compiler behavior
Date: Wed, 30 Nov 2005 21:42:42 -2900 (EST)
Message-ID: <200512010242.jB12ghR9006672__38322.6219950759$1416624569$gmane$org@hiauly1.hia.nrc.ca>
References: <438E52C9.2030007@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@parisc-linux.org,
 debian-hppa@lists.debian.org
To: randolph@tausq.org (Randolph Chung)
Return-Path: <bounce-debian-hppa=deller=gmx.de@lists.debian.org>
In-Reply-To: <438E52C9.2030007@tausq.org> from "Randolph Chung" at Dec 1, 2005 09:32:57 am
Resent-Message-ID: <xsHKOC.A.vQF.DomjDB@murphy>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

> John David Anglin wrote:
> >> The limited stack trace is:
> >>
> >> Program received signal SIGSEGV, Segmentation fault.
> >> 0x000255fc in pop_everything ()
> >> (gdb) bt
> >> #0  0x000255fc in pop_everything ()
> >> #1  0x0002f834 in cxx_insert_default_attributes ()
> >> #2  0x00072688 in cxx_make_type ()
> >> #3  0x000b7870 in c_common_parse_file ()
> >> #4  0x0022bb8c in rtx_addr_varies_p ()
> >> #5  0x00231224 in rtx_addr_varies_p ()
> >> #6  0x002312e8 in rtx_addr_varies_p ()
> >> #7  0x401ee6e4 in __libc_start_main () from /lib/libc.so.6
> >> #8  0x00016a58 in ?? ()
> > 
> > This stack trace looks wierd at the higher numbers.
> 
> This is because the binary is stripped so the symbol info for static
> functions are lost. All those rtx_address_varies_p() references are
> probably pointing to static functions.

Still seems strange to me.  Are you sure that the start of the unwind
region for each frame matches the symbol printed?  I guess the symbols
are from .dynsym.  Isn't main in .dynsym?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)


-- 
To UNSUBSCRIBE, email to debian-hppa-REQUEST@lists.debian.org
with a subject of "unsubscribe". Trouble? Contact listmaster@lists.debian.org
