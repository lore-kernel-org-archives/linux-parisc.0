Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8B430482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 16 Oct 2001 12:43:43 -0600 (MDT)
Message-Id: <200110161840.MAA15315@puffin.external.hp.com>
To: paul lee <wbm111us@yahoo.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Help - Serial console problem 
In-Reply-To: Message from paul lee <wbm111us@yahoo.com>
   of "Tue, 16 Oct 2001 10:47:19 PDT." <20011016174719.66829.qmail@web14803.mail.yahoo.com>
Date: Tue, 16 Oct 2001 12:40:22 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

paul lee wrote:
> I could not access a C200 workstation via serial
> console. Could someone please give me some insight?
> I use hyperterminal on Win 2000. The settings are
> VT100, 9600, 8-N-1 and Xon/Xoff.

The settings are correct.
It's possible the serial cable isn't wired correctly
or the C200 isn't trying to use serial port1.

grant
