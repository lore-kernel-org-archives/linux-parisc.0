Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 6 Jun 2003 11:22:56 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Zlatan Jukic <zlatan.jukic@fh-vorarlberg.ac.at>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Debian - Linux 3.0 on HP PA-RISC C360
Message-ID: <20030606172256.GA17848@dsl2.external.hp.com>
References: <1EB1A4E066D0D411BD330008C79F06AE022EC52C@yang.tvlbg.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1EB1A4E066D0D411BD330008C79F06AE022EC52C@yang.tvlbg.ac.at>
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

On Fri, Jun 06, 2003 at 02:33:14PM +0200, Zlatan Jukic wrote:
> My question is:  There is the possibility with these FX4 card the X-Windows
> system to start,

no.

> or must I insert another card (and which??) in order to
> start X-Windows? 

Yes. PCI Vis-EG or one of the HP GSC gfx card.

> I heard that Visualize FX4 run only under so-called "STICON",  unfortunately
> I do not know details also?!  

Yes. STICON supports "text" mode only.
Ie no frame buffer and thus no X11 support.

grant
