Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Paul Bame <bame@fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] vmlinux header for savecrash. 
In-Reply-To: Message from Paul Bame <bame@fc.hp.com>
   of "Tue, 22 Jan 2002 12:59:03 MST." <E16T74R-0002Ko-00@noam.fc.hp.com>
References: <15417.3793.688638.629130@gargle.gargle.HOWL> <20020107034615.9BFD64839@dsl2.external.hp.com>  <E16T74R-0002Ko-00@noam.fc.hp.com> 
Date: Tue, 22 Jan 2002 19:13:18 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020123021318.E6C6C482A@dsl2.external.hp.com>
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

Paul Bame wrote:
> 
> palo removes the "3/vmlinux" parameter (and the initrd= one too) before
> passing command line to the kernel which is consistent with x86 I think.
> Would it be helpful to add a kernel parameter like "palo_kernel=3/vmlinux"
> which you could then retrieve from /proc/cmdline?

Sort of. Actually, I was thinking the dump driver could use "palo_kernel"
global to save off the file name of the vmlinux which crashed.
setup_cmdline could parse/squirrel away the palo_kernel parameter.

> I know it's a pain
> to turn 3/vmlinux into /boot/vmlinux but 3/vmlinux is all palo knows.

Isn't /vmlinux a symlink to /boot/vmlinux?
ie the file palo loaded is whatever the symlink points to.

BTW, I explicitly specify /boot/vmlinux in my palo.conf files
and see 3/boot/vmlinux in my palo command line.

thanks,
grant
