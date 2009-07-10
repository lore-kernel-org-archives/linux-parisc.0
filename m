From: Artem Alimarine <artem.alimarine@stromasys.com>
Subject: Re: Wierd code in Entry.S
Date: Fri, 10 Jul 2009 18:11:35 +0200
Message-ID: <4A576837.70501@stromasys.com>
References: <20090709225511.GE10979@lackof.org> <20090710001506.A2C43507E@hiauly1.hia.nrc.ca> <20090710153620.GB28778@lackof.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020400020105080003020104"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090710153620.GB28778@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------020400020105080003020104
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Grant,

Bit 44 falls into the access_id area. So, access id get corrupted. As 
far as I understand we should get interrupt 18 (access check trap) on 
such TLB  entries. However we do not. The bug can go unnoticed when the 
access id is smaller than 31 bits. The PA2.0 manual says in the IDTLBT 
description: If smaller than 31-bit access IDs are implemented, only the 
appropriate number of the
rightmost bits of GR[r]{32..62} are stored in the TLB. Obviously, bit 44 
is not among the stored bits.

Actually, I have no idea on how many bits are used by the hardware. 
Myself I have rp2470.

Best regards,
Artem

> But I'm still wondering what the effect of this bug will be.
> The first order (not setting U-bit) should only affect ZX1 (pa8800/pa8900)
> machines. Those have uncacheable IO space between 2GB-4GB physical address.
> My guess is the machines should HPMC since the CPU would attempt to access
> those ranges as a cacheline read/write instead of sub-cacheline transactions.
>
> It's not clear from the arch manual what happens if bit 44 is set in R2.
> I didn't look far enough to see where the auth ID gets corrupted.
>
>   

--------------020400020105080003020104
Content-Type: text/x-vcard; charset=utf-8;
 name="artem_alimarine.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="artem_alimarine.vcf"

begin:vcard
fn:dr. Artem Alimarine
n:Alimarine;Artem
org:STROMASYS SA
adr:;;De Zaale 11;Eindhoven;;5612AJ;The Netherlands
email;internet:artem.alimarine@stromasys.com
title:Software Architect
tel;work:+31-40-2390863
tel;fax:+31-40-2390800
x-mozilla-html:FALSE
version:2.1
end:vcard


--------------020400020105080003020104--
