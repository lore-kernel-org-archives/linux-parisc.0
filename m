From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [REGRESSION] 2.6.25 on parisc - CPU 1 is stuck
Date: Tue, 22 Apr 2008 20:54:38 -0400
Message-ID: <20080423005438.GK19802@phobos.i.cabal.ca>
References: <20080420231818.GA2162@ska.dandreoli.com> <1208789018.3640.6.camel@localhost.localdomain> <20080423004440.GB21544@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Domenico Andreoli <cavokz@gmail.com>,
	Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S933920AbYDWAzD@vger.kernel.org>
In-Reply-To: <20080423004440.GB21544@colo.lackof.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Apr 22, 2008 at 06:44:40PM -0600, Grant Grundler wrote:
> 
> *nod* I don't expect CPUs to show up in inventory if they are
> deconfigured in BCH. Maybe J-class firmware has this wrong? *shrug*
> Something worth checking I guess.
> 

i booted the kernel from my rp3440 on my j6000. i also get this cpu1 is
stuck message. putting a panic in the SMP C-code entrypoint is never
hit.

most oddly, putting a hpmc-causing insn sequence in the entry point
doesn't trigger either, so the cpu isn't coming out of the rendezvous.

even more oddly, the stwa insn in the bring up code looks fine.

--kyle
