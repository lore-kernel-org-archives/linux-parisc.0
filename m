Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 101D0486E
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Jun 2002 10:43:42 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17L524-0005La-00; Thu, 20 Jun 2002 17:43:40 +0100
Date: Thu, 20 Jun 2002 17:43:40 +0100
From: Matthew Wilcox <willy@debian.org>
To: Joachim Steiger <roh@hyte.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] serial on hp712/80 buggy?
Message-ID: <20020620174340.Z9435@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.21.0206201644330.4291-100000@reactor.hyte.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0206201644330.4291-100000@reactor.hyte.de>; from roh@hyte.de on Thu, Jun 20, 2002 at 04:49:12PM +0200
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

On Thu, Jun 20, 2002 at 04:49:12PM +0200, Joachim Steiger wrote:
> i just played around with my machine and stated that setting the baudrate
> on the serial(rs232) to 57600(8n1) didnt work...
> using 9600baud works ok

according to the lasi ERS, provided on the website, the lasi serial port
works up to 454k baud.  it's supposed to programmatically identical to
the 16550A.

-- 
Revolutions do not require corporate support.
