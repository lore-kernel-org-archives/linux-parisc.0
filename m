From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <T-Bone@parisc-linux.org>
Subject: Re: HPMC in lba_pat_out8 on rp3440
Date: Wed, 17 Nov 2010 18:45:49 +0100
Message-ID: <1164312D-EA46-44D3-8BCD-AA5C9D43A19D@parisc-linux.org>
References: <20101117054210.GD27930@lackof.org> <20101117143809.1F8A14DA1@hiauly1.hia.nrc.ca> <20101117153303.GG22651@bombadil.infradead.org>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed	delsp=yes
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Grant Grundler <grundler@parisc-linux.org>,
	dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101117153303.GG22651@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Le 17 nov. 10 =E0 16:33, Kyle McMartin a =E9crit :
> On Wed, Nov 17, 2010 at 09:38:08AM -0500, John David Anglin wrote:
>> I also agree that the kernel shouldn't fix unaligned accesses =20
>> occuring
>> in the kernel.  It allows for sloppy coding and the fixup can be a
>> major performance hit on strict alignment machines like sparc and =20
>> hppa.
>>
>> It would appear handle_unaligned can't always fixup kernel accesses.
>> At least, emulate_ldd causes a hpmc attempting to fixup the ldd in
>> init_page_buffers.  This may be because this is a wrong code error
>> and the address is in someway invalid.  Maybe more address checking
>> is needed.
>>
>
> I'll take a look at emulate_ldd. It's entirely possible that it's =20
> broken
> and we just haven't noticed because we would so rarely hit one in
> userspace. (The only PA2.0 code I know of was the code Thibaut wrote =
=20
> to
> do ffmpeg in pa2.0 asm. I imagine something like that wouldn't take
> unaligned traps if performance was desired... ;-)

Don't imagine too much when it comes to me, you'll always be =20
surprised ;-)
Since my initial code (which stayed at this stage, for lack of any =20
field use) was only trying to get the asm right in the first place =20
(you can see the code here, btw: http://www.parisc-linux.org/~varenet/d=
sputils_parisc.c.html=20
  ) I didn't bother doing unaligned accesses handling when I first =20
tried it, so it's actually very likely I did hit emulate_ldd quite a =20
lot. Fun fact, despite lots of unaligned accesses, that code performed =
=20
on par (and even slightly faster, IIRC) with the C implementation :^)

HTH

T-Bone

--=20
Thibaut VAR=C8NE
http://www.parisc-linux.org/~varenet/

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
