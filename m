From: Joel Soete <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] sshd triggers Protection id trap
Date: Fri, 12 Jan 2007 18:50:29 +0000
Message-ID: <45A7D875.9050309__27598.801154136$1416624261$gmane$org@scarlet.be>
References: <20070109034731.GD1065@athena.road.mcmartin.ca>	<200701100205.l0A25XjX006906@hiauly1.hia.nrc.ca>
	<20070110222146.GD29244@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org,
 T-Bone@parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070110222146.GD29244@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Grant Grundler wrote:
> On Tue, Jan 09, 2007 at 09:05:33PM -0500, John David Anglin wrote:
>> I think all the hung processes aren't being scheduled.  strace shows
>> nothing and evertime I attach with gdb the processes are always at
>> exactly the same place.  It's killing the thread manager process that
>> crashes the system.  The others can be killed.
> 
> Running "make -j4" on a 2-way machine with 2.6.20-rc3, top shows
> processes being scheduled only on CPU 0. CPU 1 is always idle.
> This was reproducible with 2.6.20-rc[23] on a500 and rp3440.
the same with 2.6.20-rc4 with 32bit smp kernel on a d380.

> I've verified this bug doesn't exist on 2.6.17-pa6.
> I need to retest with something more recent (ie 2.6.19).
> 
mmm, some time ago it was easy to grab those src thanks to "Source Tarballs" but today how may I grab it from git?


Tia,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
