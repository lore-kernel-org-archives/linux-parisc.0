Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel9.hp.com (atlrel9.hp.com [156.153.255.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id B2F9A4829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Dec 2002 09:26:54 -0700 (MST)
Received: from smtp2.fc.hp.com (smtp.fc.hp.com [15.15.136.253])
	by atlrel9.hp.com (Postfix) with ESMTP id 3B173E007F0
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Dec 2002 11:26:50 -0500 (EST)
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>,
	bame@fc.hp.com
Subject: Re: [parisc-linux] panic while "set serial" with 2.4.20-pa9 
In-Reply-To: Your message of "Thu, 05 Dec 2002 10:25:03 +0100."
             <3DEF1B6F.1573C841@admin.france.hp.com>
References: <3DEF1B6F.1573C841@admin.france.hp.com> 
Date: Thu, 05 Dec 2002 09:26:49 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <20021205162649.B50E515191@paul.bame>
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

> This is a multi-part message in MIME format.
> --------------11B10191D25EDD401FC846C9
> Content-Type: text/plain; charset=iso-8859-1
> Content-Transfer-Encoding: base64
> 
> ICAgIEhpDQpJJ20gY29tcGlsaW5nIGEgbmV3IGtlcm5lbCwgYnV0IGl0IHBhbmljIHdoaWxl
> IGRvaW5nICJzZXQgc2VyaWFsIjoNCg0KU2VyaWFsIGRyaXZlciB2ZXJzaW9uIDUuMDVjICgy
> MDAxLTA3LTA4KSB3aXRoIE1BTllfUE9SVFMgU0hBUkVfSVJRIFNFUklBTF9QQ0kgZW5hYmxl

It's probably not the new kernel. setserial is quite dangerous and
bypasses any driver-related safety.  I often disable or remove it on
development machines and it's often fatal after a serial configuration
change.

The two places I've suffered are when I removed serial ports and
rebooted, and when I booted a second machine (with different port setup)
from a disk made from the first machine.  In both cases setserial tried
to restore settings using addresses which didn't exist --> panic.

	-P
