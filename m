From: Randolph Chung <tausq@debian.org>
Subject: Re: [parisc-linux] Support for 2.4.x kernels on hppa
Date: Mon, 24 May 2004 22:42:16 -0700
Message-ID: <20040525054216.GD7207__23715.271408628$1416623454$gmane$org@tausq.org>
References: <200405242136.i4OLaRtN003029@arbas.nms.ulrich-teichert.org>
	<200405242147.i4OLlVoZ012250@hiauly1.hia.nrc.ca>
	<20040525040929.GB1308@colo.lackof.org>
Reply-To: Randolph Chung <tausq@debian.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Ulrich Teichert <krypton@ulrich-teichert.org>,
 parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040525040929.GB1308@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> In other words, the next Debian release based on gcc 3.5 or later
> will require a 2.6 parisc kernel?

Not require, but some features will only work properly with a 2.6.x
kernel. Some features may cause unexpected behaviors with 2.4 kernels.

Let me explain this in a bit more detail.

As Dave mentioned, there is a case in gcc which is currently broken when
running 2.4 kernels, because sigcontext handling was broken in 2.4
kernels for 64-bit kernels. Carlos fixed this in 2.6.x (thanks Carlos).

The signal trampoline layout also changed in 2.6.x kernels, breaking 
backward compatibility for userspace applications that need to process 
the signal context structure. This has come up not only for gcc but for
some other applications (this topic comes up from time to time on 
debian-hppa).

Currently there is code in gcc to handle 32-bit 2.4 kernels, 32-bit 2.6
kernels and 64-bit 2.6 kernels. However, it appears that with 2.4
kernels there are still some bugs related to either mmap, signal
handling or unaligned trap handling that causes the gcc testsuite to
hang the machine from time to time. If you run a 64-bit 2.4 kernel than
some of the gcc unwinding stuff will not work at all.

It is certainly possible to fix this, if someone is so inclined.... but
there are many bugs to fix in 2.6, and i still have 70+ gdb bugs to fix
:) so it'll have to be someone else....

In a grand scheme of things, there is just a small portion of userspace
that will not work properly with a 2.4 kernel. Probably 95+% of users
will not notice... but it is still broken, and we need to make sure this
is clear and people understand that if something doesn't work, the only
"solution" may be to upgrade to 2.6.x kernels (unless someone steps up
to say they will maintain the 2.4.x kernel series for hppa). gcc is just
one example of where this will come up, there are probably some other
cases where things will be fixed with 2.6 kernels and won't work with
2.4. I don't think anyone will break anything intentionally for 2.4, but
most of the active developers are probably doing most of their work on
2.6, so 2.4 is not nearly as well tested.

I should also point out that, really, this is nothing new, we've
probably been operating in this mode for the last year; it's just
never been made explicit.. :)

thanks,
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
