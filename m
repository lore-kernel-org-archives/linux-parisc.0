Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9459B482B
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Nov 2001 07:21:37 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 64C3EB00C; Mon,  5 Nov 2001 14:22:50 +0000 (GMT)
Date: Mon, 5 Nov 2001 14:22:50 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Herb Radford <herbr@magma.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Booting C200
Message-ID: <20011105142250.F8938@linuxcare.com>
References: <3.0.5.32.20011105071636.0191f530@mail.magma.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3.0.5.32.20011105071636.0191f530@mail.magma.ca>; from herbr@magma.ca on Mon, Nov 05, 2001 at 07:16:36AM -0500
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

On Mon, Nov 05, 2001 at 07:16:36AM -0500, Herb Radford wrote:
> OK, I found some stuff in the archive on the "Chassis Codes" and set up an
> old laptop as a terminal, disconnected the keyboard (and mouse) and booted.
> Now I tried this with the disk out of my 712/60 and the C200 is not hung.
> It proceeds through the boot process and then hangs on starting cron.

Hmm, the next thing would be the login prompt.  Has it really hung,
or is the inittab from your 712/60 set up to only issue a getty on
the graphical console?

Richard
