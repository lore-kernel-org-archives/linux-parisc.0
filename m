From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] missing system calls ?
Date: Sun, 18 Mar 2007 12:51:10 +0100
Message-ID: <200703181251.10536.deller__27953.2912456945$1416624329$gmane$org@gmx.de>
References: <200703171348.56311.deller@gmx.de>
	<20070317150117.GA10950@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070317150117.GA10950@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Saturday 17 March 2007, Kyle McMartin wrote:
> On Sat, Mar 17, 2007 at 01:48:56PM +0100, Helge Deller wrote:
> 
> > init/missing_syscalls.h:203:3: warning: #warning syscall sigaction not implemented
> > init/missing_syscalls.h:218:3: warning: #warning syscall sigsuspend not implemented
> > init/missing_syscalls.h:359:3: warning: #warning syscall sigreturn not implemented
> 
> We don't support non-realtime signals (the syscalls are rt_*)
> 
> > init/missing_syscalls.h:68:3: warning: #warning syscall umount not implemented
> 
> umount2
> 
> > init/missing_syscalls.h:248:3: warning: #warning syscall select not implemented
> 
> newselect
> 
> > init/missing_syscalls.h:269:3: warning: #warning syscall readdir not implemented
> 
> obsolete
> 
> > init/missing_syscalls.h:308:3: warning: #warning syscall socketcall not implemented
> 
> we don't use the socketcall multiplexer (presumably because we don't need
> to put the args on the stack) for socket/bind/connect/ etc...
> 
> > init/missing_syscalls.h:353:3: warning: #warning syscall ipc not implemented
> 
> same story as socketcall, obsolete multiplexed syscall
> 
> > init/missing_syscalls.h:749:3: warning: #warning syscall fadvise64 not implemented
> 
> sys_fadvise64_64 versus fadvise64 is a reordering of syscall args, presumably
> because loff_t is 64bit and needs to be passed in pairs.
> 
> > init/missing_syscalls.h:800:3: warning: #warning syscall statfs64 not implemented
> > init/missing_syscalls.h:803:3: warning: #warning syscall fstatfs64 not implemented
> 
> Your kernel is too old. 2.6.21-rc3 has this.
> 
> > init/missing_syscalls.h:809:3: warning: #warning syscall utimes not implemented
> 
> Dunno about this one. sys_utimes seems to just call futimesat anyways.
> 
> > init/missing_syscalls.h:845:3: warning: #warning syscall kexec_load not implemented
> 
> nobody's implemented kexec yet. :)

Thanks Kyle !

So parisc-linux has all important (and currently on PA possible) syscalls wired up.
Nice to know.

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
