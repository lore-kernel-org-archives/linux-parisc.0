Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.uct.ac.za (mail.uct.ac.za [137.158.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 87345482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Nov 2001 06:07:18 -0700 (MST)
Received: from marmite.its.uct.ac.za ([137.158.26.155])
	by mail.uct.ac.za with smtp (Exim 3.33 #4)
	id 163Gpd-000AuO-00
	for parisc-linux@lists.parisc-linux.org; Mon, 12 Nov 2001 15:08:57 +0200
Date: Mon, 12 Nov 2001 15:05:54 +0200
From: Michael Wood <mwood@its.uct.ac.za>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Booting C200
Message-ID: <20011112150554.A10533@marmite.its.uct.ac.za>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

On Mon, Nov 05, 2001 at 02:22:50PM +0000, Richard Hirst wrote:
> On Mon, Nov 05, 2001 at 07:16:36AM -0500, Herb Radford wrote:
> > OK, I found some stuff in the archive on the "Chassis Codes"
> > and set up an old laptop as a terminal, disconnected the
> > keyboard (and mouse) and booted.  Now I tried this with the
> > disk out of my 712/60 and the C200 is not hung.  It proceeds
> > through the boot process and then hangs on starting cron.
> 
> Hmm, the next thing would be the login prompt.  Has it really
> hung, or is the inittab from your 712/60 set up to only issue
> a getty on the graphical console?

Yes, I had this sort of problem.  The D270 I have access to only
has a serial console.  The debian installation program kept
bombing out at the end, so I eventually managed to get
something working using debootstrap manually.  Then it seemed to
hang after starting crond although it worked fine with
init=/bin/bash.  I realised it was starting gettys on
/dev/tty[1-6] and not on /dev/ttyS0, so I commented out the
virtual console lines in /etc/inittab and uncommented the
/dev/ttyS0 one and things are working much better :)

I did see some nasty fs corruption (ext2) though, but I am not
sure if this is caused by a bad disk or bad termination etc. or
buggy drivers...  I'll post again if I narrow it down more.

-- 
Michael Wood <mwood@its.uct.ac.za>
