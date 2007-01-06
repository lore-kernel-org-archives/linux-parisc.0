From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] sshd triggers Protection id trap
Date: Sat, 6 Jan 2007 13:18:09 -0500 (EST)
Message-ID: <200701061818.l06II9wm002956__47335.4361871772$1416624255$gmane$org@hiauly1.hia.nrc.ca>
References: <7d01f9f00701051834l4766fe0aya242c808bffbc407@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: T-Bone@parisc-linux.org (Thibaut VARENE)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00701051834l4766fe0aya242c808bffbc407@mail.gmail.com>
	from "Thibaut VARENE" at Jan 6, 2007 03:34:22 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> After another attempt I could eventually log in again and thought this
> "wasn't much" (so to speak). Then after a few more hours I realized
> the loadavg on the machine was abnormally high. A sshd process was
> taking 100% of CPU time. I tried to kill it (with SIGTERM first,
> twice), and as it wouldn't terminate I issued a SIGKILL, which had the
> very nice effect of taking down the whole machine, spitting endless
> regdumps on the console (see the last dump of the following log).
> 
> The console log / short story is here:
> http://www.pateam.org/archive/dumps/sshd-code27

This appears to be the same problem as I'm having killing hung
java processes.  When I went in this morning to reboot the machine,
it was looping endlessly at the same spot.  It had some hung java
processes and I had tried to do a "shutdown -r +0".  I'm seeing
this with 32bit UP kernel, so I don't think using a UP kernel is
a workaround.

I'd look at the dumps for the protection id traps.  Possibly,
there might be a clue there as to what went wrong.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
