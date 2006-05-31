From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Encounter ICE while: Re: [parisc-linux] Close to mainline for
Date: Wed, 31 May 2006 09:58:38 -0400 (EDT)
Message-ID: <200605311358.k4VDwcHh023487@hiauly1.hia.nrc.ca>
References: <J04K6A$FA60C75853CD63495B4707B49127E6A4@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <J04K6A$FA60C75853CD63495B4707B49127E6A4@scarlet.be> from "Joel
	Soete" at May 31, 2006 12:08:34 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> regcomp.c:408: internal compiler error: in gen_reg_rtx, at emit-rtl.c:807
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <URL:http://gcc.gnu.org/bugs.html> for instructions.
> For Debian GNU/Linux specific bug reporting instructions,
> see <URL:file:///usr/share/doc/gcc-4.1/README.Bugs>.
> Preprocessed source stored into /tmp/ccOU1j8a.out file, please attach this to
> your bugreport.
> make[2]: *** [/CAD/parisc-linux/CVS-20060529/build/posix/regex.o] Error 1
> 
> Dave can you confirm me that I would actualy fill in a pr?

My impression is that this wouldn't be useful without a lot more
investigation.  It's highly likely that the compiler used for this
compilation was itself miscompiled.  On the otherhand, if you are
using the stock debian build of 4.1 for this compilation, then
definitely a bug report should be submitted.

A version of regex is part of GCC in libiberty.  It builds in every
stage.  So, normally a problem compiling regex would be noticed
immediately.  That's what makes me think the problem is somehow
specific to the compiler that you are using.

There error would appear to be at this point:

  /* Don't let anything called after initial flow analysis create new
     registers.  */
  gcc_assert (!no_new_pseudos);

It would be useful to have a stack backtrace at the point of the error.

You can do this by running gcc with -v to determine the cc1 command
for the compilation.  Run cc1 under gdb.  Put a break on the gcc_assert.
Use the 'ignore' command to tell gdb to ignore the break some large
number of times.  Run the program from the start.  Info break will
tell you how many times the break has been hit.  Use ignore again to
set the number of breaks to ignore to the number of hits less one.
Rerun and a break should occur on the assert which calls abort.  You
could also put a break on abort.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
