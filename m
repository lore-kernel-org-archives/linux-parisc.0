Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep16-int.chello.at (viefep16-int.chello.at [213.46.255.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2342B4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Sep 2002 01:39:11 -0600 (MDT)
Date: Wed, 18 Sep 2002 09:39:06 +0200
Subject: Re: [parisc-linux] B132L+ crash with mpg123
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v543)
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>,
	Grant Grundler <grundler@dsl2.external.hp.com>,
	Matthew Wilcox <willy@debian.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <20020918010209.GC17211@systemhalted>
Message-Id: <B5FF03DC-CAD9-11D6-A4F6-0030656F07A2@esiee.fr>
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

Le mercredi, 18 sep 2002, =E0 03:02 Europe/Paris, Carlos O'Donell a =
=E9crit=20
:

>>>> Kernel Fault: Code=3D15 regs=3D11ddc640 (Addr=3D00277e00)
>>>>
>>>>       YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
>>>> PSW: 00000000000011000000000000001111 Not tainted
>>>> r00-03  00000000 00000023 101feac4 00000200
>>> ...
>>>> IASQ: 00000000 0000000 IAOQ: 10263c78 10263c70
>>> ...
>>> what symbols do 101feac4 and 10263c78 refer to?
>>
>> 10263c78 is in copy_from_user, 101feac4 is in harmony_audio_write().
>> the only point at which we call copy_from_user is:
>>
>>                 /* Copy the page to an aligned buffer */
>>                 copy_from_user(played_buf.addr +=20
>> (HARMONY_BUF_SIZE*buf_to_fill)
>> 					+ harmony.play_offset,
>> 				buffer+count, frame_size);
>>
>
> Data TLB miss fault / Data page fault.
>
> Looks like it walked a little too far into some address that
> wasn't mapped?
Yeah,
I caught Matthieu Delahaye lately, he told me that it was probably a
failing "modulo" on the calculation of the remaining size of buffer
to be sent to the audio card, or something like that...
>
> c.


Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/=
