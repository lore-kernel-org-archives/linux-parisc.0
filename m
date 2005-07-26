From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Latest palinux crash
Date: Tue, 26 Jul 2005 12:37:04 -0400 (EDT)
Message-ID: <200507261637.j6QGb4vs008289@hiauly1.hia.nrc.ca>
References: <42E0F61D.5030001@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: carlos@systemhalted.org,
 parisc-linux@parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42E0F61D.5030001@tiscali.be> from "Joel Soete" at Jul 22,
	2005 01:35:25 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> (but I could never experiment it because of it's so big size: iirc about 60Mb for the 2.4 and this time my dump (swap) area was too 

That doesn't make sense.  The addition of debug info shouldn't change
the size of a core dump.  It's the code and data needed to actual do
the dump that increases the kernel size.

> > I recommend building
> > with -O1 instead of -O2.
> > 
> mmm could it not be too much invasive?

I don't think so.  Optimization shouldn't change code behavior.  While
it's true that a change in execution speed might break some realtime
code, if this happens in linux, it's probably a bug.

> I mean we are going to change completely the insn flow and btw the time diagram as I experiment:
> some weeks ago, I was working on ccio-dma for 64bit kernel on a d380 on which I noticed a dramtic slow down of the boot (more then 
> an hour in place of 5 min for its 32bit twin).

In most cases, there's only a small change in execution speed and sometimes
-O1 is faster.  The above change is abnormally large and suggests that a
major chunk of code is being optimized away.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
