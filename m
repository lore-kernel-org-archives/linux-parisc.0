Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep13-int.chello.at (viefep13-int.chello.at [213.46.255.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id 86BFB4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Sep 2002 12:00:49 -0600 (MDT)
Message-ID: <3D7E334B.98E1AC47@gmx.at>
Date: Tue, 10 Sep 2002 20:00:43 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Cc: parisc-linux@lists.parisc-linux.org,
	Ryan Bradetich <rbradetich@uswest.net>
Subject: Re: [parisc-linux] E55
References: <20020910050039.46620.qmail@web12506.mail.yahoo.com>
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

I have the E55 as it is, without any additional card, 
and with my PDC Console driver I can completely boot
the system and work on it. BUT: Only via NFS Root,
as there is currently no SCSI support, no support
for the MUX (except port 0 as console with the PDC
driver) and without parallel (printer) port.

But Linux runs completely, including login, remote
X usage (xterm, etc...), access to the internet via
LAN, etc, ....

Hi Ryan, you have found the device ? This one on the
BC ? Sounds gooooooood !

Christoph


Derek Engelhaupt wrote:
> 
> I was just curious how far in the boot process you E55 guys get.  I
> just tried to load the one I have in the office tonight.  I retrofitted
> it with an A1703-60003 LAN/Console/SCSI card I pulled out of one of our
> "crash and burn" H70 boxes.  It gets past the "console" message about
> "if this is the last thing you see" then starts dumping the stacks and
> ends in a Kernal error 15.  This card doesn't use the mux port to
> connect the console it uses a PS/2 type connector to the card and a
> DB25 connector to the terminal.  Just wanted to see how this compares
> to the other E Series machines out there.
> 
> derek
> 
> __________________________________________________
> Yahoo! - We Remember
> 9-11: A tribute to the more than 3,000 lives lost
> http://dir.remember.yahoo.com/tribute
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
