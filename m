From: Matt Taggart <matt@lackof.org>
Subject: Re: [parisc-linux] ELF ABI Documents
Date: Thu, 20 Apr 2006 01:56:21 -0700
Message-ID: <20060420085621.A64FC1AACC6@cyrix.home.bogus>
References: <200604181436.k3IEaG06004632@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <200604181436.k3IEaG06004632@hiauly1.hia.nrc.ca> 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


"John David Anglin" writes...

> One of the criticisms of the LSB is that it simply documents what is
> and in large measure it just refers to other specifications.

1) The LSB is a trailing-edge standard, they don't "invent" standards, they 
just document the standards that are accepted and in use. The work coming up 
with new standards is being done elsewhere. (X.org and freedesktop.org for 
example)
2) Referring to other specs is a good thing, why reinvent the wheel?

> Whereas, specifications such as POSIX have been written by people
> aware of the subtle tradeoffs between different implementations
> and they try to actually specify an implementation.

To be fair, the LSB is in a hard position. On one hand you have application 
developers demanding an implementation "We want a solid predictable 
implementation that we can test on" and on the other you have the Linux 
distros screaming "Don't take away our right to innovate! Just stick to 
documenting interfaces and we'll make sure our implementations are compliant 
with them". What the LSB has done to try and balance in the middle is define a 
"sample implementation" rather than a "reference implementation". The LSB gets 
asked once a month "can't you just get all the Linux distros to agree on an 
implementation, or declare one of them the winner that everyone should use?" 
IMO the UnitedLinux, DCC, and UserLinux consortiums were all created with that 
as a goal.

There is also some communication between the LSB workgroup and the Austin 
Group and they are both benefitting from the other's work.

> If it's
> possible to obtain full community support, it's more likely that the
> document would be useful and a guide to implementors.  However,
> just documenting what is would be useful.

Here, here! And don't worry about doing the work via the LSB, just produce the 
standard and the LSB will adopt it when it makes sense.

-- 
Matt Taggart
matt@lackof.org


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
