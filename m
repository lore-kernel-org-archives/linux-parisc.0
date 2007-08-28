From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [patch 15/23] Add cmpxchg_local to parisc
Date: Tue, 28 Aug 2007 00:39:05 -0600
Message-ID: <20070828063905.GA3916@colo.lackof.org>
References: <20070812145434.520271946@polymtl.ca>
	<20070812145840.691277845@polymtl.ca>
	<20070827210432.GA22484@colo.lackof.org>
	<20070827211140.GB10627@Krystal>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: Christoph Lameter <clameter@sgi.com>,
 akpm@linux-foundation.org,
 parisc-linux@parisc-linux.org,
 linux-kernel@vger.kernel.org
To: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070827211140.GB10627@Krystal>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Aug 27, 2007 at 05:11:40PM -0400, Mathieu Desnoyers wrote:
...
> > Can you add a description to Documentation/atomic_ops.txt ?
> > *sigh* sorry for being "late to the party" on this one...
> 
> Does Documentation/local_ops.txt answer your questions ? If not, please
> tell me and I'll gladly explain more.

Yes, it does mostly - thanks. 

A few questions/nits:
o Did you attempt quantify how many places in the kernel could use this?
  I'm just trying to get a feel for how useful this really is vs just 
  using existing mechanisms (that people understand) to implement a 
  non-SMP-safe counter that protects updates (writes) against interrupts.
  If you did, adding some referencs to local_ops.txt would be helpful
  so folks could look for examples of "correct usage".

o Wording in local_ops.txt: "on the 
	"... it will then appear to be written out of order wrt
	 other memory writes on the owner CPU."

  I'd like to suggest "by the owner CPU".

o How can a local_t counter protect updates (writes) against interrupts 
  but not preemption?
  I always thought preemption required some sort of interrupt or trap.
  Maybe the local_ops.txt explains that and I just missed it.

  DaveM explained updates "in flight" would not be visible to interrupts
  and I suspect that's the answer to my question....but then I don't "feel
  good" the local_ops are safe to update in interrupts _and_ the process
  context kernel.  Maybe the relationship between local_ops, preemption,
  and interrupts could be explained more carefully in local_ops.txt.

o OK to add a reference for local_ops.txt to atomic_ops.txt?
  They are obviously related and anyone "discovering" one of the docs
  should be made aware of the other.
  Patch+log entry appended below. Please sign-off if that's ok with you.


thanks,
grant

Diff+Commit entry against 2.6.22.5:

local_t is a variant of atomic_t and has related ops to match.
Add reference for local_t documentation to atomic_ops.txt. 

Signed-off-by: Grant Grundler <grundler@parisc-linux.org>


--- 2.6.22.5-ORIG/Documentation/atomic_ops.txt	2007-08-27 22:50:27.000000000 -0700
+++ 2.6.22.5-ggg/Documentation/atomic_ops.txt	2007-08-27 22:54:44.000000000 -0700
@@ -14,6 +14,10 @@
 
 	typedef struct { volatile int counter; } atomic_t;
 
+local_t is very similar to atomic_t. If the counter is per CPU and only
+updated by one CPU, local_t is probably more appropriate. Please see
+Documentation/local_ops.txt for the semantics of local_t.
+
 	The first operations to implement for atomic_t's are the
 initializers and plain reads.
 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
