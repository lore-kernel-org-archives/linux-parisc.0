Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 434654838
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Mar 2003 11:29:45 -0700 (MST)
Date: Tue, 11 Mar 2003 19:29:41 +0100
Message-ID: <3E68A39600000B98@ocpmta7.freegates.net>
In-Reply-To: <1047409836.19931.3.camel@irongate.swansea.linux.org.uk>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] ndelay() ?
To: "Alan Cox" <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>-- Original Message --
>Subject: Re: [parisc-linux] ndelay() ?
>From: Alan Cox <alan@lxorguk.ukuu.org.uk>
>To: Joel Soete <jsoe0708@tiscali.be>
>Cc: parisc-linux@lists.parisc-linux.org
>Date: 11 Mar 2003 19:10:37 +0000
>
>
>On Tue, 2003-03-11 at 16:27, Joel Soete wrote:
>> Hi all,
>> 
>> In the new 2.4.21-pre5 we need a ndelay() function (ide support for b2k
>at
>> least).
>
>If you can't do ndelay well, udelay(1) as an equivalent is just fine.
>What it must be is at least the required nSec delay
>

Many thanks Alan,
    Joel

---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
