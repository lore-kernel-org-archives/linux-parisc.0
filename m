From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] fpu emulation: another stupid question
Date: Fri, 14 Jan 2005 20:23:09 -0500 (EST)
Message-ID: <200501150123.j0F1N95l021258@hiauly1.hia.nrc.ca>
References: <20050115011132.GB18497@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 matthew@wil.cx
To: randolph@tausq.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050115011132.GB18497@tausq.org> from "Randolph Chung" at Jan
	14, 2005 08:11:32 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > I'd've thought that'd be the unaligned trap handler rather than the FP
> > emulation code, but you may be right -- I don't care to look too hard ;-)
> 
> willy is right, the unaligned trap handler handles this case.
> 
> the fp emulation code also handles some fp format conversions. if you
> look in the archives you'll find a test case that is very very slow on
> pa-linux compared to hpux. it's something that should be looked into at
> some point.

There are differences between the floating point support in PA 1.x and
2.0 (e.g., 1.x doesn't have fneg and some of the conversion functions
that 2.0 implements in hardware).  If the kernel supports long doubles,
let me know.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
