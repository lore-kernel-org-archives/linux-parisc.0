From: Artem Alimarine <artem.alimarine@stromasys.com>
Subject: unaligned accesses in apply_relocate_add
Date: Wed, 26 Aug 2009 10:37:13 +0200
Message-ID: <4A94F439.6010301@stromasys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060700050807020205030606"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------060700050807020205030606
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi guys,

I see unaligned access happening in apply_relocate_add. Is this normal 
expected behavior?

Kernel 2.6.26.2, single CPU (Standard Debian 5.0.2). Address 0x4011f968.

Best regards,
Artem

--------------060700050807020205030606
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


--------------060700050807020205030606--
