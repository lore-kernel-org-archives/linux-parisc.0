Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 35D9C482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 29 Jul 2002 05:30:15 -0600 (MDT)
Date: Mon, 29 Jul 2002 13:30:13 +0200
Subject: Re: [parisc-linux] Re: e45 as a diskless server
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v482)
Cc: =?ISO-8859-1?Q?Jussi_M=E4ki?= <valen@ihanaa.org>,
	parisc-linux@lists.parisc-linux.org <parisc-linux@lists.parisc-linux.org>
To: Christoph Plattner <christoph.plattner@gmx.at>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <3D4049F3.A53BC4BA@gmx.at>
Message-Id: <8C7DF758-A2E6-11D6-8FE6-0030656F07A2@esiee.fr>
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

Le jeudi 25 juillet 2002, =E0 08:56 , Christoph Plattner a =E9crit :

> Have you checked, that the E45 may have (my E55 definitively has) a
> "wrong" pin out. It look to be the opposite pin assignment like a
> modem, but further studies have shown, that it is non-standard.
Yes; it is exactly the same on our E35.
We noticed that the cable connecting the MUX to the Console wasn't a
cross (null modem) one, but a 'straight' one instead.
We built a small 'cross-converter', basically a standard 25-25 serial
cable with female plugs and could then connect the MUX to any standard
serial port.


Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/
