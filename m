Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Tom <palinux@alaskatech.org>
Cc: PA-RISC Linux List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] LibC errors on C180 install 
In-Reply-To: Message from Tom <palinux@alaskatech.org>
   of "Wed, 19 Dec 2001 10:51:41 -0900." <Pine.LNX.4.33.0112191033240.1400-100000@goliath.alaskatech.org>
References: <Pine.LNX.4.33.0112191033240.1400-100000@goliath.alaskatech.org> 
Date: Wed, 19 Dec 2001 13:01:33 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20011219200133.8E40A482A@dsl2.external.hp.com>
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
> I had a segfault in the base-config, which bombed the rest of the install.

"debsums -s" will tell you which packages got corrupted during install.
Sounds like you could mount the CD and "dpkg -i" the base packages again.
Then run apt-get update/dist-upgrade.

grant
