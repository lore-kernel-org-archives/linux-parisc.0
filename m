From: Kyle McMartin <kyle@there.is.no.cabal.ca>
Subject: Re: [parisc-linux] 2.6.12-rc3-pa3 usb keyboard and mouse don't respond
Date: Sun, 8 May 2005 13:27:45 -0400
Message-ID: <20050508172745.GG4694@roadwarrior.mcmartin.ca>
References: <200505081623.j48GNoF4003723@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200505081623.j48GNoF4003723@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, May 08, 2005 at 12:23:50PM -0400, John David Anglin wrote:
> I tried 2.6.12-rc3-pa3 yesterday but the console keyboard and mouse
> (usb) didn't respond after X came up.  I couldn't see any difference
> in the log files between this version and 2.6.11-pa4.  2.6.11-pa4
> boots ok.  Is this a known problem?
> 

I meant to look into this, but then got hit with finals and work. I'll
try to take a look today.

It appears to be a change in the OHCI driver. If you diff the dmesg
from 2.6.11-pa4 to anything later than 2.6.12-rc1 (iirc), a few
suspicious changes in what OHCI spews are revealed. (I believe it was
something about legacy i/o registers, or something). Just need a little
while to crawl through bkweb looking for changes there.

Cheers,
-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
