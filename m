Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7CD904829
	for <parisc-linux@parisc-linux.org>; Mon, 13 Jan 2003 10:17:12 -0700 (MST)
Date: Mon, 13 Jan 2003 18:16:59 +0100
Message-ID: <3E1AA7C1000010CA@ocpmta7.freegates.net>
In-Reply-To: <20030113165746.GA12986@tausq.org>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] Re: floating point exception error
To: "Randolph Chung" <randolph@tausq.org>
Cc: parisc-linux@parisc-linux.org
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

>> I just update my kernel to -pa21 release do a 'make distclean' recover=

>my
>> previous .config then do 'make menuconfig' and finaly 'make dep; make
vmlinux'.
>
>sorry, my bad. fixed now.
>
Hmm never the less printbinary() is well defined into arch/parisc/kernel/=
traps.c
so I do not understand why ld couldn't link it when building kernel?

Thanks again,
    Joel


*********************************************
Vous surfez toujours avec une ligne classique ?
Faites des economies avec Tiscali Complete...
Plus d'info sur ... http://complete.tiscali.be
