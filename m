From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPPA hang with PCI SERR or PARITY enabling
Date: Fri, 31 Jul 2009 10:50:15 -0400 (EDT)
Message-ID: <20090731145016.76AAE4FB1@hiauly1.hia.nrc.ca>
References: <20090731144654.F3D374CFD@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: varenet@parisc-linux.org, mroos@linux.ee, randolph@tausq.org,
	linux-parisc@vger.kernel.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090731144654.F3D374CFD@hiauly1.hia.nrc.ca> from "John David Anglin" at Jul 31, 2009 10:46:53 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> hppa64-linux-gnu-objdump vmlinux-2.6.29-2-parisc64-smp | less

Sorry, this should be:

hppa64-linux-gnu-objdump -d vmlinux-2.6.29-2-parisc64-smp | less

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
