Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id B15384830
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Mar 2003 09:27:59 -0700 (MST)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by smtp-out.tiscali.be with esmtp (Tiscali)
	id 18smbe-0006d4-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Mar 2003 17:27:58 +0100
Date: Tue, 11 Mar 2003 17:27:58 +0100
Message-ID: <3E689FC400001167@ocpmta1.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] ndelay() ?
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

Hi all,

In the new 2.4.21-pre5 we need a ndelay() function (ide support for b2k at
least).

Some sparc[64], ppc supply this ndelay as a modified udelay (parameter time
1000);
we could also do it for our parisc as follow:
(see include/asm-parisc/delay.h)
...
static __inline__ void __ndelay(unsigned long usecs) {
	__cr16_delay(usecs * ((unsigned long)boot_cpu_data.cpu_hz / 1000UL));
}

#define ndelay(n) __ndelay(n)
...

OTC 2.5 proposed another solution:

(see include/linux/delay.h)

#ifndef ndelay
#define ndelay(x)    udelay(((x)+999)/1000)
#endif

What is the best?

Thanks for advise,
    Joel


---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
