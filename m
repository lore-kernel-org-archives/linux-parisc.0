From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Scheduling parent to run before vforked child calls exec or exit...
Date: Sun, 6 Dec 2009 12:56:57 -0500
Message-ID: <119aab440912060956m29182481qa0c85fe27e6c92d4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Kyle,

On Linux when a parent process calls vfork, the child process must run
without interruption by the parent until it executes exit or one of
the exec family functions. The parent process must be suspended until
the child calls exit or one of the execve family of functions.

While debugging an emacs failure I was able to reliable cause a
situation where the parent process was not suspended and the following
happened:

* Parent vfork's child
* Child starts.
* Parent is erroneously scheduled and calls close.
* Child attempts an ioctl on a file and sets errno to ENOTTY.
* Parent is scheduled again and checks the errno for close, which has
been clobbered by the child, and reports a failure.
* Parent kills child and exits with error ENOTTY.

Strictly according to POSIX the child should not have attempted an
ioctl, but on linux we expect the parent to be suspended and never see
an inconsistent memory state.

An strace of the parent process shows:
~~~
vfork(Process 24156 attached (waiting for parent)
Process 24156 resumed (parent 24155 ready)
)                                 = 24156
[pid 24156] close(4 <unfinished ...>
[pid 24155] close(5 <unfinished ...>
[pid 24156] <... close resumed> )       = 0
[pid 24155] <... close resumed> )       = 0
[pid 24155] close(3)                    = 0
[pid 24155] read(4,  <unfinished ...>
[pid 24156] setsid()                    = 24156
[pid 24156] setpgid(0, 0)               = -1 EPERM (Operation not permitted)
~~~
This indicates to me that 24155 and 24156 are being scheduled
concurrently, along with the failure that is only possible due to
interleaved execution. The child got to run a close(), and so did the
parent, the parent even started a read() before it was blocked and the
child continued.

This type of scheduling error could cause serious problems randomly in
every process that calls vfork. The more a child does before execve
the larger the window for the parent to be clobbered by the child.

How does the generic kernel infrastructure determine not to schedule
the parent of a vfork?

I've been reading through our arch/parisc/kernel/process.c and
kernel/sched.c without any success yet.

A quick hack to convince me that this is the situation would help. I'm
running your 2.6.32-rc6.

Cheers,
Carlos.
