Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 62CBC482E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Dec 2002 00:23:35 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscali)
	id 18OC4g-0004EJ-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Dec 2002 08:23:30 +0100
Date: Tue, 17 Dec 2002 08:22:58 +0100
Message-ID: <3DED9BBD0000213E@ocpmta7.freegates.net>
In-Reply-To: <1040061866.13786.74.camel@irongate.swansea.linux.org.uk>
From: jsoe0708@tiscali.be
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] Dropping ide controler in 'Native' mode?
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

>
>On Mon, 2002-12-16 at 17:06, jsoe0708@tiscali.be wrote:
>> Hi Alan,
>> 
>> Worried about ext3 pb, I try to merge parisc kernel 2.4.20-pa14 with
2.4.21-pre1.
>> This merge seems to works fine on a b180l+ (without pci devices).
>> But still boot twice (??) and crash on a b2k with an ide cdrom.
>
>I've sent the PCI fixup patch to linux-kernel. Depending upon how the
>PA-RISC system interfaces to the IDE controller you may also need
>platform specific fixups or to drop the chip into Native mode.
>
Can somebody tell me if it is possible (if yes how)?

Thanks in advance,
    Joel


*************************************************************************=
*******
Controlez mieux votre consommation Internet...surfez Tiscali Complete...h=
ttp://tiscali.complete.be
