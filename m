From: Stuart Brady <sdbrady@ntlworld.com>
Subject: [parisc-linux] Conditional Execution and Instruction Nullification
Date: Sun, 29 Jan 2006 03:14:52 +0000
Message-ID: <20060129031452.GA24516@miranda.arrow>
References: <ITRHVB$11210699317E1F3FB9E9F490F8B5B813@scarlet.be>
	<20060127175155.GA21486@colo.lackof.org>
	<43DBA5A1.90002@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: rmk+lkml <rmk+lkml@arm.linux.org.uk>,
 parisc-linux <parisc-linux@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <43DBA5A1.90002@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jan 28, 2006 at 05:10:57PM +0000, Joel Soete wrote:
> Ah ok sorry, I was confused by a colleague of mine experimented in other 
> cpu risc who tell me that 'instrucion nullification' was typicaly RISC, 
> though. (I can just try to ask him more details on cpu arch he spoke about)

Ignoring conditional traps/branches (and hoping I've got this right):

Neither Alpha nor PowerPC have conditional execution.  MIPS and SPARC
have conditional move instructions (as does POWER).  ARM has conditional
execution for most instructions.  PA-RISC has instruction nullification.

SPARC does have delay slot nullification (with confusing semantics), but
that's unrelated.  MIPS (since MIPS II) and PA-RISC have this, too.

http://gec.di.uminho.pt/discip/TextoAC/AnexoE.html might be a good read.

Cheers,
-- 
Stuart Brady
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
