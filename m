From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] sshd triggers Protection id trap
Date: Tue, 9 Jan 2007 21:05:33 -0500 (EST)
Message-ID: <200701100205.l0A25XjX006906__2768.08038256622$1416624260$gmane$org@hiauly1.hia.nrc.ca>
References: <20070109034731.GD1065@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 T-Bone@parisc-linux.org
To: kyle@parisc-linux.org (Kyle McMartin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070109034731.GD1065@athena.road.mcmartin.ca> from "Kyle
	McMartin" at Jan 8, 2007 10:47:31 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> echo p >/proc/sysrq-trigger or
> echo t >/proc/sysrq-trigger

Until I get the time to install a serial console, the above aren't
very useful.

> Would probably yield some useful information if the fucked process is still
> being scheduled.

I think all the hung processes aren't being scheduled.  strace shows
nothing and evertime I attach with gdb the processes are always at
exactly the same place.  It's killing the thread manager process that
crashes the system.  The others can be killed.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
