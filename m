From: Peter Zijlstra <a.p.zijlstra@chello.nl>
Subject: [parisc-linux] Re: [patch 2/3] audit: rework execve audit
Date: Tue, 03 Jul 2007 17:00:55 +0200
Message-ID: <1183474855.7054.2.camel__33385.225889697$1416624407$gmane$org@twins>
References: <20070613100334.635756997@chello.nl>
	<20070613100834.897301179@chello.nl>
	<20070626155541.9708eded.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Andi Kleen <ak@suse.de>,
 linux-mm@kvack.org,
 linux-audit@redhat.com,
 Ollie Wild <aaw@google.com>,
 Ingo Molnar <mingo@elte.hu>,
 parisc-linux@lists.parisc-linux.org
To: Andrew Morton <akpm@linux-foundation.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070626155541.9708eded.akpm@linux-foundation.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, 2007-06-26 at 15:55 -0700, Andrew Morton wrote:
> On Wed, 13 Jun 2007 12:03:36 +0200
> Peter Zijlstra <a.p.zijlstra@chello.nl> wrote:
> 
> > +#ifdef CONFIG_AUDITSYSCALL
> > +	{
> > +		.ctl_name	= CTL_UNNUMBERED,
> > +		.procname	= "audit_argv_kb",
> > +		.data		= &audit_argv_kb,
> > +		.maxlen		= sizeof(int),
> > +		.mode		= 0644,
> > +		.proc_handler	= &proc_dointvec,
> > +	},
> > +#endif
> 
> Please document /proc entries in Documentation/filesystems/proc.txt



Signed-off-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
---
 Documentation/filesystems/proc.txt |    7 +++++++
 1 file changed, 7 insertions(+)

Index: linux-2.6/Documentation/filesystems/proc.txt
===================================================================
--- linux-2.6.orig/Documentation/filesystems/proc.txt
+++ linux-2.6/Documentation/filesystems/proc.txt
@@ -1075,6 +1075,13 @@ check the amount of free space (value is
 resume it  if we have a value of 3 or more percent; consider information about
 the amount of free space valid for 30 seconds
 
+audit_argv_kb
+-------------
+
+The file contains a single value denoting the limit on the argv array size
+for execve (in KiB). This limit is only applied when system call auditing for
+execve is enabled, otherwise the value is ignored.
+
 ctrl-alt-del
 ------------
 


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
