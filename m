From: Artem Alimarine <artem.alimarine@stromasys.com>
Subject: Wierd code in Entry.S
Date: Thu, 09 Jul 2009 15:11:19 +0200
Message-ID: <4A55EC77.4040402@stromasys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------010104060302060209050802"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------010104060302060209050802
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi guys,

I am new to PARISC and to this forum. I have a small question. There is 
an instruction in entry.S that I do not understand. It is in the the 
macro make_insert_tlb

Kernel 2.6.26.2:

 537        /* Enforce uncacheable pages.
 538         * This should ONLY be use for MMIO on PA 2.0 machines.
 539         * Memory/DMA is cache coherent on all PA2.0 machines we 
support
 540         * (that means T-class is NOT supported) and the memory 
controllers
 541         * on most of those machines only handles cache transactions.
 542         */
 543        extrd,u,*=      \pte,_PAGE_NO_CACHE_BIT+32,1,%r0
 544        depi            1,12,1,\prot


The DEPI instruction on a 64-bit machine sets bit 44=32+12,
whereas we use the value as the argument to IDTLBT, which expects bit 12 
to be used instead. Does it mean that the U-bit is never set and the 
authorization id gets corrupted???

Is it a bug or my misunderstanding of the code???

Best regards,
Artem

--------------010104060302060209050802
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


--------------010104060302060209050802--
