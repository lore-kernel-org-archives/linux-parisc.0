Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6682A482E
	for <parisc-linux@lists.parisc-linux.org>; Tue,  4 Jun 2002 02:29:43 -0600 (MDT)
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 2BBDD8D5
	for <parisc-linux@lists.parisc-linux.org>; Tue,  4 Jun 2002 10:29:42 +0200 (METDST)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2]) by hpfrcu03.france.hp.com with ESMTP (8.7.6/8.7.3 SMKit7.02) id KAA25986 for <parisc-linux@lists.parisc-linux.org>; Tue, 4 Jun 2002 10:01:50 +0200 (METDST)
Message-ID: <3CFC72F0.E8767180@admin.france.hp.com>
Date: Tue, 04 Jun 2002 09:57:36 +0200
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] How retrieving HPA/SPA with the device node
References: <3CA9BB50.1FCEBDF4@admin.france.hp.com> <20020402164417.6C6B6482A@dsl2.external.hp.com>  <3CFB4D2A.F86BEDC4@admin.france.hp.com> <20020603203819.DB7084831@dsl2.external.hp.com>
Content-Type: multipart/mixed;
 boundary="------------95F2415AED24E8D5D3169D06"
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

This is a multi-part message in MIME format.
--------------95F2415AED24E8D5D3169D06
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

	Hi
Thanks for the answer, it's clear now. The fact is I'm able 
to retrieve the hpa for a PCI device "only". But for the lazy 
example, I can retrieve the base, but not the hpa. So it would 
be really nice if I can write something usable also on 
712/710/etc.... and not only for PCI system. So I think I'll
forget it at this time, and work only for PCI subsystem (I can still
work on a function that test the kind of scsi card, and do the
reverse job to calculate the hpa from the base, but I'm not sure that
it is the best solution).

	Thanks a lot.

Grant Grundler wrote:
> 
> Bruno Vidal wrote:
> > Can someone can explain what is the difference between the
> > "hpa" of a scsi card (pci or not) and the "base" in the structure Scsi_Host ?
> 
> hpa and base are "handles" for different views of HW.
> "hpa" doesn't have to be a physical address (though it normally is).
> On V-class, the hpa is bogus and just a reference to particular IO device.
> base could be "adjusted" (like the LASI example) or "F-extended"
> for 64-bit or whatever the platform code thinks the driver needs
> to reference the device properly.
> 
> But in practice, for the platforms we support to date, I think you
> can compare them (or compare most of the bits) to determine
> if it's the same device.
> 
> grant
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
--------------95F2415AED24E8D5D3169D06
Content-Type: text/x-vcard; charset=iso-8859-1;
 name="bruno_vidal.vcf"
Content-Transfer-Encoding: base64
Content-Description: Card for Bruno Vidal
Content-Disposition: attachment;
 filename="bruno_vidal.vcf"

YmVnaW46dmNhcmQgCm46QnJ1bm87VklEQUwKdGVsO2ZheDowMS02OS04Mi02MC0xNAp0ZWw7
d29yazowMS02OS0yOS00Mi03MQp4LW1vemlsbGEtaHRtbDpUUlVFCnVybDp3d3cuZnJhbmNl
LmhwLmNvbQpvcmc6U29sdXRpb24gQ2VudGVyCnZlcnNpb246Mi4xCmVtYWlsO2ludGVybmV0
OmJydW5vX3ZpZGFsQGhwLmNvbQp0aXRsZTpFeHBlcnQgTG9naWNpZWwgRW52aXJvbm5lbWVu
dCBIYXV0ZSBEaXNwb25pYmlsaXTpCmFkcjtxdW90ZWQtcHJpbnRhYmxlOjs7SFAgRnJhbmNl
PTBEPTBBO1ouQSBkZSBDb3VydGFib2V1ZjsxIEF2LiBkdSBDYW5hZGE7OTE5NDcgTGVzIFVs
aXMgY2VkZXg7RnJhbmNlCngtbW96aWxsYS1jcHQ6OzI2MjA4CmZuOlZJREFMIEJydW5vCmVu
ZDp2Y2FyZAo=
--------------95F2415AED24E8D5D3169D06--
