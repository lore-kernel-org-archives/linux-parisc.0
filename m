From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: CAS (lws_compare_and_swap32)
Date: Tue, 30 Mar 2010 16:38:08 -0400
Message-ID: <119aab441003301338o1d0582f3wdbf82681f88ed671@mail.gmail.com>
References: <4BB0B2C8.8000302@fsij.org>
	 <119aab441003290913x6cb925b9v66b44a14c31393cb@mail.gmail.com>
	 <119aab441003291231j320e6637g87c201f75ee61faf@mail.gmail.com>
	 <20100329200705.GE20286@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: NIIBE Yutaka <gniibe@fsij.org>, debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100329200705.GE20286@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Mar 29, 2010 at 4:07 PM, Kyle McMartin <kyle@mcmartin.ca> wrote:
> Can you bounce me the whole thread, please?

You saw the whole thread :-)

Niibe-san has pointed out that if you call LWS CAS on an address of a
shared page, that the COW process may call schedule and sleep, leaving
a small window for a race condition.

On SMP I don't think there is a problem:
* Thread A takes kernel LWS CAS lock.
* Thread A writes to CAS address causing COW
* Thread A sleeps.
* Thread B tries to take kernel LWS CAS lock, fails, returns EAGAIN to
userspace.
* Thread A eventually completes releasing kernel LWS CAS lock.
* Thread B finally takes kernel LWS CAS lock and carries out CAS operation.

Even though Thread A sleeps, there is no way to send it a signal at
this point. All signal delivery is initiated only via PA assembly in
entry.S/syscall.S and that avoids delivering a signal (do_signal, and
do_notify_resume not called) if execution is on the gateway page.

On UP you have a problem:
* Thread A enters LWS CAS (no lock on UP)
* Thread A writes to CAS address causing COW
* Thread A sleeps.
* Thread A completes COW, but finishes time slice before the write is restarted.
* Thread B enters LWS CAS (no lock on UP)
* Thread B writes to CAS address, and finishes time slice.
* Thread A writes to CAS address and clobbers B's value.

The solution is to add the locks to the UP case to avoid this problem.

Cheers,
Carlos.
