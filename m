Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tdl.com (tdl.com [206.180.224.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0612B482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 16 Oct 2001 12:49:59 -0600 (MDT)
Date: Tue, 16 Oct 2001 11:49:54 -0700
From: Randall Craig <randall@tdl.com>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: paul lee <wbm111us@yahoo.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Help - Serial console problem
Message-ID: <20011016114954.A12041@tdl.com>
References: <wbm111us@yahoo.com> <200110161840.MAA15315@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200110161840.MAA15315@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Tue, Oct 16, 2001 at 12:40:22PM -0600
List-ID: <linux-parisc.vger.kernel.org>

* Grant Grundler (grundler@puffin.external.hp.com) [011016 11:44]:
> paul lee wrote:
> > I could not access a C200 workstation via serial
> > console. Could someone please give me some insight?
> > I use hyperterminal on Win 2000. The settings are
> > VT100, 9600, 8-N-1 and Xon/Xoff.
> 
> The settings are correct.
> It's possible the serial cable isn't wired correctly
> or the C200 isn't trying to use serial port1.
> 

make sure that on the c200 that you set you console as serial.

ie, issue this command on the firmware command line:

	path con serial_1

which will change the console graphics to be displayed on you 1st
serial port (the top one).
