Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 17 Jun 2003 14:06:40 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Zlatan Jukic <zlatan.jukic@fh-vorarlberg.ac.at>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20030617200640.GB10581@dsl2.external.hp.com>
References: <1EB1A4E066D0D411BD330008C79F06AE022EC544@yang.tvlbg.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1EB1A4E066D0D411BD330008C79F06AE022EC544@yang.tvlbg.ac.at>
Subject: [parisc-linux] Re: Visualize EG card on HP PARISC C360
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

On Tue, Jun 17, 2003 at 04:17:02PM +0200, Zlatan Jukic wrote:
> I could not start unfortunately the X-Windows system, because it is not
> supported by Fx-4 video card.?!

correct

> My question is here:  Must I insert another card (and which??),  in order to
> start X-Windows-system?

> According to Debian HPPA, the Visualize EG should correct to function.  

yes. *PCI* version of the card.
Vis-EG HSC card might also work.

> This card is a 24-bit-video-card, which is recognized in the best way under
> Linux as "Coral" with HP 715-64, 

Is that really a Vis-EG HSC card?
Can you post "dmesg" output where STI describes the card?

grant
