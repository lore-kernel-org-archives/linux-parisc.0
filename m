From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] Re: Need help writing register consistency test?
Date: Thu, 16 Sep 2004 16:11:33 -0400 (EDT)
Message-ID: <200409162011.i8GKBYIA007701@hiauly1.hia.nrc.ca>
References: <20040916192641.GG28659@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040916192641.GG28659@tausq.org> from "Randolph Chung" at Sep
	16, 2004 03:26:41 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Dave, do you have any comments on this:
> http://marc.theaimsgroup.com/?l=linux-ia64&m=109507921717647&w=2
> 
> do you think this could be causing problems for us too? (do you do any
> stracing/gdb during your tests?)

No, but the symptoms seem similar.  I had one failure in the return
from pipe.  It's possible that some of the gcj SEGVs follow a pipe
syscall.

The fix was to compile with -fno-optimize-sibling-calls.  In recent
versions of GCC, we allow sibcalls for 32-bit code but not for
64-bit code.  This is because the arg pointer isn't a fixed register
in the 64-bit runtime and because the linker does a crappy job of
stub placement.

In spite of the fact that sibcalls are not ok in the 64-bit runtime,
I think there are still situations where gcc will generate sibcalls.
For example, in gcc 4.0, the gcc.dg/sibcall-[12].c tests now pass.
Self-recursion tail calls are optimized for all targets regardless of
the presence of sibcall patterns.

The ia64 GCC fix was to return false in ia64_function_ok_for_sibcall
if the function has the syscall_linkage attribute.  As I noted above,
we always return false on hppa64.  So, if we have a sibcall problem,
it has to be in a self-recursion tail call.

I'm fairly sure that sibcalls have always been disabled on hppa64
in the released versions of GCC.  I'm not sure about 3.0.4.  Alan
Modra was experimenting with them.

Are we using the syscall_linkage attribute?  This could be an issue
on the 32-bit port where sibcalls are enabled.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
