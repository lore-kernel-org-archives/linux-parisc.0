Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.uct.ac.za (mail.uct.ac.za [137.158.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 325CE4829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Apr 2003 02:24:17 -0700 (MST)
Date: Wed, 2 Apr 2003 11:23:52 +0200
From: Michael Wood <mwood@its.uct.ac.za>
To: Derek Ellis <Derek.Ellis@us.fortis.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] soft power and power light on 712/60
Message-ID: <20030402092352.GA10035@marmite.its.uct.ac.za>
References: <se89551b.093@internal.us.fortis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <se89551b.093@internal.us.fortis.com>
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

On Tue, Apr 01, 2003 at 08:59:43AM -0600, Derek Ellis wrote:
> Hello,
> 
> I have sort of a weird problem.  I installed Debian 3.0 on Sunday and
> it came up great on my 712/60.  The only problem is the soft-power
> switch doesn't work and the power light flashes while searching for
> the boot device and then goes off once it starts booting.  

I don't know about the light, but a kernel upgrade might help the
switch.  Earlier kernels did not enable the power switch.  Not sure
which version made it work (although I thought the kernel on the Debian
3.0 CDs supported it.)  I haven't had a chance to run parisc linux for a
while, unfortunately, and the D270 I was using did nothing when the
power switch was switched, although the kernel I was running was
supposed to enable it, so maybe the kernel doesn't enable it for all
parisc machines?  (The switch did work in HPUX and I think it even
worked at some point in Linux and later stopped.)

-- 
Michael Wood <mwood@its.uct.ac.za>
