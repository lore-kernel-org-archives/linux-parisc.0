Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Thibaut VARENE <varenet@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 9000/819/K210 
In-Reply-To: Message from Thibaut VARENE <varenet@esiee.fr>
   of "Mon, 08 Jul 2002 23:03:32 +0200." <294EE282-92B6-11D6-9EA1-0030656F07A2@esiee.fr>
References: <294EE282-92B6-11D6-9EA1-0030656F07A2@esiee.fr> 
Date: Mon, 08 Jul 2002 15:44:30 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020708214430.9FB31484C@dsl2.external.hp.com>
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

Thibaut VARENE wrote:
> > ie has anyone seen a hang when sym53c8xx driver was using IO port =
> space?
> I had to stop the box, no hang, just some kernel upgrade needed...

ok.

> Anyway I'm pretty convinced this is a I/O pb, which seems to be =
> confirmed
> by the observations Ryan and I made:
> all stuck processes are always in 'down_read' or 'down_write' state when
> hanging...

hmm...I've not mucked with the semaphore code and don't pretend to
understand it.

> No, I have just got some 't' SysRq dump (special 't', from Ryan's patch)

This is better than TOC for the reasons you mentioned. 
Please post whatever output you can get from SysRq and
don't bother with the TOC unless the SysRq doesn't work.

> All problems are coming on SMP kernels. I've never seen such hangs on UP
> systems (thank God, it would be awful to restart our webserver every=20
> day!)

ok.

thanks,
grant
