From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] killing a set of user processes causes system
	reboot
Date: Sat, 16 Dec 2006 20:29:26 +0100
Message-ID: <200612162029.26621.deller__1296.01390003717$1416624233$gmane$org@gmx.de>
References: <200612161736.kBGHa4sZ021645@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200612161736.kBGHa4sZ021645@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Saturday 16 December 2006 18:36, John David Anglin wrote:
> > FYI I've been running gcc builds on my c3k to reproduce this, but I
> > haven't seen anything like this.
> 
> A little more info.
> 
> I'm seeing this almost every time with GCC 4.2.0 branch using
> vmlinux-2.6.18-rc7-pa1 or vmlinux-2.6.19-g211c7899-dirty.  The
> kernels are 32-bit with the default c3000 config.  It's happened
> in the last two builds and checks running the libjava testsuite.
> The tests timeout, so I would think the dejagnu/tcl framework
> would have tried to kill them when the timeout occured.
> 
> Within a group of processes that are stuck, I can kill all but one
> without causing a system reboot.  The processes appear stuck in the
> kernel.  I don't see any activity with strace.
> 
> I often see this with the Process_3.java test.  For example,
> http://gcc.gnu.org/ml/gcc-testresults/2006-12/msg00637.html

Hi Dave,

does it happen on 64bit kernel as well ?
If not, maybe you could try my (ugly & temporary) kernel patch from http://lists.parisc-linux.org/pipermail/parisc-linux/2006-December/030967.html ?

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
