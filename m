Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 45E3B487B
	for <parisc-linux@parisc-linux.org>; Mon,  7 Jul 2003 10:33:06 -0600 (MDT)
Date: Mon, 7 Jul 2003 18:33:02 +0200
Message-ID: <3F03A42100000927@ocpmta1.freegates.net>
In-Reply-To: <1057593949.2749.59.camel@dhcp22.swansea.linux.org.uk>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] warning: minor abi change
To: "Alan Cox" <alan@lxorguk.ukuu.org.uk>
Cc: "Matthew Wilcox" <willy@debian.org>,
	"HPPA List" <parisc-linux@parisc-linux.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="========/3F03A42100000927/mail.tiscali.be"
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

--========/3F03A42100000927/mail.tiscali.be
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Alan,

> Same comment still applies. The 2.5. ones are definitive. If someone
> submits a 2.4 one clashing with a different 2.5 one tell Marcelo to
> revert it ASAP.

So I check in last 2.5.74 (co from parisc-linux.org) and it seems that following
patch would be better apply to merge 2.5 and change in 2.4.22-pre2:
===========
--- include/linux/sysctl.h.orig	2003-07-07 19:22:58.000000000 +0200
+++ include/linux/sysctl.h	2003-07-07 19:19:43.000000000 +0200
@@ -126,6 +126,9 @@
 	KERN_CADPID=54,		/* int: PID of the process to notify on CAD */
  	KERN_CORE_PATTERN=56,	/* string: pattern for core-files */
 	KERN_PPC_L3CR=57,       /* l3cr register on PPC */
+ 	KERN_HPPA_PWRSW=58,	/* int: hppa soft-power enable */
+ 	KERN_HPPA_UNALIGNED=59,	/* int: hppa unaligned-trap enable */
+	KERN_EXCEPTION_TRACE=60, /* boolean: exception trace */
 };
 
===========

If it is corect, could you help me to transmit info to Marcelo (I already
tried to send him severall mail but without any feedback so I presume that
he never got it?)

Thanks in advance,
    Joel





------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 



--========/3F03A42100000927/mail.tiscali.be
Content-Type: application/octet-stream
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="sysctl.h-diff"

LS0tIGluY2x1ZGUvbGludXgvc3lzY3RsLmgub3JpZwkyMDAzLTA3LTA3IDE5OjIyOjU4LjAwMDAw
MDAwMCArMDIwMAorKysgaW5jbHVkZS9saW51eC9zeXNjdGwuaAkyMDAzLTA3LTA3IDE5OjE5OjQz
LjAwMDAwMDAwMCArMDIwMApAQCAtMTI2LDYgKzEyNiw5IEBACiAJS0VSTl9DQURQSUQ9NTQsCQkv
KiBpbnQ6IFBJRCBvZiB0aGUgcHJvY2VzcyB0byBub3RpZnkgb24gQ0FEICovCiAgCUtFUk5fQ09S
RV9QQVRURVJOPTU2LAkvKiBzdHJpbmc6IHBhdHRlcm4gZm9yIGNvcmUtZmlsZXMgKi8KIAlLRVJO
X1BQQ19MM0NSPTU3LCAgICAgICAvKiBsM2NyIHJlZ2lzdGVyIG9uIFBQQyAqLworIAlLRVJOX0hQ
UEFfUFdSU1c9NTgsCS8qIGludDogaHBwYSBzb2Z0LXBvd2VyIGVuYWJsZSAqLworIAlLRVJOX0hQ
UEFfVU5BTElHTkVEPTU5LAkvKiBpbnQ6IGhwcGEgdW5hbGlnbmVkLXRyYXAgZW5hYmxlICovCisJ
S0VSTl9FWENFUFRJT05fVFJBQ0U9NjAsIC8qIGJvb2xlYW46IGV4Y2VwdGlvbiB0cmFjZSAqLwog
fTsKIAogCg==

--========/3F03A42100000927/mail.tiscali.be--
