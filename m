From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] syscall restart block.
Date: 12 Sep 2004 17:36:00 -0400
Message-ID: <1095024967.1990.23.camel@mulgrave>
References: <20040912184553.GT1854@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>,
 Randolph Chung <tausq@debian.org>
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040912184553.GT1854@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2004-09-12 at 14:45, Carlos O'Donell wrote:
> The problem is that we should in general disable restartable syscalls as
> we walk the userspace return trampoline. If the user took a signal
> during the trampoline walk, the signal handler could execute a
> restartable syscall, and if that syscall was interrupted, the restorer
> function would be changed (there is only one entry for a restorer, they
> aren't chained). This means that you technically call the wrong syscall
> when you unwind from the signal that you took on the stack trampoline.

If I read this scenario correctly it can only be triggered on an SMP
system (where another user process executing on a different CPU sends a
singnal to this process) or if the process is unlucky enough to take an
interrupt while executing the trampoline ... still, the window exists
and should be plugged

> I only just realized we still had this hole and it might manifest itself
> under heavy signal load.

Precisely, because heavy load usually implies higher disc or network
interrupt load.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
