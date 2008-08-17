From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: missing compat_sys_ptrace conversions for mips and parisc
Date: Sun, 17 Aug 2008 10:31:18 -0400 (EDT)
Message-ID: <20080817143118.7CD574E77@hiauly1.hia.nrc.ca>
References: <48A8081A.4080609@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: hch@lst.de, kyle@mcmartin.ca, linux-mips@linux-mips.org,
	linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <48A8081A.4080609@gmx.de> from "Helge Deller" at Aug 17, 2008 01:14:34 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I could take care of this for parisc. Just looked into the code and it 
> seems it could cleanup the code nicely as well.
> 
> But I don't want to step on Kyle's toe, since I assume he prepares the 
> asm-parisc/ move in the parisc-2.6 git tree during the next days.
> 
> Kyle: any comments? Should I prepare some patches? Or do you want to 
> take care of the compat_sys_ptrace yourself?

In my builds, I noticed that there are also about five "new" syscalls 
that aren't wired up for parisc.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
