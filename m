Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9467A4843
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Jun 2002 02:08:06 -0600 (MDT)
Date: Tue, 11 Jun 2002 10:08:05 +0200
Subject: Re: [parisc-linux] 2.4.18-pa35 SMP process hangs on a J200
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v482)
Cc: parisc-linux@lists.parisc-linux.org, grundler@cup.hp.com,
	Randolph Chung <randolph@tausq.org>
To: Ryan Bradetich <rbradetich@uswest.net>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <1023773807.7353.19.camel@beavis>
Message-Id: <5BA66B90-7D12-11D6-B01F-0030656F07A2@esiee.fr>
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

Le mardi 11 juin 2002, =E0 07:36 , Ryan Bradetich a =E9crit :

>
> Digging into the system a bit, here is what I found:
>
> 	* The setiathome process that hung (PID 326) will hang any other
> 	  process that tries to access /proc/326/*.  (This is why top,
> 	  ps, etc all hang after the process gets stuck).
Here we run a setiathome client, a distributed.net client, and from=20
times to times we build isos.

This is consistent with what we experienced, but the first time we=20
remarked a hung (after 44 days of uptime), all proccesses that try to=20
get info about running processes, such as 'top', 'ps' or even a 'ls=20
/proc/PID/' would hang. 'w' would also hang, but not 'uptime'. It was=20
with -pa16.

The second time we got a hang, with -pa33, 'ps -ef' hung just before=20
displaying info about the setiathome client.

Another interesting thing is that after issuing any of these commands,=20=

the loadavg increased by 1, ie if we got a loadavg of 2.00 before trying=20=

a ps, a w and a ls /proc/PID, we would get a loadavg of 5.00 after these=20=

3 commands.
>
> 	* None of the other processes appear to be stuck. (ie. I can
> 	  access the /proc/PID/* information and the command will 	 =
 return).
We cannot access such info, alas.
>
>
Anyway, as Randolph Chung said, Paul Bame's work might be interesting...



Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/
