Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp2.libero.it (smtp2.libero.it [193.70.192.52])
	by dsl2.external.hp.com (Postfix) with ESMTP id 226414841
	for <parisc-linux@lists.parisc-linux.org>; Wed, 22 Oct 2003 13:35:03 -0600 (MDT)
Date: Wed, 22 Oct 2003 21:33:43 +0200
Subject: Re: [parisc-linux] SCSI problems
From: Riccardo Mottola <rollei@tiscalinet.it>
To: Grant Grundler <grundler@parisc-linux.org>,
	parisc <parisc-linux@lists.parisc-linux.org>
Message-ID: <BBBCA837.9A9E%rollei@tiscalinet.it>
In-Reply-To: <20031022154344.GA7470@colo.lackof.org>
Mime-version: 1.0
Content-type: text/plain; charset="US-ASCII"
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

Hello,

on 10/22/03 5:43 PM, Grant Grundler at grundler@parisc-linux.org wrote:

> See http://www.parisc-linux.org/faq/kernelbug-howto.html
> You might find an HPMC occurred (which killed serial console)
> in the "ser pim" output from PDC "BOOT_ADMIN" prompt.

the how-to seems to describe exactly my problem.

I press esc at boot and enter the boot selection.

I have:

PDC ROM rev. 2.1
IODC ROM rev. 2.1 
on my 720 "cobra".

i have a preliminary menu, with A I enter in the "boot admin" menu which I
think is what is needed.

"help" displays no ser command
howewer (doing cut and paste):

BOOT_ADMIN> ser clearpim
ERROR: Unknown CONSOLE command.
BOOT_ADMIN> ser pim
ERROR: Unknown CONSOLE command.

Was that command added later? do I have an equivalent? am I in the wrong
menu? I think owners of older hardware will know better.

Regards,
    Riccardo
