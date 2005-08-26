From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Latest 2.6.13-rc6-pa2 test pr :_(
Date: Fri, 26 Aug 2005 11:29:42 -0400 (EDT)
Message-ID: <200508261529.j7QFTghD015759@hiauly1.hia.nrc.ca>
References: <ILU3F9$C3BA108CF7E2FE4DECDD367F36FD15E5@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 tsg45800@scarlet.be
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <ILU3F9$C3BA108CF7E2FE4DECDD367F36FD15E5@scarlet.be> from "Joel
	Soete" at Aug 26, 2005 04:40:21 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > After another couple of hours of poking at this with gdb, I think
> > we have a kernel bug.  The saved r2 value in the signal context
> > appears to contain the pc where the exception occurred instead of
> > the r2 value when the exception occured.  As a result, the unwind
> > process goes into a loop when an exception occurs in a function
> > which hasn't saved r2 in the frame.
> > 
> Ah, that why my stress test made again hang the b2k apparently at the same
> place as the original mail:
> hpmc pointing to the same bad value (IAOQ = 0x00000000000172b8)
> 
> while TOC always show a pb in internal_add_timer():
> GR[02] == rp = 00000000101319b4

I don't see how these are related.  I'm talking about the value of
r2 saved in the context passed to a signal handler.  Normally, the
code that generated an exception isn't restarted, so a bad value
for r2 doesn't usually affect the application.  In the java case,
the java runtime is attempting to unwind the stack of the application
and needs the r2 value for this.  Note that this is the context
passed to a user application.

In the above, the TOC rp value is a kernel address.  The hpmc
IAOQ value is probably in PDC code.  Most likely, this occurs when
the machine is probing devices while rebooting.  I see this on my
c3k all the time when I press TOC.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
