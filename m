Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 21 Jan 2003 16:57:16 -0700
To: jsoe0708@tiscali.be
Cc: Randolph Chung <tausq@debian.org>,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] new gcc-default for hppa
Message-ID: <20030121235716.GA2193@dsl2.external.hp.com>
References: <3DED9A6600005A12@ocpmta3.freegates.net> <3E1AA52C0000167E@ocpmta1.freegates.net> <20030116014145.GC8543@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030116014145.GC8543@dsl2.external.hp.com>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Wed, Jan 15, 2003 at 06:41:45PM -0700, Grant Grundler wrote:
> In any case, doesn't look like a problem with tulip driver.
> I'll let someone else keep poking at this.

I retried this again last night on the c3k.
But this time I used an eepro100 driver and cross-over cable.
Several interesting differences:
o HPMCs instead of panic
o attempting to ssh to the c3k as "root" results in "permission denied"
  and no HPMC or panic
o GR02/IOAQ points at pty data struct not getting setup correctly.
  (I've got some of the data written down at home, just not here)
o iptables based firewall running on tulip NIC was showing packets
  getting LOGd and DROPd. ie ethernet traffic was coming in on the NIC.

Given that pty code works for X11, something must not be getting
initialized correctly for tcp connections.  And since all of the
TCP code and mid-level pty mgt is arch independent, I'm starting
to believe this is a toolchain bug.

Stephan Eranian had a good idea - replace .o's in the gcc 3.2
built kernel tree with .o's built using gcc-3.0. Then maybe we
can narrow down where the issue is.

grant
