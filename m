Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from finlandia.drysoft.org (finlandia.drysoft.org [192.107.216.183])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5B78F482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 26 Jan 2002 04:22:25 -0700 (MST)
Subject: Re: [parisc-linux] 712/60, 2.4.17-pa13, debian testing, php4 and
	apache don't work.. -- SOLVED
From: Mikko Palo <mpalo@drysoft.org>
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <1012003752.3303.2.camel@finlandia.drysoft.org>
References: <1012003752.3303.2.camel@finlandia.drysoft.org>
Content-Type: text/plain
Date: 26 Jan 2002 13:22:28 +0200
Message-Id: <1012044148.3404.6.camel@finlandia.drysoft.org>
Mime-Version: 1.0
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

Sigh, I hate to reply myself, but..

Problem solved, had to compile apache, mm and php4 from source using
apt-get source --build XXXX command. Now everything working very
perfectly..

Keep working good job, guys! :)

-MP

On Sat, 2002-01-26 at 02:09, Mikko Palo wrote:
> Hi!
> 
> I don't know, does this email belong to this list or to debian bug
> database. Nevertheless, I installed debian to my 712 from 0.9.3 CD and
> updated everything by using apt-get update and apt-get upgrade commands.
> Compiled the kernel myself, all working nicely. Then installed apache
> and php4 via apt-get.
> 
> When trying to start apache by the command /etc/init.d/apache start, it
> doesn't start. There is a line:
> PHP Fatal error:  Unable to start session mm module in Unknown on line 0
> in /var/log/apache/error_log..
> 
> Then I searched with google the solution for this bug. None of them
> helped.
> 
> Straced a little /usr/sbin/apache:
> 
> --clippeti clip--
> 
> shmget(IPC_PRIVATE, 33554432, IPC_CREAT|0x180|0600) = 360448
> shmat(360448, 0x80808080, 0ptrace: umoven: Input/output error
> )            = ?
> shmctl(360448, IPC_STAT, 0x80808080)    = 0
> getuid()                                = 0
> getgid()                                = 0
> shmctl(360448, IPC_SET, 0x80808080)     = 0
> shmctl(360448, IPC_RMID, 0x80808080)    = 0
> unlink("")                              = -1 ENOENT (No such file or
> directory)
> open("", O_RDWR|O_CREAT, 0600)          = -1 ENOENT (No such file or
> directory)
> shmdt(0xfffffffe)                       = 0
> shmctl(360448, IPC_RMID, 0xfffffffe)    = -1 EINVAL (Invalid argument)
> unlink("")                              = -1 ENOENT (No such file or
> directory)
> write(2, "PHP Fatal error:  Unable to star"..., 72) = 72
> write(2, "\n", 1)                       = 1
> exit(-2)                                = ?
> 
> --clippeti clip--
> 
> I doubt that there is something wrong between mm module and shared
> memory code in kernel? Or am I totally wrong?
> 
> So what should I do that I will get it working?
> 
> -MP
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
