Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7EE2B4869
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Jul 2002 06:09:17 -0600 (MDT)
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id D124F6BD
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Jul 2002 14:09:15 +0200 (METDST)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2]) by hpfrcu03.france.hp.com with ESMTP (8.7.6/8.7.3 SMKit7.02) id OAA13999 for <parisc-linux@lists.parisc-linux.org>; Fri, 5 Jul 2002 14:07:59 +0200 (METDST)
Message-ID: <3D258B21.EC28E2AF@admin.france.hp.com>
Date: Fri, 05 Jul 2002 14:03:45 +0200
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] mem_pdc_call: how using it exactly.
References: <3D257AAB.D04CD0DC@admin.france.hp.com> <20020705124538.Z27706@parcelfarce.linux.theplanet.co.uk>
Content-Type: multipart/mixed;
 boundary="------------143EC1816D4C96D0C148E1A8"
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
--------------143EC1816D4C96D0C148E1A8
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

About the iodc_data_size, in the documentation it is describe as: "count bytes in length".
For example in drivers/scsi/zalon7xx.c:
status = pdc_iodc_read(&pdc_result, hpa, 0, &iodc_data, 32 ); 
-> it is 32.
So If I want the 32 first bytes, it should be 32.
Now why doing it myself, because I don't want to use spinlock while dumping, and pdc_iodc_read
use spinlock. Perhaps, it is not a good solution, what do you think about using spinlock while
dumping ?

Matthew Wilcox wrote:
> 
> On Fri, Jul 05, 2002 at 12:53:31PM +0200, Bruno Vidal wrote:
> > static unsigned long pdc_result[32] __attribute__ ((aligned (8)));
> > static unsigned long pdc_result2[32] __attribute__ ((aligned (8)));
> >
> > /* Get spa for this module */
> > hpa=dump_parms->hpa;
> > index=0;
> > iodc_data_size=32;
> >
> > ret = mem_pdc_call(PDC_IODC, PDC_IODC_READ, __pa(pdc_result), hpa, index, __pa(pdc_result2), iodc_data_size);
> > convert_to_wide(pdc_result);
> > bytecnt = pdc_result[0];
> > memcpy(dump_iodc_data, pdc_result2, iodc_data_size);
> >
> > The result is always "ret = -3" -> cannot complete call without error.
> > Do I forget anything (probably). Do I have to prevent interruption ? Do I have to modify PSW ?
> 
> more prosaically, i think iodc_data_size should be 32 * sizeof(long),
> ie size in bytes, not number of longs.
> 
> but why code this up yourself rather than use pdc_iodc_read?
> 
> --
> Revolutions do not require corporate support.

-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
--------------143EC1816D4C96D0C148E1A8
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
--------------143EC1816D4C96D0C148E1A8--
