From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] sshd triggers Protection id trap
Date: Sun, 14 Jan 2007 20:19:29 -0500 (EST)
Message-ID: <200701150119.l0F1JTYf003607__49895.4403134578$1416624263$gmane$org@hiauly1.hia.nrc.ca>
References: <20070115003643.GD2687@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 T-Bone@parisc-linux.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070115003643.GD2687@athena.road.mcmartin.ca> from "Kyle
	McMartin" at Jan 14, 2007 07:36:43 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Mon, Jan 15, 2007 at 01:16:00AM +0100, Thibaut VARENE wrote:
> > 
> > I don't know if that's related but it seems that 1 out of 2 boot
> > attempts the kernel doesn't get past the startup of INIT and freezes
> > there. I don't think this is my 'ldap' bug because this box is
> > properly configured to avoid it. Something else is happening I
> > suppose....
> > 
> 
> I'm seeing this too with 2.6.20-rc5 on SMP, I don't see it with -rc4, or when
> booting a UP kernel. Will bisect to find what's going on.

I'm running 2.6.20-rc3 UP.  It's been up ten days doing GCC builds.
There's the occassional SEGV in user processes, particularly building
libjava.  I got rid of ldap since I don't use it and it was causing
boot problems.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
