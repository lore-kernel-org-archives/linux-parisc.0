Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] vmlinux header for savecrash. 
In-Reply-To: Message from Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
   of "Tue, 22 Jan 2002 18:55:31 +0100." <3C4DA793.B17F1D3C@admin.france.hp.com>
References: <3C4C53B7.67DA24E@admin.france.hp.com> <20020121202539.994A5482A@dsl2.external.hp.com> <3C4D2EFB.F82671C2@admin.france.hp.com> <20020122174533.38418482A@dsl2.external.hp.com>  <3C4DA793.B17F1D3C@admin.france.hp.com> 
Date: Tue, 22 Jan 2002 11:34:04 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020122183404.4F8234830@dsl2.external.hp.com>
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
> 	Hi
> I don't know how to retrieve option pass to the kernel,
> but give me some clue, and I'll add this information in
> the dump header asap, because it is a really good idea :-)

(credit: Randolph brought it up first)

Look at arch/parisc/kernel/setup.c:setup_cmdline().
We can add pretty much anything we need here.

It just occurred to me that the source media (ie network, disk)
needs to be identified as well.
Is the vmlinux/System.map required to be on the root file system?
Would it be reasonble if savecrash told the user that /boot/vmlinux
wasn't the matching kernel and where to put the right vmlinux/System.map?

Allowing users to drop the right kernel in place *after* the
crash dump was recovered seems reasonable thing to do.
Someone might want to move the crash dump to a bigger/faster
system to do the actual analysis.

grant
