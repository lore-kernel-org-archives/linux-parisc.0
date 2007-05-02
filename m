From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] memory management issues
Date: Wed, 02 May 2007 18:39:52 -0500
Message-ID: <1178149192.3712.28.camel__12971.1490510546$1416624349$gmane$org@mulgrave.il.steeleye.com>
References: <65dd6fd50704301144k77003d1he9f85f4bb6cf2ace@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>,
 parisc-linux@lists.parisc-linux.org
To: Ollie Wild <aaw@google.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <65dd6fd50704301144k77003d1he9f85f4bb6cf2ace@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, 2007-04-30 at 11:44 -0700, Ollie Wild wrote:
> In response to previous attempts to increase the command line
> limitation (http://thread.gmane.org/gmane.linux.kernel/418858), Linus
> has indicated that any temporary pages should be swappable.  This
> patch attempts to solve this problem by creating the new process's
> mm_struct early in the do_execve() callchain and writing directly into
> the new stack segment (cf. copy_strings()).  When I instrument this on
> an a500, I observe that the pages are setup correctly and contain
> valid values up until the call to switch_mm() via the call stack:
> 
>   activate_mm()
>   exec_mmap()
>   flush_old_exec()
>   load_elf_binary()
>   do_execve()
> 
> Afterwards, the pages are zeroed.

Give me more of a clue on this one ... afterwards *who* sees the pages
as zero'd?  The user or the kernel ... if the user, I think it's a
simple coherency problem.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
