Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA21345
	for <parisc-linux@puffin.external.hp.com>; Mon, 8 Jan 2001 01:22:02 -0700
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 184D02257B
	for <parisc-linux@thepuffingroup.com>; Mon,  8 Jan 2001 09:25:20 +0100 (MET)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2]) by hpfrcu03.france.hp.com with ESMTP (8.7.6/8.7.3 SMKit7.02) id JAA26282 for <parisc-linux@thepuffingroup.com>; Mon, 8 Jan 2001 09:25:17 +0100 (MET)
Sender: vidal@hpfrcu03.france.hp.com
Message-ID: <3A597962.77E53530@admin.france.hp.com>
Date: Mon, 08 Jan 2001 09:25:06 +0100
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Content-Type: multipart/mixed;
 boundary="------------BDFE9CE8BCBAFA6818A6E761"
Subject: [parisc-linux] GCC compilation
List-ID: <linux-parisc.vger.kernel.org>

This is a multi-part message in MIME format.
--------------BDFE9CE8BCBAFA6818A6E761
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

	Hi
I've retry to compil the GCC. It worked few weeks ago, but now it fails
when I try to compil the full GCC. This the output of my recompil script
(error output):

/opt/linux_hppa/src/gcc/libstdc++/stl/stl_alloc.h:368: ISO C++ forbids
   declaration of `pthread_mutex_t' with no type
/opt/linux_hppa/src/gcc/libstdc++/stl/stl_alloc.h:368: parse error before ';'
   token
/opt/linux_hppa/src/gcc/libstdc++/stl/stl_alloc.h:580: syntax error before '<'
   token
/opt/linux_hppa/src/gcc/libstdc++/stl/stl_alloc.h:580: `__threads' was not
   declared in this scope
/opt/linux_hppa/src/gcc/libstdc++/stl/stl_alloc.h:580: `__inst' was not
   declared in this scope
/opt/linux_hppa/src/gcc/libstdc++/stl/stl_alloc.h:580: template argument 1 is
   invalid
/opt/linux_hppa/src/gcc/libstdc++/stl/stl_alloc.h:580: template argument 2 is
   invalid
/opt/linux_hppa/src/gcc/libstdc++/stl/stl_alloc.h:581: ISO C++ forbids
   declaration of `_S_node_allocator_lock' with no type
/opt/linux_hppa/src/gcc/libstdc++/stl/stl_alloc.h:581: `PTHREAD_MUTEX_INITIALIZER'
   was not declared in this scope
In file included from /opt/linux_hppa/src/gcc/libstdc++/stdexcepti.cc:15:
/opt/linux_hppa/src/gcc/libstdc++/stdexcept:440:   instantiated from here
/opt/linux_hppa/src/gcc/libstdc++/stl/stl_alloc.h:393: `pthread_mutex_lock'
   undeclared (first use this function)
/opt/linux_hppa/src/gcc/libstdc++/stl/stl_alloc.h:393: (Each undeclared
   identifier is reported only once for each function it appears in.)
In file included from /opt/linux_hppa/src/gcc/libstdc++/stdexcepti.cc:15:
/opt/linux_hppa/src/gcc/libstdc++/stdexcept:440:   instantiated from here
/opt/linux_hppa/src/gcc/libstdc++/stl/stl_alloc.h:394: `pthread_mutex_unlock'
   undeclared (first use this function)
/opt/linux_hppa/src/gcc/libstdc++/stl/stl_alloc.h: In destructor
   `logic_error::~logic_error ()':
/opt/linux_hppa/src/gcc/libstdc++/stl/stl_alloc.h:15: Internal error:
   Segmentation fault.
   Please submit a full bug report.
   See <URL:http://www.gnu.org/software/gcc/bugs.html> for instructions.
make[1]: *** [stdexcepti.o] Error 1
make: *** [all-target-libstdc++] Error 2

Everything compil right, only the full GCC compil fail ? Do you have any idea ?
Must I redownload all bits ?

	Thanks.
  
-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com
--------------BDFE9CE8BCBAFA6818A6E761
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
--------------BDFE9CE8BCBAFA6818A6E761--
