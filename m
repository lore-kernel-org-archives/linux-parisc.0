Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA28391
	for <parisc-linux@puffin.external.hp.com>; Sun, 6 Feb 2000 15:34:11 -0700
Date: Sun, 6 Feb 2000 13:19:08 -0800
From: Phil Schwan <phil@linuxcare.com>
To: "T. Martin" <catfish@alltel.net>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] PA-RISC User Land
Message-ID: <20000206131907.B22105@linuxcare.com>
References: <Pine.LNX.4.10.10002061518320.22811-100000@jesse.crash.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.10.10002061518320.22811-100000@jesse.crash.lan>; from T. Martin on Sun, Feb 06, 2000 at 03:21:24PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Feb 06, T. Martin wrote:
>  I don't have room for gcc on the machine is there a way to cross-compile
> a kernel off an x86 machine? 

Not just yet; Dave O'Neill is working on making the SOM linker
cross-platform friendly (I believe he has it working on HPUX, and now 
needs to squash endian-related bugs).  I'm sure he'd love a helping
hand...

-Phil

-- 
Phil Schwan, Senior Linux Consultant, Linuxcare, Inc.
415.354.4878 x271 tel, 415.701.7457 fax
pschwan@linuxcare.com http://www.linuxcare.com/
Linuxcare.  Support for the revolution.
