From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Fixed strace [ was Re: ls -l is broken ]
Date: Sat, 9 May 2009 17:11:22 -0400
Message-ID: <119aab440905091411gbb3b1bu7f6aa37e6fb35802@mail.gmail.com>
References: <20090507165216.GB30675@bombadil.infradead.org>
	 <20090509171823.DDEEA50D8@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Kyle McMartin <kyle@mcmartin.ca>, matthew@wil.cx,
	linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090509171823.DDEEA50D8@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, May 9, 2009 at 1:18 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> 0x402759ac <_dl_relocate_object+772>: =A0 ldh,s r22(r17),r31
> 0x402759b0 <_dl_relocate_object+776>: =A0 ldw 170(r11),ret1
> 0x402759b4 <_dl_relocate_object+780>: =A0 cmpib,=3D 0,ret0,0x40275a64=
 <_dl_relocate_object+956>
> 0x402759b8 <_dl_relocate_object+784>: =A0 copy r11,r5
> End of assembler dump.
> (gdb) p/x $r11

Shouldn't you be using $r17 here?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
