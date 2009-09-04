From: Artem Alimarine <artem.alimarine@stromasys.com>
Subject: Re: unaligned accesses in apply_relocate_add
Date: Sat, 05 Sep 2009 00:37:07 +0200
Message-ID: <4AA19693.4040500@stromasys.com>
References: <4A94F439.6010301@stromasys.com> <20090826131749.GE19494@bombadil.infradead.org> <4A954990.7070007@stromasys.com> <20090828184201.GA14548@lackof.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020602070900010603040000"
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090828184201.GA14548@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------020602070900010603040000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


> You might also look at Aries PA-RISC emulator (on ia64):
>     http://www.princeton.edu/~rblee/ELE572Papers/PARISCtoIA64.htm
>   
Thanks for the reference. There is also a HPPA version of QEMU. Unlike 
them we emulate the whole system hardware. At this moment it is an 
rp24xx system including the ASTRO/ELROY stuff and the NCR SCSI 
controller. We will also add a DE500 ethernet. This means that you can 
install Linux from an ISO image in the emulator like you normally 
install your system from a CD. The goal is to run MPE eventually. Our 
emulator runs on PC x64 in Windows (shame on me).

--------------020602070900010603040000
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


--------------020602070900010603040000--
