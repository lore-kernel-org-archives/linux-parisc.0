Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Thu, 16 Jan 2003 23:54:27 -0700
To: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Interesting network card ...
Message-ID: <20030117065427.GA11137@dsl2.external.hp.com>
References: <20030115085619.GA17760@aurinko.ntc.nokia.com> <20030116021111.GD8543@dsl2.external.hp.com> <20030116093028.GD17760@aurinko.ntc.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030116093028.GD17760@aurinko.ntc.nokia.com>
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

On Thu, Jan 16, 2003 at 11:30:28AM +0200, Nahkola Mikko wrote:
> > ...a newer kernel would be more interesting.
> 
> Recommendations?
...
> Any ready-built package that I should try,
...

Ideally, our CVS kernels: 32-2.4.20-pa21.tar.gz
autobuilt 32-bit kernels are on ftp.parisc-linux.org/kernels/32/ 
I can't say if they work "just fine" on C240 or not though
since I don't test that.

> > This does sound like a bug (fixed) in the tulip driver relating to
> > MII initialization. But I'm surprised to see it manifest on a C240.
> 
> What do you mean, surprised to see it manifest on a C240? How so?

The original problem seemed to be a CPU timing problem where the PHY reset
was not recovering faster than the CPU could pound down the next accesses
to the MII. I've only seen this on problem systems with 550Mhz or
faster CPUs (both parisc and ia64).

The fix is to follow the 802.x spec which describes the MII register
set and how to properly do a MII reset (involves some polling).
Details should be in the parisc-linux mail archive or lkml.

> BTW, the NIO 100BT is an interesting beast. It (or the driver) is the 
> only reason why one of our HP-UX boxes only gets about half an year max 
> uptime usually ... and has other "interesting" "features". 

If you have extras of those, I know someone who wants one.

> Notably it is a higher revision than the builtin adapter, and therefore I 
> wouldn't expect to need the de4x5 driver.

I don't either. I thought we had the tulip cards working just fine.

cheers,
grant
