From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Fixed strace [ was Re: ls -l is broken ]
Date: Tue, 5 May 2009 13:22:28 -0400
Message-ID: <20090505172228.GB3094@bombadil.infradead.org>
References: <20080417075357.GB23641@phobos.i.cabal.ca> <20090502223459.BC8924EE8@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, matthew@wil.cx,
	linux-parisc@vger.kernel.org, debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090502223459.BC8924EE8@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, May 02, 2009 at 06:34:59PM -0400, John David Anglin wrote:
> Hi Kyle,
> 
> > On Sun, Apr 06, 2008 at 07:09:59PM -0400, John David Anglin wrote:
> > > > If you strace it, what syscall returns -EOPNOTSUPP?
> > > 
> > > strace is broken and quits before the relevant syscall.  Think I
> > > mentioned this before is a different context.
> > > 
> > 
> > Fixed & updated strace available at
> > http://people.debian.org/~kyle/strace/
> 
> strace is either broken again or debian didn't pick up your fix.  The link
> to your updated version is broken.
> 
> This happens when tracing sshd during a connection attempt with -f option:
> 
> strace -f -p 2390
> Process 2390 attached - interrupt to quit
> _newselect(7, [3 4], NULL, NULL, NULL
> ...
> [pid  5627] open("/etc/selinux/config", O_RDONLY|O_LARGEFILE) = -1 ENOENT (No such file or directory)
> upeek: ptrace(PTRACE_PEEKUSER,5627,4294967292,0): Input/output error
> Process 5627 detached
> <... _newselect resumed> )              = 1 (in [6])
> 

Hmm, I'm seeing strace (4.5.18-1) segfault on sys_rt_sigaction. Rather
confused as to why though,

(gdb) 
#0  0x0002b3ec in __canonicalize_funcptr_for_compare ()
#1  0x00026010 in sys_rt_sigaction (tcp=0x4e060) at ../signal.c:1886
#2  0x00017b10 in trace_syscall (tcp=0x4e060) at ../syscall.c:2553
#3  0x00016c98 in main (argc=<value optimized out>, argv=0xbff8202c)
    at ../strace.c:2475

which is:

                if (sa.__sigaction_handler.__sa_handler == SIG_ERR)
                        tprintf("{SIG_ERR, ");

where:

struct new_sigaction
{
        union
        {
                __sighandler_t __sa_handler;
                void (*__sa_sigaction) (int, siginfo_t *, void *);
        }
        __sigaction_handler;

which isn't materially different from upstream (just the union...)

regards, Kyle

