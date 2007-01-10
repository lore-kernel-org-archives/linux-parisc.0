From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] sshd triggers Protection id trap
Date: Wed, 10 Jan 2007 15:21:46 -0700
Message-ID: <20070110222146.GD29244__32761.0712535263$1416624261$gmane$org@colo.lackof.org>
References: <20070109034731.GD1065@athena.road.mcmartin.ca>
	<200701100205.l0A25XjX006906@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: T-Bone@parisc-linux.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200701100205.l0A25XjX006906@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Jan 09, 2007 at 09:05:33PM -0500, John David Anglin wrote:
> I think all the hung processes aren't being scheduled.  strace shows
> nothing and evertime I attach with gdb the processes are always at
> exactly the same place.  It's killing the thread manager process that
> crashes the system.  The others can be killed.

Running "make -j4" on a 2-way machine with 2.6.20-rc3, top shows
processes being scheduled only on CPU 0. CPU 1 is always idle.
This was reproducible with 2.6.20-rc[23] on a500 and rp3440.
I've verified this bug doesn't exist on 2.6.17-pa6.
I need to retest with something more recent (ie 2.6.19).

So I'm pretty sure we have a general scheduling bug and the above comments
suggest these might be related problem...no evidence of course.
Ideas on where I might start looking for the general bug?

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
