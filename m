From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPMC in lba_pat_out8 on rp3440
Date: Wed, 17 Nov 2010 11:03:18 -0500 (EST)
Message-ID: <20101117160319.984F14DA1@hiauly1.hia.nrc.ca>
References: <20101117052218.GB27930@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, grundler@parisc-linux.org,
	linux-parisc@vger.kernel.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101117052218.GB27930@lackof.org> from "Grant Grundler" at Nov 16, 2010 10:22:18 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On that note, can you try a 32-bit kernel? (SMP maybe)

rp3440 doesn't support a 32-bit kernel.  I don't have a 32-bit SMP
machine.  I did try a UP 2.6.36 kernel on my c3750.  It crashed doing
its first gcc build.  Don't know why.  My 2.6.34.7 build is stable.

Now that I have a UP 2.6.36 kernel running on the rp3440, I plan
to retry a SMP kernel with same config.  Possibly the issue that
started the thread was another miscompilation.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
