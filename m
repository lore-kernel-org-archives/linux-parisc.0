Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] vmlinux header for savecrash. 
In-Reply-To: Message from Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
   of "Tue, 22 Jan 2002 10:20:59 +0100." <3C4D2EFB.F82671C2@admin.france.hp.com>
References: <3C4C53B7.67DA24E@admin.france.hp.com> <20020121202539.994A5482A@dsl2.external.hp.com>  <3C4D2EFB.F82671C2@admin.france.hp.com> 
Date: Tue, 22 Jan 2002 10:45:33 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020122174533.38418482A@dsl2.external.hp.com>
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

Bruno Vidal wrote:
> 	Sorry, but on my system, fgrep gives nothing
> (and by using strings, I found nothing also).

grundler@gsyprf11:~$ uname -a
Linux gsyprf11.external.hp.com 2.4.17-pa11 #3 SMP Fri Jan 18 23:32:06 PST 2002 parisc64 unknown
grundler@gsyprf11:~$ strings /boot/vmlinux | fgrep 2.4.17
Linux version 2.4.17-pa11 (grundler@gsyprf10) (gcc version 3.0.3) #3 SMP Fri Jan 18 23:32:06 PST 2002
Linux 2.4.17-pa11
2.4.17-pa11
grundler@gsyprf11:~$ 

Perhaps a simple fgrep isn't sufficient for what you have.
You might need to pick out certain fields.

> And I
> can't use dmesg buffer, because by definition it is a buffer,
> so after running sometime, the palo boot strings is not
> in the buffer anymore.

right. They should be in the /var/log/messages if they are no longer
in the dmesg buffer.

> Some new ideas ?

Randolph Chung and I were wondering if dump driver could save a
parameter passed in by palo: eg "boot_kernel=/boot/vmlinux-pa11".
I haven't checked if something like that already exists.

grant
