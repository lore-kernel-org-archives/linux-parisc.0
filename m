Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Tom <palinux@alaskatech.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.16-pa24 crashes on c3k 
In-Reply-To: Message from Tom <palinux@alaskatech.org>
   of "Tue, 25 Dec 2001 09:50:54 -0900." <Pine.LNX.4.33.0112250945530.486-100000@goliath.alaskatech.org>
References: <Pine.LNX.4.33.0112250945530.486-100000@goliath.alaskatech.org> 
Date: Tue, 25 Dec 2001 22:01:28 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20011226050128.821554833@dsl2.external.hp.com>
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

Tom wrote:
> I just reloaded my C180 with the 0.93 ISO and updated to -pa24 and it's
> working fine.

Ok - good to know. I wasn't using the default config file.
But I tried the default config and that dies with similar
console output. I need to lookup the IOAQ and GR02 and try
to figure out how it got there. Must be something related
to suckyio since I'm not using any graphics console and that's
about when console switches over.

BTW, with -pa20, I did try eepro100 driver with both an i82559
and i82550 NIC. I didn't stress either hard (55Mb/s to my laptop
via crossover cable) but they basically work with ftp. I know one
small patch is needed for the 2.4.16 eepro100 driver and hopefully
we'll pick that up with the next merge.

grant
