Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id D1895482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jul 2003 12:45:04 -0600 (MDT)
Date: Mon, 14 Jul 2003 20:45:02 +0200
Subject: Re: [parisc-linux] 2.4.21-paX on an rp2430
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v552)
Cc: parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <varenet@esiee.fr>
In-Reply-To: <20030714182347.GC14114@systemhalted>
Message-Id: <47013C75-B62B-11D7-997E-0030656F07A2@esiee.fr>
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

Le lundi, 14 jul 2003, =E0 20:23 Europe/Paris, Carlos O'Donell a =E9crit =
:

>
> ********** VIRTUAL FRONT PANEL **********
> System Boot detected
> *****************************************
> LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
>        ON       FLASH         OFF       ON         ON
> LED State: There was a system interruption that did not take the=20
> system down.
> Check Chassis and Console Logs for error messages.
>
> processor                 system initialization      1C00
> processor                 system initialization      1C00

these two messages show that the kernel went up to calling INIT
(the second "system initialization" is sent just before INIT is called).

You can check the real logs by issuing the CL command in your GSP.
You'll find there the console log, without the VFP messages.

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/=
