Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3DEBE4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Apr 2003 10:45:16 -0600 (MDT)
Date: Tue, 15 Apr 2003 09:41:39 -0700
From: Randolph Chung <randolph@tausq.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>,
	Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] parisc-linux.org kernel
Message-ID: <20030415164139.GJ25257@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <1050320386.25353.11.camel@dhcp22.swansea.linux.org.uk> <3E9BA3670000071C@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E9BA3670000071C@ocpmta1.freegates.net>
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

> By the way, in drivers/char/serial.c, also related to 'superio', i noticed:
> 
> #ifdef CONFIG_SUPERIO
>     superio_serial_init();
> #endif

this probably should not go upstream.. it's a hack so we can get early
console (and is stlil broken on 2.5 :-( )

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
