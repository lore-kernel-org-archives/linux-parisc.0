Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.zrt.nl (ns.zrt.nl [212.153.94.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0613D482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Sep 2002 00:18:42 -0600 (MDT)
Received: (from fwmaster@localhost) by ns.zrt.nl (8.9.1a/8.6.12) id IAA22380 for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Sep 2002 08:18:39 +0200 (MET DST)
Message-Id: <sd8ad9a7.057@ms-zrt1>
Date: Fri, 20 Sep 2002 08:06:56 +0200
From: "Jurriaan Kalkman" <Jurriaan.Kalkman@zrt.nl>
To: <j@steindlberger.de>
Cc: <grundler@dsl2.external.hp.com>, <moritz@freesources.org>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Betr.: Re: [parisc-linux] ide controller
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

>On Thursday 19 September 2002 12:06, you wrote:

>we tried a different controller with originally an eprom bios. We simply =
put=20
>that eeprom away. (The Promise has a chip-integrated flash bios - =
putting=20
>that away seems not to be possible.) The kernel crashed alike. Do You =
have=20
>any ideas to get more debug output? I could set up my second C-Class =
with=20
>parisc-linux and test it there. (The first one is now running some =
essential=20
>services - continued crashing would not be good.)
>
I have successfully run a PDC20265 Promise card on an Alpha, so the BIOS
is not needed to use it from Linux.

Kind regards,
Jurriaan
