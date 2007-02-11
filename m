From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] input constraints in atomic.h too loose ?
Date: Sun, 11 Feb 2007 12:59:19 -0500 (EST)
Message-ID: <200702111759.l1BHxJBD003332__41339.2244525768$1416624285$gmane$org@hiauly1.hia.nrc.ca>
References: <119aab440702110947u418c907eu19c3044230874df4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702110947u418c907eu19c3044230874df4@mail.gmail.com>
	from "Carlos O'Donell" at Feb 11, 2007 12:47:32 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> There was a reason I didn't force them to a register, but I can't
> remember. At this very moment I don't see why they couldn't have been
> "=r".

> Did you want to test "=r" and change the two stw's to copy's?

That won't work.  If these are global variables, you need the
*address* of the variables in registers and to use stw %rX,0(%Y)
instead of stw %rX,%Y.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
