Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from bbnrel4.net.external.hp.com (bbnrel4.net.external.hp.com [155.208.254.68])
	by dsl2.external.hp.com (Postfix) with ESMTP id C4A784849
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Jun 2002 05:46:13 -0600 (MDT)
Message-ID: <3D05E1C1.DF69D5B@admin.france.hp.com>
Date: Tue, 11 Jun 2002 13:40:49 +0200
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: Randolph Chung <randolph@tausq.org>,
	"parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Pb with ioctl and 64bits
References: <3D04BD42.446D930@admin.france.hp.com> <20020610152428.GB5876@tausq.org> <3D059013.9272EEEA@admin.france.hp.com>
Content-Type: multipart/mixed;
 boundary="------------91307E954301418D93628C0F"
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
--------------91307E954301418D93628C0F
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

	Haaaaa, I've succeded at the end. Now ioctls are working fine.
Sorry, I beg your pardon, the probleme was coming from the manner I
declare my ioctls cmds. With 64bits kernel it is:
#define DIOSDUMPDEV32             _IOW('p',0xa0,unsigned int) 
And in user space it is (32 bits):
#define DIOSDUMPDEV32             _IOW('p',0xa0,unsigned long)

	Thanks.

-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
--------------91307E954301418D93628C0F
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
--------------91307E954301418D93628C0F--
