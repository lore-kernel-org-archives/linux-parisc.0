Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA23074
	for <parisc-linux@puffin.external.hp.com>; Tue, 8 Feb 2000 11:15:22 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 8 Feb 2000 17:11:03 -0000
Received: from unknown (HELO boilermaker.thepuffingroup.com) (216.208.98.2)
  by smtp.linuxcare.com with SMTP; 8 Feb 2000 17:16:28 -0000
Date: Tue, 8 Feb 2000 12:18:11 -0500 (EST)
From: "Dave O'Neill" <doneill@linuxcare.com>
To: Phil Schwan <phil@linuxcare.com>
cc: "T. Martin" <catfish@alltel.net>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] PA-RISC User Land
In-Reply-To: <20000206131907.B22105@linuxcare.com>
Message-ID: <Pine.LNX.4.10.10002081211530.11042-100000@boilermaker.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sun, 6 Feb 2000, Phil Schwan wrote:

> Not just yet; Dave O'Neill is working on making the SOM linker
> cross-platform friendly (I believe he has it working on HPUX, and now 
> needs to squash endian-related bugs).  I'm sure he'd love a helping
> hand...

Sure, if you're interested in taking a look, I'd love it.  The linker is
in CVS (under linker/).  

A little status update:  Right now, it manages to parse and load (possibly
even correctly) the object files, but it still chokes on libraries, and
doesn't yet output anything.

Dave
-- 
Dave O'Neill, Linux Consultant, Linuxcare, Inc.
doneill@linuxcare.com, http://www.linuxcare.com/ 
Linuxcare. Support for the revolution.
