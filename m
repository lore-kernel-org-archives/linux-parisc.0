Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7ACC34829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Oct 2002 09:17:49 -0600 (MDT)
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 465712CAF
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Oct 2002 17:17:42 +0200 (METDST)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2]) by hpfrcu03.france.hp.com with ESMTP (8.7.6/8.7.3 SMKit7.02) id RAA15605 for <parisc-linux@lists.parisc-linux.org>; Thu, 3 Oct 2002 17:16:01 +0200 (METDST)
Message-ID: <3D9C5DEB.558EEAAD@admin.france.hp.com>
Date: Thu, 03 Oct 2002 17:10:35 +0200
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: multipart/mixed;
 boundary="------------9ABFDA84792DF67574837485"
Subject: [parisc-linux] IODC: I'm a bit fed up :-(
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
--------------9ABFDA84792DF67574837485
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

	Hi
I'm loosing my nerves with iodc.....
I've found some interresting thing. For example, it is possible to obtain the HPA
of a modules directly by using a pdc call on PAT system. This one works fine:

struct device_path *dp
/* dp contain all needed informations */
memcpy(&mod,dp,sizeof(struct hardware_path));
pdc_status = mem_pdc_call( PDC_PAT_IO, PDC_PAT_IO_GET_PCI_CONFIG_FROM_HW, __pa(pdc_result), mod.num);

I've also succeded to retrive the ENTRY_INIT code. And I've double check that
this is truly an IODC code:
ret = mem_pdc_call(PDC_IODC, PDC_IODC_READ, __pa(pdc_result), hpa , 
       PDC_IODC_INDEX_DATA, __pa(iodc_module_info), iodc_data_size);
and then
ret = mem_pdc_call (PDC_IODC, PDC_IODC_READ, __pa(pdc_result), hpa,
       ENTRY_INIT, __pa(iodc_buffer_ptr), IODC_MAX, 0L, 0L, 0L, 0L, 0L);

-> I obtain the ENTRY_INIT iodc code in the ptr iodc_buffer_ptr.
this one has been reserved like this:
static unsigned long iodc_disk_buffer[IODC_MAX] __attribute__ ((aligned (8)));

Now I've really a problem. Each time I try to use this ENTRY_INIT code by using this call:
ret = real64_call(__pa(iodc_buffer_ptr),iodc_hpa, ENTRY_INIT_DEV,
                iodc_spa, __pa(dump_iodc_layer),__pa(pdc_result)); 

(I've also tried with real32_call, but it is exactly the same pb.)

it fail with HPMC !!!! I've analysed the HPMC and it has a problem while doing:
LDO             -64(r30),r29
LDO             20(r3),r2
LDB,O           0(r2),r17 -> HPMC

 
r29=ffffffffffffffff
r3=fffffffff8020000
r2=fffffffff8020014

(good news r3 is the base addr of my scsi card, sound good).
it is at offset iodc_buffer_ptr+0x1e3c
So it is inside the iodc code. It seems that it works on my
scsi card. But I don't have access to the firmware code. So if you have any idea, 
clue, anything, help !!!! I really think, that if I solve this pb, the dump will 
be shortly available.....

	Thanks.

-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
--------------9ABFDA84792DF67574837485
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
--------------9ABFDA84792DF67574837485--
