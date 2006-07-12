From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Uninterruptible sleep
Date: Wed, 12 Jul 2006 13:29:56 -0400 (EDT)
Message-ID: <200607121729.k6CHTvgp029697@hiauly1.hia.nrc.ca>
References: <44B48645.1010203@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org (Randolph Chung)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <44B48645.1010203@tausq.org> from "Randolph Chung" at Jul 12,
	2006 01:19:01 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> John David Anglin wrote:
> >   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
> > 
> >   17958 dave      16   0     0    0    0 D  0.0  0.0   0:00.00 Process_5.exe
> >   18055 dave      15   0     0    0    0 D  0.0  0.0   0:00.02 Process_6.exe
> > 
> > Anybody got any ideas how processes can end up sleeping forever?  The
> > above two processes have been sleeping for more than a day.  This is
> > a 32-bit kernel 2.6.17-rc3-pa3.
> 
> can you try doing a sysrq-t and see where they are stuck? This is most
> easily done on a serial console by sending a break, and then 't'. If you
> are telneting to a GSP console you can escape out to the telnet prompt
> and type "send break".

These were left over from the libjava testsuite and I subsequently tried
to kill them.  I don't have a terminal connection to these processes.
So, all I could do is attach to the process with gdb or strace.

I've rebooted the system so these two are lost but it probably will happen
again.  Something changed in the libjava process support and we are getting
testsuite errors again.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
