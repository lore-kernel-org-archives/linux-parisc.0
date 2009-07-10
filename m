From: Artem Alimarine <artem.alimarine@stromasys.com>
Subject: Re: Wierd code in Entry.S
Date: Fri, 10 Jul 2009 18:25:22 +0200
Message-ID: <4A576B72.6030302@stromasys.com>
References: <20090710001506.A2C43507E@hiauly1.hia.nrc.ca> <1247241171.3936.18.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------070700030005030602040806"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1247241171.3936.18.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------070700030005030602040806
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
> Yes, looks like we've got a set of cockups in this file.  Apparently gas
> is evaluating depi as the macro DEPI, which seems to be correct for
> every other case in the file I've looked at except this one
What I saw is that in the end DEPDI opcode with bit 44 is generated for 
than instruction.

The macro make_insert_tlb is used with PA2.0 and thus with IDTLBT and 
make_insert_tlb_11 with PA1.1 and thus with IDTLBP. It would probably be 
enough to change DEPI into DEPDI in the 2.0 variant. I do not know 
whether there are more similar cases.

Best regards,
Artem

--------------070700030005030602040806
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


--------------070700030005030602040806--
