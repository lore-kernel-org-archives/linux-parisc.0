Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 20 Dec 2002 18:38:24 -0700
To: James Bottomley <James.Bottomley@steeleye.com>
Cc: Randolph Chung <randolph@tausq.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.5 randomly kills applications with page faults
Message-ID: <20021221013824.GA18983@dsl2.external.hp.com>
References: <randolph@tausq.org> <20021218170254.GM19331@tausq.org> <200212202212.gBKMCbv08741@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200212202212.gBKMCbv08741@localhost.localdomain>
From: grundler@dsl2.external.hp.com (Grant Grundler)
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

On Fri, Dec 20, 2002 at 04:12:37PM -0600, James Bottomley wrote:
...
> The problem is that they forgot to increment the stack pointer.  Thus, if we 
> take an interruption between this instruction and the corresponding
> retrieval, the value can be trashed.

It doesn't look like this bug is present in 2.4.
Richard suspects it was introduced when the task struct was split
from the stack. (I hope I recall his statement correctly)

The new code sequence is:
 95	mtsp    %r0,%sr7			/* get kernel space into sr7 */
 96	STREGM  %r1,FRAME_SIZE(%r30)		/* save r1 (usp) here for now */
 97	mfctl   %cr30,%r1			/* get task ptr in %r1 */
 98	LDREG   TI_TASK(%r1),%r1
105	STREG   %r0,  TASK_PT_PSW(%r1)
106	STREG   %r2,  TASK_PT_GR2(%r1)		/* preserve rp */
107	LDREGM  FRAME_SIZE(%r30), %r2		/* get users sp back */
108	STREG   %r2,  TASK_PT_GR30(%r1)		/* ... and save it */

where STREGM/LDREGM are new macros that use st<X>,ma instructions.
I'll commit this once I see it boots on my c3000.

But, given the assertion we could take an interrupt between line 96 and
107, would an interrupt between 95/96 cause Bad Things (tm) to happen?

grant
