Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id C19EB482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Jun 2002 06:50:08 -0600 (MDT)
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 2B1341F5
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Jun 2002 14:50:07 +0200 (METDST)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2]) by hpfrcu03.france.hp.com with ESMTP (8.7.6/8.7.3 SMKit7.02) id OAA28336 for <parisc-linux@lists.parisc-linux.org>; Thu, 6 Jun 2002 14:49:00 +0200 (METDST)
Message-ID: <3CFF593A.18910E50@admin.france.hp.com>
Date: Thu, 06 Jun 2002 14:44:42 +0200
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: multipart/mixed;
 boundary="------------E8E9A1BEB36A51EBA033AD03"
Subject: [parisc-linux] Probleme while compiling last CVS kernel.
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
--------------E8E9A1BEB36A51EBA033AD03
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

	Hi
I've started this morning to download latest CVS bits.
I've prepared a patche for this version from my dump driver,
and try to recompile everything, but I've found a problem
with LVM !!! See:
make dep: okay
make vmlinux:
ioctl32.c:2009: warning: assignment makes pointer from integer without a cast
ioctl32.c:2030: structure has no member named `inode'
ioctl32.c:2049: warning: passing arg 2 of `lcopy_from_user' makes pointer from integer without a cast
ioctl32.c:2067: structure has no member named `inode'
ioctl32.c:2078: warning: passing arg 2 of `lcopy_from_user' makes pointer from integer without a cast
ioctl32.c:2082: warning: assignment makes integer from pointer without a cast
ioctl32.c:2086: structure has no member named `inode'
ioctl32.c:1985: warning: `v' might be used uninitialized in this function 

-> in this file it is:
	v->pv[i]->pe = NULL; v->pv[i]->inode = NULL;
and
	p.pe = NULL; p.inode = NULL; 

It complains that there is no "inode" in structure pv[i].
So in this line v is a struct vg_t. In this structure
pv[i] is a pv_t structure, I've found this struture in
include/linux/lvm.h, and it is right, there is no "inode", 
in it !!!! Is this LVM code broken ?

typedef struct pv_v2 {
        char id[2];             /* Identifier */
        unsigned short version; /* HM lvm version */
        lvm_disk_data_t pv_on_disk;
        lvm_disk_data_t vg_on_disk;
        lvm_disk_data_t pv_uuidlist_on_disk;
        lvm_disk_data_t lv_on_disk;
        lvm_disk_data_t pe_on_disk;
        char pv_name[NAME_LEN];
        char vg_name[NAME_LEN];
        char system_id[NAME_LEN];       /* for vgexport/vgimport */
        kdev_t pv_dev;
        uint pv_number;
        uint pv_status;
        uint pv_allocatable;
        uint pv_size;           /* HM */
        uint lv_cur;
        uint pe_size;
        uint pe_total;
        uint pe_allocated;
        uint pe_stale;          /* for future use */
        pe_disk_t *pe;          /* HM */
        struct block_device *bd;
        char pv_uuid[UUID_LEN+1];

#ifndef __KERNEL__
        uint32_t pe_start;      /* in sectors */
#endif
} pv_t;
   
-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
--------------E8E9A1BEB36A51EBA033AD03
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
--------------E8E9A1BEB36A51EBA033AD03--
